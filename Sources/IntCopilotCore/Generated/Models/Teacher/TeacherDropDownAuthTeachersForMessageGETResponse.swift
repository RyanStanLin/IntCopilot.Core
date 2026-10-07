import Foundation

public struct TeacherDropDownAuthTeachersForMessageGETResponseItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 当前用户的数据权限集合；允许为空或缺失。
    public let dataPermission: JSONValue?
    /// 英文名称，可能为空。
    public let enName: String
    /// 是否关联教师身份。
    public let isTeacher: Bool
    /// 业务实体或选项名称。
    public let name: String
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
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.dataPermission = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("dataPermission"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.isTeacher = try container.decode(Bool.self, forKey: JSONKey("isTeacher"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.teacherEnName = try container.decode(String.self, forKey: JSONKey("teacherEnName"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        self.teacherName = try container.decode(String.self, forKey: JSONKey("teacherName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "dataPermission", "enName", "isTeacher", "name", "teacherEnName", "teacherId", "teacherName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("dataPermission") { try container.encode(self.dataPermission, forKey: JSONKey("dataPermission")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("isTeacher") { try container.encode(self.isTeacher, forKey: JSONKey("isTeacher")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("teacherEnName") { try container.encode(self.teacherEnName, forKey: JSONKey("teacherEnName")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        if presentFields.contains("teacherName") { try container.encode(self.teacherName, forKey: JSONKey("teacherName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownAuthTeachersForMessageGETResponse = [TeacherDropDownAuthTeachersForMessageGETResponseItem]
