import Foundation

public struct TeacherDropDownTaskTypeGETResponseItem: CapturedResponse {
    /// 业务名称缩写。
    public let abbr: String
    /// 本业务域代码，需结合该对象的名称解释。
    public let code: String
    /// 显示颜色。
    public let colour: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 是否考试类型。
    public let isExam: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 任务类型标识，来自任务类型选项。
    public let taskTypeId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.abbr = try container.decode(String.self, forKey: JSONKey("abbr"))
        self.code = try container.decode(String.self, forKey: JSONKey("code"))
        self.colour = try container.decode(String.self, forKey: JSONKey("colour"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.isExam = try container.decode(Bool.self, forKey: JSONKey("isExam"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.taskTypeId = try container.decode(Int.self, forKey: JSONKey("taskTypeId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["abbr", "code", "colour", "enName", "isExam", "name", "taskTypeId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("abbr") { try container.encode(self.abbr, forKey: JSONKey("abbr")) }
        if presentFields.contains("code") { try container.encode(self.code, forKey: JSONKey("code")) }
        if presentFields.contains("colour") { try container.encode(self.colour, forKey: JSONKey("colour")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("isExam") { try container.encode(self.isExam, forKey: JSONKey("isExam")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("taskTypeId") { try container.encode(self.taskTypeId, forKey: JSONKey("taskTypeId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownTaskTypeGETResponse = [TeacherDropDownTaskTypeGETResponseItem]
