import Foundation

public struct TeacherTaskDetailGETResponseCourse: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 业务说明或富文本内容。
    public let description: String
    /// 关联学生列表。
    public let students: [JSONValue]
    /// 学科对象或名称；允许为空或缺失。
    public let subject: JSONValue?
    /// 完整教师对象或教师显示信息。
    public let teacher: [JSONValue]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.students = try container.decode([JSONValue].self, forKey: JSONKey("students"))
        self.subject = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("subject"))
        self.teacher = try container.decode([JSONValue].self, forKey: JSONKey("teacher"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["courseId", "description", "students", "subject", "teacher"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("students") { try container.encode(self.students, forKey: JSONKey("students")) }
        if presentFields.contains("subject") { try container.encode(self.subject, forKey: JSONKey("subject")) }
        if presentFields.contains("teacher") { try container.encode(self.teacher, forKey: JSONKey("teacher")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherTaskDetailGETResponseType: CapturedResponse {
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

public struct TeacherTaskDetailGETResponse: CapturedResponse {
    /// 是否允许编辑任务类型。
    public let canEditType: Bool
    /// 完整关联课程对象。
    public let course: TeacherTaskDetailGETResponseCourse
    /// 课程类别，区别常规课程和 CCA。
    public let courseType: SemanticValue
    /// 业务说明或富文本内容。
    public let description: String
    /// 结束日期或截止时刻，Unix 毫秒。
    public let endDate: Int
    /// 是否计入汇总成绩。
    public let inTotal: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 是否线上提交或线上状态。
    public let online: Bool
    /// 是否已超过截止时间。
    public let overDeadline: Bool
    /// 是否公开或发布。
    public let publicFlag: Bool
    /// 完整附件资源引用。
    public let resources: [JSONValue]
    /// 是否启用评分。
    public let scoreFlag: Bool
    /// 开始日期或时刻，Unix 毫秒。
    public let startDate: Int
    /// 学科名称。
    public let subjectName: String
    /// 任务标识，来自任务列表。
    public let taskId: Int
    /// 评分上限或统计最高分，依端点业务区分。
    public let topScore: Int
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: TeacherTaskDetailGETResponseType
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.canEditType = try container.decode(Bool.self, forKey: JSONKey("canEditType"))
        self.course = try container.decode(TeacherTaskDetailGETResponseCourse.self, forKey: JSONKey("course"))
        self.courseType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("courseType")), domain: "courseType", decoder: decoder)
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.endDate = try container.decode(Int.self, forKey: JSONKey("endDate"))
        self.inTotal = try container.decode(Bool.self, forKey: JSONKey("inTotal"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.online = try container.decode(Bool.self, forKey: JSONKey("online"))
        self.overDeadline = try container.decode(Bool.self, forKey: JSONKey("overDeadline"))
        self.publicFlag = try container.decode(Bool.self, forKey: JSONKey("publicFlag"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.scoreFlag = try container.decode(Bool.self, forKey: JSONKey("scoreFlag"))
        self.startDate = try container.decode(Int.self, forKey: JSONKey("startDate"))
        self.subjectName = try container.decode(String.self, forKey: JSONKey("subjectName"))
        self.taskId = try container.decode(Int.self, forKey: JSONKey("taskId"))
        self.topScore = try container.decode(Int.self, forKey: JSONKey("topScore"))
        self.type = try container.decode(TeacherTaskDetailGETResponseType.self, forKey: JSONKey("type"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["canEditType", "course", "courseType", "description", "endDate", "inTotal", "name", "online", "overDeadline", "publicFlag", "resources", "scoreFlag", "startDate", "subjectName", "taskId", "topScore", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("canEditType") { try container.encode(self.canEditType, forKey: JSONKey("canEditType")) }
        if presentFields.contains("course") { try container.encode(self.course, forKey: JSONKey("course")) }
        if presentFields.contains("courseType") { try container.encode(self.courseType.rawValue, forKey: JSONKey("courseType")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("endDate") { try container.encode(self.endDate, forKey: JSONKey("endDate")) }
        if presentFields.contains("inTotal") { try container.encode(self.inTotal, forKey: JSONKey("inTotal")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("online") { try container.encode(self.online, forKey: JSONKey("online")) }
        if presentFields.contains("overDeadline") { try container.encode(self.overDeadline, forKey: JSONKey("overDeadline")) }
        if presentFields.contains("publicFlag") { try container.encode(self.publicFlag, forKey: JSONKey("publicFlag")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("scoreFlag") { try container.encode(self.scoreFlag, forKey: JSONKey("scoreFlag")) }
        if presentFields.contains("startDate") { try container.encode(self.startDate, forKey: JSONKey("startDate")) }
        if presentFields.contains("subjectName") { try container.encode(self.subjectName, forKey: JSONKey("subjectName")) }
        if presentFields.contains("taskId") { try container.encode(self.taskId, forKey: JSONKey("taskId")) }
        if presentFields.contains("topScore") { try container.encode(self.topScore, forKey: JSONKey("topScore")) }
        if presentFields.contains("type") { try container.encode(self.type, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
