import Foundation

public struct TeacherTaskGradeRuleGETResponseItemRulesItem: CapturedResponse {
    /// 业务名称缩写。
    public let abbr: String
    /// 显示颜色。
    public let colour: String
    /// 百分制成绩。
    public let percentage: Int
    /// 任务类型对象或名称。
    public let taskType: String
    /// 任务类型标识，来自任务类型选项。
    public let taskTypeId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.abbr = try container.decode(String.self, forKey: JSONKey("abbr"))
        self.colour = try container.decode(String.self, forKey: JSONKey("colour"))
        self.percentage = try container.decode(Int.self, forKey: JSONKey("percentage"))
        self.taskType = try container.decode(String.self, forKey: JSONKey("taskType"))
        self.taskTypeId = try container.decode(Int.self, forKey: JSONKey("taskTypeId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["abbr", "colour", "percentage", "taskType", "taskTypeId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("abbr") { try container.encode(self.abbr, forKey: JSONKey("abbr")) }
        if presentFields.contains("colour") { try container.encode(self.colour, forKey: JSONKey("colour")) }
        if presentFields.contains("percentage") { try container.encode(self.percentage, forKey: JSONKey("percentage")) }
        if presentFields.contains("taskType") { try container.encode(self.taskType, forKey: JSONKey("taskType")) }
        if presentFields.contains("taskTypeId") { try container.encode(self.taskTypeId, forKey: JSONKey("taskTypeId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherTaskGradeRuleGETResponseItem: CapturedResponse {
    /// 自定义成绩列标识，来自成绩簿列配置。
    public let customColumnId: Int
    /// 英文名称，可能为空。
    public let enName: String
    /// 业务实体或选项名称。
    public let name: String
    /// 完整业务规则配置。
    public let rules: [TeacherTaskGradeRuleGETResponseItemRulesItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.customColumnId = try container.decode(Int.self, forKey: JSONKey("customColumnId"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.rules = try container.decode([TeacherTaskGradeRuleGETResponseItemRulesItem].self, forKey: JSONKey("rules"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["customColumnId", "enName", "name", "rules"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("customColumnId") { try container.encode(self.customColumnId, forKey: JSONKey("customColumnId")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("rules") { try container.encode(self.rules, forKey: JSONKey("rules")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherTaskGradeRuleGETResponse = [TeacherTaskGradeRuleGETResponseItem]
