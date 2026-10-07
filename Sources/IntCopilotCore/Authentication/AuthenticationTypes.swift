import Foundation

public struct PasswordCredentials: Sendable {
    /// 登录账号；家长为平台账号，教师为门户账号。
    public let account: String
    /// 本次登录使用的密码；仅在启用自动重登时保留于内存。
    public let password: String
    public init(account: String, password: String) { self.account = account; self.password = password }
}

public struct PlatformToken: Sendable {
    /// 对应平台的 X-Token 值，区别于教师门户 OAuth access_token。
    public let value: String
    /// 已知过期时刻；为 nil 时使用 JWT exp 提示或等待服务器拒绝。
    public let expiresAt: Date?
    public init(_ value: String, expiresAt: Date? = nil) { self.value = value; self.expiresAt = expiresAt }
}

public enum AuthenticationMaterial: Sendable {
    case password(PasswordCredentials), platformToken(PlatformToken), teacherSSOToken(String)
}
public enum ReauthenticationReason: String, Sendable { case expired, unauthorized }
public enum ReauthenticationPolicy: Sendable { case callbackOnly, automatic(maxAttempts: Int = 3) }

public struct ReauthenticationContext: Sendable {
    /// 需要恢复会话的平台。
    public let platform: Platform
    /// 触发重新认证的原因。
    public let reason: ReauthenticationReason
    /// 已进行的密码自动重登尝试数，不包含初次登录。
    public let automaticAttempts: Int
    /// 最近一次自动重登错误；直接回调时为 nil。
    public let lastError: (any Error)?
}

public typealias ReauthenticationCallback = @Sendable (ReauthenticationContext) async throws -> AuthenticationMaterial

public struct AuthenticationConfiguration: Sendable {
    /// 自动重登策略；默认直接调用 App 回调。
    public let policy: ReauthenticationPolicy
    /// 自动重登耗尽或无法自动恢复时由 App 提供新的认证材料。
    public let callback: ReauthenticationCallback?
    /// Token 提前续期窗口，单位秒，默认 60。
    public let expiryLeeway: TimeInterval
    public init(policy: ReauthenticationPolicy = .callbackOnly, expiryLeeway: TimeInterval = 60, callback: ReauthenticationCallback? = nil) {
        self.policy = policy; self.expiryLeeway = max(0, expiryLeeway); self.callback = callback
    }
}

public struct ClientEnvironment: Codable, Sendable, Equatable {
    /// 当前业务平台的 HTTPS 根地址。
    public let baseURL: URL
    /// 教师登录门户地址；家长平台为 nil。
    public let portalURL: URL?
    /// 门户租户配置；成都值来自公开前端配置，不属于用户密码。
    public let tenantID: String?
    /// OAuth 公开客户端标识，不是客户端密钥。
    public let oauthClientID: String?
    /// 门户登录方式；成都使用 INTOA。
    public let portalLoginType: String
    public init(baseURL: URL, portalURL: URL? = nil, tenantID: String? = nil, oauthClientID: String? = nil, portalLoginType: String = "INTOA") {
        self.baseURL = baseURL; self.portalURL = portalURL; self.tenantID = tenantID; self.oauthClientID = oauthClientID; self.portalLoginType = portalLoginType
    }
    /// 成都家长平台配置。
    public static let parentChengdu = ClientEnvironment(baseURL: URL(string: "https://pcd.intschool.cn")!)
    /// 成都教师平台及门户认证公开配置。
    public static let teacherChengdu = ClientEnvironment(baseURL: URL(string: "https://teacher.intschool.cn")!, portalURL: URL(string: "https://kcschengdu.dipont.com")!, tenantID: "606ed3257f540000e300642a", oauthClientID: "e65d92d3d9634043848d185a255cac68")
}

public struct SessionSnapshot: Codable, Sendable {
    /// 快照格式版本，目前为 1。
    public let version: Int
    /// 会话所属平台；恢复时必须匹配客户端。
    public let platform: Platform
    /// 会话所属环境；禁止将快照恢复到不同目标。
    public let environment: ClientEnvironment
    /// 敏感平台 Token；持久化和保护由 App 负责。
    public let token: String
    /// 已知 Token 过期时刻。
    public let expiresAt: Date?
    /// 学校上下文及完整元数据；家长为域名对应的公开配置，不作为账号授权证明。
    public let schools: [School]
    /// 用户当前选择的学校；多学校未选择时为 nil。
    public let selectedSchoolID: SchoolID?
    /// 当前学校的教师标识；家长或尚未加载时为 nil。
    public let teacherID: TeacherID?
    /// 当前学校完整用户信息；尚未加载时为 nil。
    public let userInfo: JSONValue?
    /// 仅包含目标平台和认证门户 Cookie 的敏感材料。
    public let cookies: [SessionCookie]
}

public struct LoginResult: Sendable {
    /// 教师可访问学校或家长入口域名的学校配置；供多学校选择，不替代服务端授权。
    public let schools: [School]
    /// 单学校自动选择，多学校保留 nil，交由用户选择。
    public let selectedSchool: School?
    /// 已知 Token 过期时刻。
    public let expiresAt: Date?
}
