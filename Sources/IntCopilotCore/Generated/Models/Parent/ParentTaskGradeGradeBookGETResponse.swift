import Foundation

public struct ParentTaskGradeGradeBookGETResponseCustomColumnsItem: CapturedResponse {
    /// 自定义成绩列标识，来自成绩簿列配置。
    public let customColumnId: Int
    /// 自定义成绩列名称。
    public let customColumnName: String
    /// 是否向家长发布。
    public let publishParent: Bool
    /// 是否向学生发布。
    public let publishStudent: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.customColumnId = try container.decode(Int.self, forKey: JSONKey("customColumnId"))
        self.customColumnName = try container.decode(String.self, forKey: JSONKey("customColumnName"))
        self.publishParent = try container.decode(Bool.self, forKey: JSONKey("publishParent"))
        self.publishStudent = try container.decode(Bool.self, forKey: JSONKey("publishStudent"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["customColumnId", "customColumnName", "publishParent", "publishStudent"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("customColumnId") { try container.encode(self.customColumnId, forKey: JSONKey("customColumnId")) }
        if presentFields.contains("customColumnName") { try container.encode(self.customColumnName, forKey: JSONKey("customColumnName")) }
        if presentFields.contains("publishParent") { try container.encode(self.publishParent, forKey: JSONKey("publishParent")) }
        if presentFields.contains("publishStudent") { try container.encode(self.publishStudent, forKey: JSONKey("publishStudent")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentTaskGradeGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem: CapturedResponse {
    /// 按评分规则计算的等级。
    public let calculatedLevel: String
    /// 按评分规则计算的分数；允许为空或缺失。
    public let calculatedScore: Double?
    /// 成绩等级名称。
    public let level: String
    /// 是否手动录入此项目。
    public let manual: Bool
    /// 手动设置的通过标记。
    public let manualPass: Bool
    /// 分数；单位及评分方式由任务或成绩规则决定；允许为空或缺失。
    public let score: Double?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.calculatedLevel = try container.decode(String.self, forKey: JSONKey("calculatedLevel"))
        self.calculatedScore = try container.decodeIfPresent(Double.self, forKey: JSONKey("calculatedScore"))
        self.level = try container.decode(String.self, forKey: JSONKey("level"))
        self.manual = try container.decode(Bool.self, forKey: JSONKey("manual"))
        self.manualPass = try container.decode(Bool.self, forKey: JSONKey("manualPass"))
        self.score = try container.decodeIfPresent(Double.self, forKey: JSONKey("score"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["calculatedLevel", "calculatedScore", "level", "manual", "manualPass", "score"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("calculatedLevel") { try container.encode(self.calculatedLevel, forKey: JSONKey("calculatedLevel")) }
        if presentFields.contains("calculatedScore") { try container.encode(self.calculatedScore, forKey: JSONKey("calculatedScore")) }
        if presentFields.contains("level") { try container.encode(self.level, forKey: JSONKey("level")) }
        if presentFields.contains("manual") { try container.encode(self.manual, forKey: JSONKey("manual")) }
        if presentFields.contains("manualPass") { try container.encode(self.manualPass, forKey: JSONKey("manualPass")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentTaskGradeGradeBookGETResponseGradeBookItemsItemTaskScoresItem: CapturedResponse {
    /// 业务名称缩写。
    public let abbr: String
    /// 显示颜色。
    public let color: String
    /// 结束日期或截止时刻，Unix 毫秒。
    public let endDate: Int
    /// 分数；单位及评分方式由任务或成绩规则决定；允许为空或缺失。
    public let score: Double?
    /// 是否启用评分。
    public let scoreFlag: Bool
    /// 评分方式，按本业务域解释；允许为空或缺失。
    public let scoreMethod: JSONValue?
    /// 任务标识，来自任务列表。
    public let taskId: Int
    /// 任务显示名称。
    public let taskName: String
    /// 学生任务关联标识，来自任务列表或任务学生记录。
    public let taskStudentId: Int
    /// 任务类型名称。
    public let taskTypeName: String
    /// 评分上限或统计最高分，依端点业务区分。
    public let topScore: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.abbr = try container.decode(String.self, forKey: JSONKey("abbr"))
        self.color = try container.decode(String.self, forKey: JSONKey("color"))
        self.endDate = try container.decode(Int.self, forKey: JSONKey("endDate"))
        self.score = try container.decodeIfPresent(Double.self, forKey: JSONKey("score"))
        self.scoreFlag = try container.decode(Bool.self, forKey: JSONKey("scoreFlag"))
        self.scoreMethod = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("scoreMethod"))
        self.taskId = try container.decode(Int.self, forKey: JSONKey("taskId"))
        self.taskName = try container.decode(String.self, forKey: JSONKey("taskName"))
        self.taskStudentId = try container.decode(Int.self, forKey: JSONKey("taskStudentId"))
        self.taskTypeName = try container.decode(String.self, forKey: JSONKey("taskTypeName"))
        self.topScore = try container.decode(Double.self, forKey: JSONKey("topScore"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["abbr", "color", "endDate", "score", "scoreFlag", "scoreMethod", "taskId", "taskName", "taskStudentId", "taskTypeName", "topScore"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("abbr") { try container.encode(self.abbr, forKey: JSONKey("abbr")) }
        if presentFields.contains("color") { try container.encode(self.color, forKey: JSONKey("color")) }
        if presentFields.contains("endDate") { try container.encode(self.endDate, forKey: JSONKey("endDate")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        if presentFields.contains("scoreFlag") { try container.encode(self.scoreFlag, forKey: JSONKey("scoreFlag")) }
        if presentFields.contains("scoreMethod") { try container.encode(self.scoreMethod, forKey: JSONKey("scoreMethod")) }
        if presentFields.contains("taskId") { try container.encode(self.taskId, forKey: JSONKey("taskId")) }
        if presentFields.contains("taskName") { try container.encode(self.taskName, forKey: JSONKey("taskName")) }
        if presentFields.contains("taskStudentId") { try container.encode(self.taskStudentId, forKey: JSONKey("taskStudentId")) }
        if presentFields.contains("taskTypeName") { try container.encode(self.taskTypeName, forKey: JSONKey("taskTypeName")) }
        if presentFields.contains("topScore") { try container.encode(self.topScore, forKey: JSONKey("topScore")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentTaskGradeGradeBookGETResponseGradeBookItemsItem: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 课程名称。
    public let courseName: String
    /// 自定义列成绩。
    public let customColumnScores: [String: ParentTaskGradeGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem]
    /// 是否仍在此课程班级。
    public let inClass: Bool
    /// 学科对象或名称。
    public let subject: String
    /// 任务成绩列表。
    public let taskScores: [ParentTaskGradeGradeBookGETResponseGradeBookItemsItemTaskScoresItem]
    /// 关联教师名称文本。
    public let teacherNames: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.customColumnScores = try container.decode([String: ParentTaskGradeGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem].self, forKey: JSONKey("customColumnScores"))
        self.inClass = try container.decode(Bool.self, forKey: JSONKey("inClass"))
        self.subject = try container.decode(String.self, forKey: JSONKey("subject"))
        self.taskScores = try container.decode([ParentTaskGradeGradeBookGETResponseGradeBookItemsItemTaskScoresItem].self, forKey: JSONKey("taskScores"))
        self.teacherNames = try container.decode(String.self, forKey: JSONKey("teacherNames"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["courseId", "courseName", "customColumnScores", "inClass", "subject", "taskScores", "teacherNames"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("customColumnScores") { try container.encode(self.customColumnScores, forKey: JSONKey("customColumnScores")) }
        if presentFields.contains("inClass") { try container.encode(self.inClass, forKey: JSONKey("inClass")) }
        if presentFields.contains("subject") { try container.encode(self.subject, forKey: JSONKey("subject")) }
        if presentFields.contains("taskScores") { try container.encode(self.taskScores, forKey: JSONKey("taskScores")) }
        if presentFields.contains("teacherNames") { try container.encode(self.teacherNames, forKey: JSONKey("teacherNames")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentTaskGradeGradeBookGETResponse: CapturedResponse {
    /// 自定义成绩列。
    public let customColumns: [ParentTaskGradeGradeBookGETResponseCustomColumnsItem]
    /// 按课程组织的成绩簿项目。
    public let gradeBookItems: [ParentTaskGradeGradeBookGETResponseGradeBookItemsItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.customColumns = try container.decode([ParentTaskGradeGradeBookGETResponseCustomColumnsItem].self, forKey: JSONKey("customColumns"))
        self.gradeBookItems = try container.decode([ParentTaskGradeGradeBookGETResponseGradeBookItemsItem].self, forKey: JSONKey("gradeBookItems"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["customColumns", "gradeBookItems"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("customColumns") { try container.encode(self.customColumns, forKey: JSONKey("customColumns")) }
        if presentFields.contains("gradeBookItems") { try container.encode(self.gradeBookItems, forKey: JSONKey("gradeBookItems")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
