import Foundation

public struct PortalApiUserInfoGETResponseAuthoritiesItem: CapturedResponse {
    /// 单项权限标识。
    public let authority: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.authority = try container.decode(String.self, forKey: JSONKey("authority"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["authority"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("authority") { try container.encode(self.authority, forKey: JSONKey("authority")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct PortalApiUserInfoGETResponse: CapturedResponse {
    /// 账号是否未过期。
    public let accountNonExpired: Bool
    /// 账号是否未锁定。
    public let accountNonLocked: Bool
    /// 门户可使用的应用标识。
    public let appsAuth: [String]
    /// 门户角色权限列表。
    public let authorities: [PortalApiUserInfoGETResponseAuthoritiesItem]
    /// 凭据是否未过期。
    public let credentialsNonExpired: Bool
    /// 邮箱地址。
    public let email: String
    /// 当前业务实体标识。
    public let id: String
    /// 密码字段；响应中通常为空，不应持久化或记录；允许为空或缺失。
    public let password: JSONValue?
    /// SSO 是否可用。
    public let ssoStatus: String
    /// 门户租户标识；允许为空或缺失。
    public let tenantId: JSONValue?
    /// 门户用户标识。
    public let userId: String
    /// 门户登录账号。
    public let username: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.accountNonExpired = try container.decode(Bool.self, forKey: JSONKey("accountNonExpired"))
        self.accountNonLocked = try container.decode(Bool.self, forKey: JSONKey("accountNonLocked"))
        self.appsAuth = try container.decode([String].self, forKey: JSONKey("appsAuth"))
        self.authorities = try container.decode([PortalApiUserInfoGETResponseAuthoritiesItem].self, forKey: JSONKey("authorities"))
        self.credentialsNonExpired = try container.decode(Bool.self, forKey: JSONKey("credentialsNonExpired"))
        self.email = try container.decode(String.self, forKey: JSONKey("email"))
        self.id = try container.decode(String.self, forKey: JSONKey("id"))
        self.password = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("password"))
        self.ssoStatus = try container.decode(String.self, forKey: JSONKey("ssoStatus"))
        self.tenantId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("tenantId"))
        self.userId = try container.decode(String.self, forKey: JSONKey("userId"))
        self.username = try container.decode(String.self, forKey: JSONKey("username"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["accountNonExpired", "accountNonLocked", "appsAuth", "authorities", "credentialsNonExpired", "email", "id", "password", "ssoStatus", "tenantId", "userId", "username"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("accountNonExpired") { try container.encode(self.accountNonExpired, forKey: JSONKey("accountNonExpired")) }
        if presentFields.contains("accountNonLocked") { try container.encode(self.accountNonLocked, forKey: JSONKey("accountNonLocked")) }
        if presentFields.contains("appsAuth") { try container.encode(self.appsAuth, forKey: JSONKey("appsAuth")) }
        if presentFields.contains("authorities") { try container.encode(self.authorities, forKey: JSONKey("authorities")) }
        if presentFields.contains("credentialsNonExpired") { try container.encode(self.credentialsNonExpired, forKey: JSONKey("credentialsNonExpired")) }
        if presentFields.contains("email") { try container.encode(self.email, forKey: JSONKey("email")) }
        if presentFields.contains("id") { try container.encode(self.id, forKey: JSONKey("id")) }
        if presentFields.contains("password") { try container.encode(self.password, forKey: JSONKey("password")) }
        if presentFields.contains("ssoStatus") { try container.encode(self.ssoStatus, forKey: JSONKey("ssoStatus")) }
        if presentFields.contains("tenantId") { try container.encode(self.tenantId, forKey: JSONKey("tenantId")) }
        if presentFields.contains("userId") { try container.encode(self.userId, forKey: JSONKey("userId")) }
        if presentFields.contains("username") { try container.encode(self.username, forKey: JSONKey("username")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
