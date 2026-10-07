import Foundation

public struct ParentStudentListGETResponseItem: CapturedResponse {
    /// 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构。
    public let attendanceType: SemanticValue
    /// 头像资源地址。
    public let avatarUrl: String
    /// 学部标识，来自学部选项。
    public let campusId: Int
    /// 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构。
    public let campusType: SemanticValue
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: Int
    /// 名字或拼音名。
    public let firstName: String
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 常用名称。
    public let moniker: String
    /// 业务实体或选项名称。
    public let name: String
    /// 账号与学生的关系。
    public let relation: SemanticValue
    /// 学籍说明。
    public let schoolRollNote: String
    /// 学籍状态，具体字典尚未完整确认。
    public let schoolRollStatus: String
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 姓氏。
    public let surname: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendanceType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("attendanceType")), domain: "attendanceType", decoder: decoder)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.campusId = try container.decode(Int.self, forKey: JSONKey("campusId"))
        self.campusType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("campusType")), domain: "campusType", decoder: decoder)
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(Int.self, forKey: JSONKey("enterDate"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.moniker = try container.decode(String.self, forKey: JSONKey("moniker"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.relation = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("relation")), domain: "relationship", decoder: decoder)
        self.schoolRollNote = try container.decode(String.self, forKey: JSONKey("schoolRollNote"))
        self.schoolRollStatus = try container.decode(String.self, forKey: JSONKey("schoolRollStatus"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.surname = try container.decode(String.self, forKey: JSONKey("surname"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceType", "avatarUrl", "campusId", "campusType", "enName", "enterDate", "firstName", "lastName", "moniker", "name", "relation", "schoolRollNote", "schoolRollStatus", "status", "studentId", "surname"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceType") { try container.encode(self.attendanceType.rawValue, forKey: JSONKey("attendanceType")) }
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("campusId") { try container.encode(self.campusId, forKey: JSONKey("campusId")) }
        if presentFields.contains("campusType") { try container.encode(self.campusType.rawValue, forKey: JSONKey("campusType")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("moniker") { try container.encode(self.moniker, forKey: JSONKey("moniker")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("relation") { try container.encode(self.relation.rawValue, forKey: JSONKey("relation")) }
        if presentFields.contains("schoolRollNote") { try container.encode(self.schoolRollNote, forKey: JSONKey("schoolRollNote")) }
        if presentFields.contains("schoolRollStatus") { try container.encode(self.schoolRollStatus, forKey: JSONKey("schoolRollStatus")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("surname") { try container.encode(self.surname, forKey: JSONKey("surname")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias ParentStudentListGETResponse = [ParentStudentListGETResponseItem]
