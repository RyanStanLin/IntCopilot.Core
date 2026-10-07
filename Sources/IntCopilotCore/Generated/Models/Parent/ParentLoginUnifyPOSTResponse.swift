import Foundation

public struct ParentLoginUnifyPOSTResponse: CapturedResponse {
    /// 业务结果的附加信息；允许为空或缺失。
    public let extraMsg: Bool?
    /// 业务结果说明。
    public let msg: String
    /// 业务结果代码，与 HTTP 状态码独立；允许为空或缺失。
    public let resCode: Int?
    /// 本次认证或业务操作是否成功。
    public let success: Bool
    /// 平台会话 Token，敏感认证材料，不应记录。
    public let token: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.extraMsg = try container.decodeIfPresent(Bool.self, forKey: JSONKey("extraMsg"))
        self.msg = try container.decode(String.self, forKey: JSONKey("msg"))
        self.resCode = try container.decodeIfPresent(Int.self, forKey: JSONKey("resCode"))
        self.success = try container.decode(Bool.self, forKey: JSONKey("success"))
        self.token = try container.decode(String.self, forKey: JSONKey("token"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["extraMsg", "msg", "resCode", "success", "token"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("extraMsg") { try container.encode(self.extraMsg, forKey: JSONKey("extraMsg")) }
        if presentFields.contains("msg") { try container.encode(self.msg, forKey: JSONKey("msg")) }
        if presentFields.contains("resCode") { try container.encode(self.resCode, forKey: JSONKey("resCode")) }
        if presentFields.contains("success") { try container.encode(self.success, forKey: JSONKey("success")) }
        if presentFields.contains("token") { try container.encode(self.token, forKey: JSONKey("token")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
