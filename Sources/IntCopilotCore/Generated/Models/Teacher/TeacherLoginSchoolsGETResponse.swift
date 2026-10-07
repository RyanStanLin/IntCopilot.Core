import Foundation

public struct TeacherLoginSchoolsGETResponseItem: CapturedResponse {
    /// 联系地址。
    public let address: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 学校公开标志资源地址。
    public let logoUrl: String
    /// 业务实体或选项名称。
    public let name: String
    /// 学校标识，来自认证学校列表。
    public let schoolId: Int
    /// 学校或机构简称。
    public let shortName: String
    /// 联系电话。
    public let tel: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.address = try container.decode(String.self, forKey: JSONKey("address"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.logoUrl = try container.decode(String.self, forKey: JSONKey("logoUrl"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.schoolId = try container.decode(Int.self, forKey: JSONKey("schoolId"))
        self.shortName = try container.decode(String.self, forKey: JSONKey("shortName"))
        self.tel = try container.decode(String.self, forKey: JSONKey("tel"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["address", "enName", "logoUrl", "name", "schoolId", "shortName", "tel"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("address") { try container.encode(self.address, forKey: JSONKey("address")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("logoUrl") { try container.encode(self.logoUrl, forKey: JSONKey("logoUrl")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("schoolId") { try container.encode(self.schoolId, forKey: JSONKey("schoolId")) }
        if presentFields.contains("shortName") { try container.encode(self.shortName, forKey: JSONKey("shortName")) }
        if presentFields.contains("tel") { try container.encode(self.tel, forKey: JSONKey("tel")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherLoginSchoolsGETResponse = [TeacherLoginSchoolsGETResponseItem]
