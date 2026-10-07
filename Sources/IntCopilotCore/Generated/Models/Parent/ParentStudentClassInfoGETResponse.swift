import Foundation

public struct ParentStudentClassInfoGETResponseItemTeachersItem: CapturedResponse {
    /// 前端使用的显示名称。
    public let displayName: String
    /// 邮箱地址。
    public let email: String
    /// 教师英文显示名称。
    public let teacherEnName: String
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
        self.displayName = try container.decode(String.self, forKey: JSONKey("displayName"))
        self.email = try container.decode(String.self, forKey: JSONKey("email"))
        self.teacherEnName = try container.decode(String.self, forKey: JSONKey("teacherEnName"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        self.teacherName = try container.decode(String.self, forKey: JSONKey("teacherName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["displayName", "email", "teacherEnName", "teacherId", "teacherName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("displayName") { try container.encode(self.displayName, forKey: JSONKey("displayName")) }
        if presentFields.contains("email") { try container.encode(self.email, forKey: JSONKey("email")) }
        if presentFields.contains("teacherEnName") { try container.encode(self.teacherEnName, forKey: JSONKey("teacherEnName")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        if presentFields.contains("teacherName") { try container.encode(self.teacherName, forKey: JSONKey("teacherName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentStudentClassInfoGETResponseItem: CapturedResponse {
    /// 服务端 classType 字段；完整业务含义尚未确认，保留其完整结构。
    public let classType: SemanticValue
    /// 班级种类名称。
    public let classTypeName: String
    /// 关联教师列表。
    public let teachers: [ParentStudentClassInfoGETResponseItemTeachersItem]
    /// 辅导师集合。
    public let tutorTeachers: [JSONValue]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("classType")), domain: "classType", decoder: decoder)
        self.classTypeName = try container.decode(String.self, forKey: JSONKey("classTypeName"))
        self.teachers = try container.decode([ParentStudentClassInfoGETResponseItemTeachersItem].self, forKey: JSONKey("teachers"))
        self.tutorTeachers = try container.decode([JSONValue].self, forKey: JSONKey("tutorTeachers"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classType", "classTypeName", "teachers", "tutorTeachers"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classType") { try container.encode(self.classType.rawValue, forKey: JSONKey("classType")) }
        if presentFields.contains("classTypeName") { try container.encode(self.classTypeName, forKey: JSONKey("classTypeName")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        if presentFields.contains("tutorTeachers") { try container.encode(self.tutorTeachers, forKey: JSONKey("tutorTeachers")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias ParentStudentClassInfoGETResponse = [ParentStudentClassInfoGETResponseItem]
