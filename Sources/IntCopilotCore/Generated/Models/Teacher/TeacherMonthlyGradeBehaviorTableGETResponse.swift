import Foundation

public struct TeacherMonthlyGradeBehaviorTableGETResponseItem: CapturedResponse {
    /// 辅导或学院分组显示名称。
    public let advisory: String
    /// 行为事件说明。
    public let behaviourEvent: String
    /// 主班级名称。
    public let className: String
    /// 行为积分。
    public let conductPoint: Int
    /// 完整宿舍对象或宿舍名称。
    public let dormitory: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 名字或拼音名。
    public let firstName: String
    /// 年级名称或成绩等级，按所在业务解释。
    public let grade: String
    /// 学院表现说明。
    public let houseAchievement: String
    /// 学院积分。
    public let housePoint: Int
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 业务实体或选项名称。
    public let name: String
    /// 当前学年行为积分。
    public let schoolYearConductPoint: Int
    /// 当前学年学院积分。
    public let schoolYearHousePoint: Int
    /// 完整自习室对象或名称。
    public let selfStudyRoom: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.advisory = try container.decode(String.self, forKey: JSONKey("advisory"))
        self.behaviourEvent = try container.decode(String.self, forKey: JSONKey("behaviourEvent"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.conductPoint = try container.decode(Int.self, forKey: JSONKey("conductPoint"))
        self.dormitory = try container.decode(String.self, forKey: JSONKey("dormitory"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.grade = try container.decode(String.self, forKey: JSONKey("grade"))
        self.houseAchievement = try container.decode(String.self, forKey: JSONKey("houseAchievement"))
        self.housePoint = try container.decode(Int.self, forKey: JSONKey("housePoint"))
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.schoolYearConductPoint = try container.decode(Int.self, forKey: JSONKey("schoolYearConductPoint"))
        self.schoolYearHousePoint = try container.decode(Int.self, forKey: JSONKey("schoolYearHousePoint"))
        self.selfStudyRoom = try container.decode(String.self, forKey: JSONKey("selfStudyRoom"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["advisory", "behaviourEvent", "className", "conductPoint", "dormitory", "enName", "firstName", "grade", "houseAchievement", "housePoint", "lastName", "name", "schoolYearConductPoint", "schoolYearHousePoint", "selfStudyRoom", "studentId", "studentName", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("advisory") { try container.encode(self.advisory, forKey: JSONKey("advisory")) }
        if presentFields.contains("behaviourEvent") { try container.encode(self.behaviourEvent, forKey: JSONKey("behaviourEvent")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("conductPoint") { try container.encode(self.conductPoint, forKey: JSONKey("conductPoint")) }
        if presentFields.contains("dormitory") { try container.encode(self.dormitory, forKey: JSONKey("dormitory")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("grade") { try container.encode(self.grade, forKey: JSONKey("grade")) }
        if presentFields.contains("houseAchievement") { try container.encode(self.houseAchievement, forKey: JSONKey("houseAchievement")) }
        if presentFields.contains("housePoint") { try container.encode(self.housePoint, forKey: JSONKey("housePoint")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("schoolYearConductPoint") { try container.encode(self.schoolYearConductPoint, forKey: JSONKey("schoolYearConductPoint")) }
        if presentFields.contains("schoolYearHousePoint") { try container.encode(self.schoolYearHousePoint, forKey: JSONKey("schoolYearHousePoint")) }
        if presentFields.contains("selfStudyRoom") { try container.encode(self.selfStudyRoom, forKey: JSONKey("selfStudyRoom")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherMonthlyGradeBehaviorTableGETResponse = [TeacherMonthlyGradeBehaviorTableGETResponseItem]
