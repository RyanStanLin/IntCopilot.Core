import Foundation
import IntCopilotTransport

public final class ParentClient: Sendable {
    /// 家长平台独立会话 actor。
    let session: CoreSession
    /// 显式实验入口，结果附带不稳定性和安全标记。
    public let experimental: ExperimentalAPI
    /// 提供具名学年、学部及业务选项的上下文服务。
    public let options: ContextOptions

    public init(environment: ClientEnvironment = .parentChengdu, transport: any HTTPTransport = URLSessionTransport(), locale: APILocale = .chinese, authentication: AuthenticationConfiguration = AuthenticationConfiguration()) {
        let session = CoreSession(platform: .parent, environment: environment, transport: transport, locale: locale, authentication: authentication)
        self.session = session; experimental = ExperimentalAPI(session: session, platform: .parent); options = ContextOptions(session: session, platform: .parent)
    }
    public func login(account: String, password: String) async throws -> LoginResult { try await session.login(.password(PasswordCredentials(account: account, password: password))) }
    public func login(token: PlatformToken) async throws -> LoginResult { try await session.login(.platformToken(token)) }
    public func requestSMSCode(to mobile: String, areaCode: String = "86") async throws -> SMSLogin {
        let challenge = try await session.startSMS(to: mobile, areaCode: areaCode)
        return SMSLogin(session: session, mobile: mobile, areaCode: areaCode, challenge: challenge)
    }
    public func logout() async { await session.logout() }
    public func schools() async -> [School] { await session.availableSchools() }
    public func selectSchool(_ school: School) async throws { try await session.selectSchool(school) }
    public func snapshot() async throws -> SessionSnapshot { try await session.snapshot() }
    public func restore(_ snapshot: SessionSnapshot) async throws -> LoginResult { try await session.restore(snapshot) }
    public func setLocale(_ locale: APILocale) async { await session.setLocale(locale) }
    public func refreshOptions() async { await session.refreshOptions() }
    public func call<R>(_ endpoint: CapturedEndpoint<R>, input: APIInput = APIInput()) async throws -> R { try await session.call(endpoint, input: input) }
    public func students() async throws -> [Student] {
        let school = try await session.schoolID()
        let result = try await session.call(ParentEndpoints.studentListGET, input: APIInput(), schoolID: school)
        let records = try JSONEncoder().encode(result)
        try await session.requireSchool(school)
        return try JSONDecoder().decode([JSONValue].self, from: records).map { try Student(record: $0, schoolID: school) }
    }
    public func student(_ student: Student) -> ParentStudentScope { ParentStudentScope(session: session, student: student) }
}

