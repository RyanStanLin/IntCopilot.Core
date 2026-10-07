import Foundation
import IntCopilotTransport

public final class TeacherClient: Sendable {
    /// 教师平台独立会话 actor。
    let session: CoreSession
    /// 显式实验入口，结果附带不稳定性和安全标记。
    public let experimental: ExperimentalAPI
    /// 提供具名学年、学部及业务选项的上下文服务。
    public let options: ContextOptions
    public init(environment: ClientEnvironment = .teacherChengdu, transport: any HTTPTransport = URLSessionTransport(), locale: APILocale = .chinese, authentication: AuthenticationConfiguration = AuthenticationConfiguration()) {
        let session = CoreSession(platform: .teacher, environment: environment, transport: transport, locale: locale, authentication: authentication)
        self.session = session; experimental = ExperimentalAPI(session: session, platform: .teacher); options = ContextOptions(session: session, platform: .teacher)
    }
    public func login(account: String, password: String) async throws -> LoginResult { try await session.login(.password(PasswordCredentials(account: account, password: password))) }
    public func login(token: PlatformToken) async throws -> LoginResult { try await session.login(.platformToken(token)) }
    public func login(ssoAccessToken: String) async throws -> LoginResult { try await session.login(.teacherSSOToken(ssoAccessToken)) }
    public func logout() async { await session.logout() }
    public func schools() async -> [School] { await session.availableSchools() }
    public func selectSchool(_ school: School) async throws { try await session.selectSchool(school) }
    public func snapshot() async throws -> SessionSnapshot { try await session.snapshot() }
    public func restore(_ snapshot: SessionSnapshot) async throws -> LoginResult { try await session.restore(snapshot) }
    public func setLocale(_ locale: APILocale) async { await session.setLocale(locale) }
    public func refreshOptions() async { await session.refreshOptions() }
    public func call<R>(_ endpoint: CapturedEndpoint<R>, input: APIInput = APIInput()) async throws -> R { try await session.call(endpoint, input: input) }
    public func personalTimetable(in range: SchoolDateRange) async throws -> TeacherCurriculumTeacherPersonalGETResponse {
        try await call(TeacherEndpoints.curriculumTeacherPersonalGET, input: APIInput(query: range.query()))
    }
    public func courses(schoolYear: SchoolYearID? = nil) async throws -> [Course] {
        var input = APIInput(); if let schoolYear { input.query["schoolYearId"] = .id(schoolYear) }
        let school = try await session.schoolID()
        let result = try await session.call(TeacherEndpoints.courseCascadeBySchoolYearGET, input: input, schoolID: school)
        let value = try JSONDecoder().decode(JSONValue.self, from: JSONEncoder().encode(result))
        try await session.requireSchool(school)
        return try flattenOptions(value).map { try Course(record: $0, schoolID: school) }
    }
    public func course(_ course: Course, kind: CourseKind = .regular) -> TeacherCourseScope { TeacherCourseScope(session: session, course: course, kind: kind) }
    public func student(_ student: Student) -> TeacherStudentScope { TeacherStudentScope(session: session, student: student) }
    public func diaryTypes() async throws -> [SemanticOption] {
        let school = try await session.schoolID()
        let response = try await session.json(path: "/api/diary/primary-type", query: ["allType":.boolean(true)], cached: true, schoolID: school)
        return try (response.arrayValue ?? []).map { try SemanticOption.from($0, domain: "diaryPrimaryType", schoolID: school) }
    }
    public func diaryEntryTypes(for primaryType: SemanticOption) async throws -> [SemanticOption] {
        guard primaryType.domain == "diaryPrimaryType" else { throw APIError.invalidParameter("日记主类型") }
        let school = try await session.schoolID()
        let response = try await session.json(path: "/api/diary/entry-type", query: ["primaryTypeId":.selection(primaryType)], cached: true, schoolID: school)
        return try (response.arrayValue ?? []).map { try SemanticOption.from($0, domain: "diaryEntryType", schoolID: school, dependencies: ["primaryTypeId": primaryType.rawValue.stringValue ?? ""]) }
    }
}

