import Foundation

public struct TeacherDropDownCourseTeacherGETResponseItemListItem: CapturedResponse {
    /// 关系选项标识。
    public let relationId: Int
    /// 关系显示名称。
    public let relationName: String
    /// 教师标识，来自用户信息或教师列表。
    public let teacherId: Int
    /// 教师显示名称。
    public let teacherName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.relationId = try container.decode(Int.self, forKey: JSONKey("relationId"))
        self.relationName = try container.decode(String.self, forKey: JSONKey("relationName"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        self.teacherName = try container.decode(String.self, forKey: JSONKey("teacherName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["relationId", "relationName", "teacherId", "teacherName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("relationId") { try container.encode(self.relationId, forKey: JSONKey("relationId")) }
        if presentFields.contains("relationName") { try container.encode(self.relationName, forKey: JSONKey("relationName")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        if presentFields.contains("teacherName") { try container.encode(self.teacherName, forKey: JSONKey("teacherName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDropDownCourseTeacherGETResponseItem: CapturedResponse {
    /// 选项分组显示名称。
    public let groupLabel: String
    /// 该分组的完整选项。
    public let list: [TeacherDropDownCourseTeacherGETResponseItemListItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.groupLabel = try container.decode(String.self, forKey: JSONKey("groupLabel"))
        self.list = try container.decode([TeacherDropDownCourseTeacherGETResponseItemListItem].self, forKey: JSONKey("list"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["groupLabel", "list"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("groupLabel") { try container.encode(self.groupLabel, forKey: JSONKey("groupLabel")) }
        if presentFields.contains("list") { try container.encode(self.list, forKey: JSONKey("list")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownCourseTeacherGETResponse = [TeacherDropDownCourseTeacherGETResponseItem]
