import Foundation
import Testing
@testable import IntCopilotCore

@Test func leaveWorkflowUsesRealOptionsAndEmptyAcknowledgement() async throws {
    let transport = MockTransport { request, _ in
        switch request.url.path {
        case "/api/login/schools": return jsonResponse(testSchools)
        case "/api/student/list": return HTTPResponse(statusCode: 200, body: try fixtureData("parent-871.json"))
        case "/api/dropDown/leave-reasons": return jsonResponse("[{\"key\":400028,\"value\":\"其他\",\"enValue\":\"Other\"}]")
        case "/api/attendance/leave-application":
            if request.method == .get { return HTTPResponse(statusCode: 200, body: try fixtureData("parent-395.json")) }
            let value = try body(request)
            #expect(value["studentId"]?.stringValue == fixtureStudentID())
            #expect(value["type"] == .string("personal"))
            #expect(value["reasonId"] == .integer(400028))
            #expect(value["startTime"] == .integer(1_000_000))
            return HTTPResponse(statusCode: 200)
        case "/api/attendance/leave-application/retrieve":
            #expect(query(request)["leaveApplicationId"] != nil)
            return HTTPResponse(statusCode: 200)
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = ParentClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let students = try await client.students()
    let scope = client.student(try #require(students.first))
    let choices = try await scope.leaveOptions()
    let reason = try #require(choices.reasons.first)
    let acknowledgement = try await scope.submitLeave(reason: reason, during: SchoolDateRange(start: Date(timeIntervalSince1970: 1000), end: Date(timeIntervalSince1970: 2000)))
    #expect(acknowledgement.response == .null)
    let applications = try await scope.leaveApplications()
    _ = try await scope.withdrawLeave(try #require(applications.items.first))
    _ = try await scope.leaveApplications()
    #expect(await transport.requests.map { $0.url.path } == ["/api/login/schools", "/api/student/list", "/api/dropDown/leave-reasons", "/api/attendance/leave-application", "/api/attendance/leave-application", "/api/attendance/leave-application/retrieve", "/api/attendance/leave-application"])
}

@Test func timetableAutomaticallyObtainsSchoolYearAndMilliseconds() async throws {
    let transport = MockTransport { request, _ in
        switch request.url.path {
        case "/api/login/schools": return jsonResponse(testSchools)
        case "/api/semester/currentSchoolYear": return jsonResponse("{\"schoolYearId\":400052}")
        case "/api/curriculum/student/400052":
            #expect(query(request)["studentId"] == "407344")
            #expect(query(request)["start"] == "1000000")
            #expect(request.headers["X-SchoolId"] == "400008")
            return HTTPResponse(statusCode: 200, body: try fixtureData("parent-261.json"))
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = ParentClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let student = try Student(record: .object(["studentId":.integer(407344),"name":.string("Example Student")]), schoolID: SchoolID("400008"))
    _ = try await client.student(student).timetable(in: SchoolDateRange(start: Date(timeIntervalSince1970: 1000), end: Date(timeIntervalSince1970: 2000)))
    #expect(await transport.requests.count == 3)
}

@Test func mutationsAreNeverReplayedOnUnauthorized() async throws {
    let callbacks = Counter()
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        return HTTPResponse(statusCode: 401)
    }
    let client = ParentClient(transport: transport, authentication: AuthenticationConfiguration(callback: { _ in
        _ = await callbacks.next(); return .platformToken(PlatformToken("new"))
    }))
    _ = try await client.login(token: PlatformToken("fixture-token"))
    await #expect(throws: APIError.authenticationRequired) { try await client.call(ParentEndpoints.attendanceLeaveApplicationRetrievePUT, input: APIInput(query: ["leaveApplicationId":.integer(400033)])) }
    #expect(await callbacks.value() == 0)
    #expect(await transport.requests.count == 2)
}

@Test func readOnlyUnauthorizedReplaysOnlyOnce() async throws {
    let callbacks = Counter()
    let transport = MockTransport { request, _ in request.url.path == "/api/login/schools" ? jsonResponse(testSchools) : HTTPResponse(statusCode: 401) }
    let client = ParentClient(transport: transport, authentication: AuthenticationConfiguration(callback: { _ in
        _ = await callbacks.next(); return .platformToken(PlatformToken("new"))
    }))
    _ = try await client.login(token: PlatformToken("old"))
    await #expect(throws: APIError.authenticationRequired) { try await client.students() }
    #expect(await callbacks.value() == 1)
    #expect(await transport.requests.filter { $0.url.path == "/api/student/list" }.count == 2)
}

@Test func oldStudentScopeRejectsAnotherSchool() async throws {
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
        return jsonResponse("[{\"schoolId\":400008,\"name\":\"First\"},{\"schoolId\":400009,\"name\":\"Second\"}]")
    }
    let client = TeacherClient(transport: transport)
    let login = try await client.login(token: PlatformToken("fixture-token"))
    #expect(login.selectedSchool == nil)
    try await client.selectSchool(login.schools[0])
    let student = try Student(record: .object(["studentId":.integer(407344)]), schoolID: login.schools[0].id)
    let scope = client.student(student)
    try await client.selectSchool(login.schools[1])
    await #expect(throws: APIError.invalidParameter("此业务引用属于另一学校，请重新选择上下文")) { try await scope.details() }
    #expect(await transport.requests.count == 3)
}

@Test func unknownFieldsAndDomainSpecificCodesSurviveRoundTrip() throws {
    let original = try fixtureData("parent-395.json")
    var json = try #require(JSONDecoder().decode(JSONValue.self, from: original).objectValue)
    json["newServerField"] = .object(["number":.integer(7)])
    let value = try JSONDecoder().decode(ParentAttendanceLeaveApplicationGETResponse.self, from: JSONEncoder().encode(JSONValue.object(json)))
    #expect(value.additionalFields["newServerField"] == .object(["number":.integer(7)]))
    #expect(SemanticValue(rawValue: .string("1011"), domain: "taskCompletion").name != SemanticValue(rawValue: .string("1011"), domain: "repetition").name)
    let unknown = SemanticValue(rawValue: .integer(99999), domain: "taskCompletion")
    #expect(!unknown.isRecognized); #expect(unknown.name.contains("未识别"))
    #expect(unknown.rawValue == .integer(99999))
}

@Test func catalogMarksEveryDiscoveryAndNeverInfersGETSafety() throws {
    let endpoints = try APIContractCatalog.endpoints()
    #expect(Set(endpoints.map(\.id)).count == endpoints.count)
    for endpoint in endpoints where !endpoint.coveredByProvidedCaptures {
        if endpoint.evidence.contains(where: { $0.kind == .readOnlyObservation }) { #expect(endpoint.stability == .stable) }
        else { #expect(endpoint.stability == .unstable) }
        #expect(endpoint.evidence.contains { $0.kind == .frontendScript })
        #expect(endpoint.warnings.contains { $0.contains("用户原始抓包未覆盖") })
    }
    let sms = try APIContractCatalog.endpoint(id: "parent:GET:/api/login/vcodeMobileSend")
    #expect(sms.method == .get); #expect(sms.safety == .externalEffect)
    let check = try APIContractCatalog.endpoint(id: "parent:POST:/api/attendance/leave-application/time-check")
    #expect(check.stability == .unstable); #expect(check.safety == .unverified)
}
