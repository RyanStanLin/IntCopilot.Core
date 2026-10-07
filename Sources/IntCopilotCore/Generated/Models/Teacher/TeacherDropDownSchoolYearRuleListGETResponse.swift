import Foundation

public struct TeacherDropDownSchoolYearRuleListGETResponseItem: CapturedResponse {
    /// 选项的英文显示文本。
    public let enValue: String
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 选项附加元数据，类型随业务域变化。
    public let extraValue: String
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.enValue = try container.decode(String.self, forKey: JSONKey("enValue"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.extraValue = try container.decode(String.self, forKey: JSONKey("extraValue"))
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["enValue", "endTime", "extraValue", "key", "startTime", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("enValue") { try container.encode(self.enValue, forKey: JSONKey("enValue")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("extraValue") { try container.encode(self.extraValue, forKey: JSONKey("extraValue")) }
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownSchoolYearRuleListGETResponse = [TeacherDropDownSchoolYearRuleListGETResponseItem]
