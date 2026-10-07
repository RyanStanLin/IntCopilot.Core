import Foundation

public struct TeacherStudentStudentBriefInfoGETResponse: CapturedResponse {
    /// 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构。
    public let attendanceType: SemanticValue
    /// 头像资源地址。
    public let avatarUrl: String
    /// 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构。
    public let campusType: SemanticValue
    /// 主班级名称。
    public let className: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: Int
    /// 名字或拼音名。
    public let firstName: String
    /// 毕业时刻，Unix 毫秒；允许为空或缺失。
    public let graduateTime: JSONValue?
    /// 学院名称。
    public let house: String
    /// 最后参与课程日期，Unix 毫秒；允许为空或缺失。
    public let lastClassDate: JSONValue?
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 医疗说明，属于敏感资料。
    public let medical: String
    /// 是否有医疗提示。
    public let medicalTag: Bool
    /// 授课语言或相关提示文本。
    public let medium: String
    /// 是否有语言提示标记。
    public let mediumTag: Bool
    /// 是否属于当前教师负责学生。
    public let myStudent: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失。
    public let outDate: JSONValue?
    /// 本次行为积分。
    public let points: Int
    /// 上游实际状态，须按所属业务解释。
    public let realStatus: String
    /// 年段名称。
    public let sectionName: String
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单；允许为空或缺失。
    public let studentId: JSONValue?
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendanceType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("attendanceType")), domain: "attendanceType", decoder: decoder)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.campusType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("campusType")), domain: "campusType", decoder: decoder)
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(Int.self, forKey: JSONKey("enterDate"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.graduateTime = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("graduateTime"))
        self.house = try container.decode(String.self, forKey: JSONKey("house"))
        self.lastClassDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("lastClassDate"))
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.medical = try container.decode(String.self, forKey: JSONKey("medical"))
        self.medicalTag = try container.decode(Bool.self, forKey: JSONKey("medicalTag"))
        self.medium = try container.decode(String.self, forKey: JSONKey("medium"))
        self.mediumTag = try container.decode(Bool.self, forKey: JSONKey("mediumTag"))
        self.myStudent = try container.decode(Bool.self, forKey: JSONKey("myStudent"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.outDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("outDate"))
        self.points = try container.decode(Int.self, forKey: JSONKey("points"))
        self.realStatus = try container.decode(String.self, forKey: JSONKey("realStatus"))
        self.sectionName = try container.decode(String.self, forKey: JSONKey("sectionName"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        self.studentId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceType", "avatarUrl", "campusType", "className", "enName", "enterDate", "firstName", "graduateTime", "house", "lastClassDate", "lastName", "medical", "medicalTag", "medium", "mediumTag", "myStudent", "name", "outDate", "points", "realStatus", "sectionName", "status", "studentId", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceType") { try container.encode(self.attendanceType.rawValue, forKey: JSONKey("attendanceType")) }
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("campusType") { try container.encode(self.campusType.rawValue, forKey: JSONKey("campusType")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("graduateTime") { try container.encode(self.graduateTime, forKey: JSONKey("graduateTime")) }
        if presentFields.contains("house") { try container.encode(self.house, forKey: JSONKey("house")) }
        if presentFields.contains("lastClassDate") { try container.encode(self.lastClassDate, forKey: JSONKey("lastClassDate")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("medical") { try container.encode(self.medical, forKey: JSONKey("medical")) }
        if presentFields.contains("medicalTag") { try container.encode(self.medicalTag, forKey: JSONKey("medicalTag")) }
        if presentFields.contains("medium") { try container.encode(self.medium, forKey: JSONKey("medium")) }
        if presentFields.contains("mediumTag") { try container.encode(self.mediumTag, forKey: JSONKey("mediumTag")) }
        if presentFields.contains("myStudent") { try container.encode(self.myStudent, forKey: JSONKey("myStudent")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("outDate") { try container.encode(self.outDate, forKey: JSONKey("outDate")) }
        if presentFields.contains("points") { try container.encode(self.points, forKey: JSONKey("points")) }
        if presentFields.contains("realStatus") { try container.encode(self.realStatus, forKey: JSONKey("realStatus")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
