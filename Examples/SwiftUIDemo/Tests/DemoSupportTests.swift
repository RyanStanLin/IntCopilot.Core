import Foundation
import Testing
import IntCopilotCore
@testable import DemoSupport

private enum MockFailure: Error { case failed }

private actor RecordingTransport: HTTPTransport {
    var requests: [HTTPRequest] = []
    var storedCookies: [SessionCookie] = []
    let fail: Bool
    init(fail: Bool = false) { self.fail = fail }
    func send(_ request: HTTPRequest) throws -> HTTPResponse {
        requests.append(request)
        if fail { throw MockFailure.failed }
        return HTTPResponse(statusCode: 200, body: Data("{}".utf8))
    }
    func count() -> Int { requests.count }
    func cookies() -> [SessionCookie] { storedCookies }
    func restoreCookies(_ values: [SessionCookie]) { storedCookies = values }
    func clearCookies() { storedCookies = [] }
}

@Test func confirmedReadOnlyCatalogCanBeQueried() async throws {
    for platform in [Platform.parent, .teacher] {
        let base = RecordingTransport(), guarded = try GuardedTransport(platform: platform, base: base)
        let endpoints = try APIContractCatalog.endpoints(platform: platform)
        let confirmed = endpoints.filter { $0.safety == .readOnly && $0.safetyConfirmed && $0.hasExternalSideEffects == false }
        #expect(!confirmed.isEmpty)
        for endpoint in confirmed {
            let concrete = endpoint.path.replacingOccurrences(of: "\\{[^}]+\\}", with: "123", options: .regularExpression)
            let host = platform == .parent ? "pcd.intschool.cn" : "teacher.intschool.cn"
            _ = try await guarded.send(HTTPRequest(url: URL(string: "https://"+host+concrete)!, method: endpoint.method))
        }
        #expect(await base.count() == confirmed.count)
    }
}

@Test func allBusinessWritesAndUnknownReadsAreBlocked() async throws {
    for platform in [Platform.parent, .teacher] {
        let base = RecordingTransport(), guarded = try GuardedTransport(platform: platform, base: base)
        let descriptors = try APIContractCatalog.endpoints(platform: platform)
        let writes = descriptors.filter { $0.hasExternalSideEffects == true && !$0.path.hasPrefix("/api/login/") }
        let host = platform == .parent ? "pcd.intschool.cn" : "teacher.intschool.cn"
        for endpoint in writes {
            let concrete = endpoint.path.replacingOccurrences(of: "\\{[^}]+\\}", with: "123", options: .regularExpression)
            await #expect(throws: DemoSafetyError.self) {
                try await guarded.send(HTTPRequest(url: URL(string: "https://"+host+concrete)!, method: endpoint.method))
            }
        }
        await #expect(throws: DemoSafetyError.self) { try await guarded.send(HTTPRequest(url: URL(string: "https://"+host+"/api/unknown/read")!)) }
        #expect(await base.count() == 0)
    }
}

@Test func explicitPermitIsConsumedEvenOnTransportFailure() async throws {
    let base = RecordingTransport(fail: true), guarded = try GuardedTransport(platform: .parent, base: base)
    let request = HTTPRequest(url: URL(string: "https://pcd.intschool.cn/api/attendance/leave-application")!, method: .post)
    try await guarded.approveOnce(method: .post, path: request.url.path)
    await #expect(throws: MockFailure.self) { try await guarded.send(request) }
    await #expect(throws: DemoSafetyError.self) { try await guarded.send(request) }
    #expect(await base.count() == 1)
}

@Test func smsRequiresSeparatePermissionForEverySend() async throws {
    let base = RecordingTransport(), guarded = try GuardedTransport(platform: .parent, base: base)
    let send = HTTPRequest(url: URL(string: "https://pcd.intschool.cn/api/login/vcodeMobileSend?mobile=private")!)
    await #expect(throws: DemoSafetyError.self) { try await guarded.send(send) }
    try await guarded.approveOnce(method: .get, path: send.url.path)
    await guarded.clearCookies()
    _ = try await guarded.send(send)
    await #expect(throws: DemoSafetyError.self) { try await guarded.send(send) }
    for _ in 0..<4 {
        _ = try await guarded.send(HTTPRequest(url: URL(string: "https://pcd.intschool.cn/api/login/unify")!, method: .post))
    }
    #expect(await base.count() == 5)
}

@Test func originBoundaryAndCookieIsolation() async throws {
    let parent = try GuardedTransport(platform: .parent, base: RecordingTransport())
    let teacher = try GuardedTransport(platform: .teacher, base: RecordingTransport())
    for value in ["https://evil.invalid/api/login/unify", "http://pcd.intschool.cn/api/login/unify", "https://teacher.intschool.cn/api/login/unify"] {
        await #expect(throws: DemoSafetyError.wrongOrigin) { try await parent.send(HTTPRequest(url: URL(string: value)!, method: .post)) }
    }
    await parent.restoreCookies([SessionCookie(name: "SESSION", value: "private", domain: "pcd.intschool.cn")])
    #expect(await parent.cookies().count == 1)
    #expect(await teacher.cookies().isEmpty)
    await parent.clearCookies()
    #expect(await parent.cookies().isEmpty)
}

@Test func requestHistoryDoesNotContainPayloadOrIdentifiers() async throws {
    let guarded = try GuardedTransport(platform: .parent, base: RecordingTransport())
    _ = try await guarded.send(HTTPRequest(url: URL(string: "https://pcd.intschool.cn/api/attendance/statistic/student/12345?token=super-secret&name=private")!, headers: ["Token":"private"], body: Data("password".utf8)))
    let traces = await guarded.history()
    #expect(traces.first?.path == "/api/attendance/statistic/student/{schoolYearId}")
    #expect(traces.first?.status == 200)
    #expect(traces.first?.bytes == 2)
}

@Test func semanticSelectionKeepsSchoolAndDependencies() throws {
    let original = SemanticOption(rawValue: .integer(1001), name: "示例课节", domain: "classPeriod", record: .object(["extra":.bool(true)]), schoolID: SchoolID("school-A"), dependencies: ["courseId":"course-A"])
    let value = try JSONDecoder().decode(JSONValue.self, from: JSONEncoder().encode(original))
    guard case .selection(let option) = try QueryPlanning.parameter(value) else { Issue.record("Named option was discarded"); return }
    #expect(option == original)
    #expect(option.dependencies["courseId"] == "course-A")
}

@Test func contextUsesMillisecondsAndLeavesUnknownFieldsUnfilled() {
    let date = Date(timeIntervalSince1970: 1_700_000_000)
    let context = QueryContext(studentID: "student-A", courseID: "course-A", start: date, end: date, date: date, page: 2, pageSize: 20)
    #expect(context.defaultValue(for: "date") == .integer(1_700_000_000_000))
    #expect(context.defaultValue(for: "studentId") == .string("student-A"))
    #expect(context.defaultValue(for: "pageCurrent") == .integer(2))
    #expect(context.defaultValue(for: "unknown") == nil)
}

@Test func invalidJSONAndMissingPathAreRejected() throws {
    let endpoint = try #require(APIContractCatalog.endpoints(platform: .parent).first { $0.path == "/api/student/trans-info/{pathSuffix}" })
    #expect(throws: APIError.self) { try QueryPlanning.makeInput(query: .array([]), body: .object([:]), path: .object([:]), endpoint: endpoint) }
    #expect(throws: APIError.self) { try QueryPlanning.makeInput(query: .object([:]), body: .object([:]), path: .object([:]), endpoint: endpoint) }
    let input = try QueryPlanning.makeInput(query: .object([:]), body: .object([:]), path: .object(["pathSuffix":.integer(123)]), endpoint: endpoint)
    #expect(input.path["pathSuffix"] == "123")
}

@Test func trailingSlashDoesNotInheritOtherRoutePermission() async throws {
    #expect(!GuardedTransport.matches("/api/task-grade/grade-book", "/api/task-grade/grade-book/"))
    let guarded = try GuardedTransport(platform: .parent, base: RecordingTransport())
    await #expect(throws: DemoSafetyError.self) { try await guarded.send(HTTPRequest(url: URL(string: "https://pcd.intschool.cn/api/task-grade/grade-book/")!)) }
}

@Test func teacherAuthenticationBootstrapCanLoadUserContext() async throws {
    let base = RecordingTransport(), guarded = try GuardedTransport(platform: .teacher, base: base)
    for path in ["/api/login/schools", "/api/login/userInfo"] {
        _ = try await guarded.send(HTTPRequest(url: URL(string: "https://teacher.intschool.cn"+path)!))
    }
    #expect(await base.count() == 2)
}
