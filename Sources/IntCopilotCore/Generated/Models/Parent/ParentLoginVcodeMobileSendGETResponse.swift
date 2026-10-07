import Foundation

public struct ParentLoginVcodeMobileSendGETResponse: CapturedResponse {
    /// 业务结果代码，与 HTTP 状态码独立；允许为空或缺失。
    public let resCode: JSONValue?
    /// 业务结果说明。
    public let resMsg: String
    /// 本次认证或业务操作是否成功。
    public let success: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.resCode = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("resCode"))
        self.resMsg = try container.decode(String.self, forKey: JSONKey("resMsg"))
        self.success = try container.decode(Bool.self, forKey: JSONKey("success"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["resCode", "resMsg", "success"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("resCode") { try container.encode(self.resCode, forKey: JSONKey("resCode")) }
        if presentFields.contains("resMsg") { try container.encode(self.resMsg, forKey: JSONKey("resMsg")) }
        if presentFields.contains("success") { try container.encode(self.success, forKey: JSONKey("success")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
