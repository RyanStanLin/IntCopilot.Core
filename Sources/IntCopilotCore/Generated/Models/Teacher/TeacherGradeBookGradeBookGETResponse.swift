import Foundation

public struct TeacherGradeBookGradeBookGETResponseCustomColumnsItem: CapturedResponse {
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

public struct TeacherGradeBookGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem: CapturedResponse {
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

public struct TeacherGradeBookGradeBookGETResponseGradeBookItemsItemTaskScoresItem: CapturedResponse {
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

public struct TeacherGradeBookGradeBookGETResponseGradeBookItemsItem: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 课程名称。
    public let courseName: String
    /// 自定义列成绩。
    public let customColumnScores: [String: TeacherGradeBookGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem]
    /// 是否仍在此课程班级。
    public let inClass: Bool
    /// 学科对象或名称。
    public let subject: String
    /// 任务成绩列表。
    public let taskScores: [TeacherGradeBookGradeBookGETResponseGradeBookItemsItemTaskScoresItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.customColumnScores = try container.decode([String: TeacherGradeBookGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem].self, forKey: JSONKey("customColumnScores"))
        self.inClass = try container.decode(Bool.self, forKey: JSONKey("inClass"))
        self.subject = try container.decode(String.self, forKey: JSONKey("subject"))
        self.taskScores = try container.decode([TeacherGradeBookGradeBookGETResponseGradeBookItemsItemTaskScoresItem].self, forKey: JSONKey("taskScores"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["courseId", "courseName", "customColumnScores", "inClass", "subject", "taskScores"])
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
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherGradeBookGradeBookGETResponseGradeItemsItem: CapturedResponse {
    /// 是否允许锁定成绩列。
    public let canColumnLock: Bool
    /// 显示颜色。
    public let colour: String
    /// 成绩列标识，来自列配置。
    public let columnId: String
    /// 成绩列类别，按成绩簿业务解释。
    public let columnType: String
    /// 是否纳入成绩计算。
    public let countInCalculation: Bool
    /// 当前记录是否可编辑。
    public let editable: Bool
    /// 结束日期或截止时刻，Unix 毫秒。
    public let endDate: Int
    /// 当前成绩项目标识。
    public let itemId: Int
    /// 当前记录是否已锁定。
    public let locked: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 是否向学生发布。
    public let publishStudent: Bool
    /// 是否向教师发布。
    public let publishTeacher: Bool
    /// 评分方式，按本业务域解释；允许为空或缺失。
    public let scoreMethod: JSONValue?
    /// 开始日期或时刻，Unix 毫秒。
    public let startDate: Int
    /// 是否有学生参与。
    public let studentJoin: Bool
    /// 任务评分规则标识；允许为空或缺失。
    public let taskRuleId: JSONValue?
    /// 任务类型标识，来自任务类型选项；允许为空或缺失。
    public let taskTypeId: Int?
    /// 评分上限或统计最高分，依端点业务区分。
    public let topScore: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.canColumnLock = try container.decode(Bool.self, forKey: JSONKey("canColumnLock"))
        self.colour = try container.decode(String.self, forKey: JSONKey("colour"))
        self.columnId = try container.decode(String.self, forKey: JSONKey("columnId"))
        self.columnType = try container.decode(String.self, forKey: JSONKey("columnType"))
        self.countInCalculation = try container.decode(Bool.self, forKey: JSONKey("countInCalculation"))
        self.editable = try container.decode(Bool.self, forKey: JSONKey("editable"))
        self.endDate = try container.decode(Int.self, forKey: JSONKey("endDate"))
        self.itemId = try container.decode(Int.self, forKey: JSONKey("itemId"))
        self.locked = try container.decode(Bool.self, forKey: JSONKey("locked"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.publishStudent = try container.decode(Bool.self, forKey: JSONKey("publishStudent"))
        self.publishTeacher = try container.decode(Bool.self, forKey: JSONKey("publishTeacher"))
        self.scoreMethod = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("scoreMethod"))
        self.startDate = try container.decode(Int.self, forKey: JSONKey("startDate"))
        self.studentJoin = try container.decode(Bool.self, forKey: JSONKey("studentJoin"))
        self.taskRuleId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("taskRuleId"))
        self.taskTypeId = try container.decodeIfPresent(Int.self, forKey: JSONKey("taskTypeId"))
        self.topScore = try container.decode(Double.self, forKey: JSONKey("topScore"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["canColumnLock", "colour", "columnId", "columnType", "countInCalculation", "editable", "endDate", "itemId", "locked", "name", "publishStudent", "publishTeacher", "scoreMethod", "startDate", "studentJoin", "taskRuleId", "taskTypeId", "topScore"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("canColumnLock") { try container.encode(self.canColumnLock, forKey: JSONKey("canColumnLock")) }
        if presentFields.contains("colour") { try container.encode(self.colour, forKey: JSONKey("colour")) }
        if presentFields.contains("columnId") { try container.encode(self.columnId, forKey: JSONKey("columnId")) }
        if presentFields.contains("columnType") { try container.encode(self.columnType, forKey: JSONKey("columnType")) }
        if presentFields.contains("countInCalculation") { try container.encode(self.countInCalculation, forKey: JSONKey("countInCalculation")) }
        if presentFields.contains("editable") { try container.encode(self.editable, forKey: JSONKey("editable")) }
        if presentFields.contains("endDate") { try container.encode(self.endDate, forKey: JSONKey("endDate")) }
        if presentFields.contains("itemId") { try container.encode(self.itemId, forKey: JSONKey("itemId")) }
        if presentFields.contains("locked") { try container.encode(self.locked, forKey: JSONKey("locked")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("publishStudent") { try container.encode(self.publishStudent, forKey: JSONKey("publishStudent")) }
        if presentFields.contains("publishTeacher") { try container.encode(self.publishTeacher, forKey: JSONKey("publishTeacher")) }
        if presentFields.contains("scoreMethod") { try container.encode(self.scoreMethod, forKey: JSONKey("scoreMethod")) }
        if presentFields.contains("startDate") { try container.encode(self.startDate, forKey: JSONKey("startDate")) }
        if presentFields.contains("studentJoin") { try container.encode(self.studentJoin, forKey: JSONKey("studentJoin")) }
        if presentFields.contains("taskRuleId") { try container.encode(self.taskRuleId, forKey: JSONKey("taskRuleId")) }
        if presentFields.contains("taskTypeId") { try container.encode(self.taskTypeId, forKey: JSONKey("taskTypeId")) }
        if presentFields.contains("topScore") { try container.encode(self.topScore, forKey: JSONKey("topScore")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItemGrade: CapturedResponse {
    /// 按评分规则计算的等级。
    public let calculatedLevel: String
    /// 按评分规则计算的分数。
    public let calculatedScore: Double
    /// 成绩等级名称。
    public let level: String
    /// 是否手动录入此项目。
    public let manual: Bool
    /// 手动设置的通过标记。
    public let manualPass: Bool
    /// 分数；单位及评分方式由任务或成绩规则决定。
    public let score: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.calculatedLevel = try container.decode(String.self, forKey: JSONKey("calculatedLevel"))
        self.calculatedScore = try container.decode(Double.self, forKey: JSONKey("calculatedScore"))
        self.level = try container.decode(String.self, forKey: JSONKey("level"))
        self.manual = try container.decode(Bool.self, forKey: JSONKey("manual"))
        self.manualPass = try container.decode(Bool.self, forKey: JSONKey("manualPass"))
        self.score = try container.decode(Double.self, forKey: JSONKey("score"))
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

public struct TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItem: CapturedResponse {
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 年级名称或成绩等级，按所在业务解释。
    public let grade: TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItemGrade
    /// 当前记录是否已提交。
    public let submitted: Bool
    /// 评分备注标签，需按评分业务解析。
    public let tag: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.grade = try container.decode(TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItemGrade.self, forKey: JSONKey("grade"))
        self.submitted = try container.decode(Bool.self, forKey: JSONKey("submitted"))
        self.tag = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("tag")), domain: "unconfirmed:/api/grade-book/grade-book:tag", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["comment", "grade", "submitted", "tag"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("grade") { try container.encode(self.grade, forKey: JSONKey("grade")) }
        if presentFields.contains("submitted") { try container.encode(self.submitted, forKey: JSONKey("submitted")) }
        if presentFields.contains("tag") { try container.encode(self.tag.rawValue, forKey: JSONKey("tag")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherGradeBookGradeBookGETResponseStudentsItem: CapturedResponse {
    /// 按成绩列标识组织的学生成绩。
    public let gradeMap: [String: TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItem]
    /// 是否仍在此课程班级。
    public let inClass: Bool
    /// 学生英文显示姓名。
    public let studentEnName: String
    /// 学生名字或拼音名。
    public let studentFirstName: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生姓氏或拼音姓。
    public let studentLastName: String
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
        self.gradeMap = try container.decode([String: TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItem].self, forKey: JSONKey("gradeMap"))
        self.inClass = try container.decode(Bool.self, forKey: JSONKey("inClass"))
        self.studentEnName = try container.decode(String.self, forKey: JSONKey("studentEnName"))
        self.studentFirstName = try container.decode(String.self, forKey: JSONKey("studentFirstName"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentLastName = try container.decode(String.self, forKey: JSONKey("studentLastName"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["gradeMap", "inClass", "studentEnName", "studentFirstName", "studentId", "studentLastName", "studentName", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("gradeMap") { try container.encode(self.gradeMap, forKey: JSONKey("gradeMap")) }
        if presentFields.contains("inClass") { try container.encode(self.inClass, forKey: JSONKey("inClass")) }
        if presentFields.contains("studentEnName") { try container.encode(self.studentEnName, forKey: JSONKey("studentEnName")) }
        if presentFields.contains("studentFirstName") { try container.encode(self.studentFirstName, forKey: JSONKey("studentFirstName")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentLastName") { try container.encode(self.studentLastName, forKey: JSONKey("studentLastName")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherGradeBookGradeBookGETResponse: CapturedResponse {
    /// 自定义成绩列；允许为空或缺失。
    public let customColumns: [TeacherGradeBookGradeBookGETResponseCustomColumnsItem]?
    /// 当前记录是否可编辑；允许为空或缺失。
    public let editable: Bool?
    /// 按课程组织的成绩簿项目；允许为空或缺失。
    public let gradeBookItems: [TeacherGradeBookGradeBookGETResponseGradeBookItemsItem]?
    /// 完整成绩列或报告成绩项目；允许为空或缺失。
    public let gradeItems: [TeacherGradeBookGradeBookGETResponseGradeItemsItem]?
    /// 等级评分定义；允许为空或缺失。
    public let gradeLevelItems: [JSONValue]?
    /// 评分等级名称；允许为空或缺失。
    public let gradeLevelName: String?
    /// 成绩字段到平均数的映射；允许为空或缺失。
    public let meanMap: [String: Double]?
    /// 成绩字段到中位数的映射；允许为空或缺失。
    public let medianMap: [String: Double]?
    /// 关联学生列表；允许为空或缺失。
    public let students: [TeacherGradeBookGradeBookGETResponseStudentsItem]?
    /// 任务评分等级标识；允许为空或缺失。
    public let taskGradeLevelId: Int?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.customColumns = try container.decodeIfPresent([TeacherGradeBookGradeBookGETResponseCustomColumnsItem].self, forKey: JSONKey("customColumns"))
        self.editable = try container.decodeIfPresent(Bool.self, forKey: JSONKey("editable"))
        self.gradeBookItems = try container.decodeIfPresent([TeacherGradeBookGradeBookGETResponseGradeBookItemsItem].self, forKey: JSONKey("gradeBookItems"))
        self.gradeItems = try container.decodeIfPresent([TeacherGradeBookGradeBookGETResponseGradeItemsItem].self, forKey: JSONKey("gradeItems"))
        self.gradeLevelItems = try container.decodeIfPresent([JSONValue].self, forKey: JSONKey("gradeLevelItems"))
        self.gradeLevelName = try container.decodeIfPresent(String.self, forKey: JSONKey("gradeLevelName"))
        self.meanMap = try container.decodeIfPresent([String: Double].self, forKey: JSONKey("meanMap"))
        self.medianMap = try container.decodeIfPresent([String: Double].self, forKey: JSONKey("medianMap"))
        self.students = try container.decodeIfPresent([TeacherGradeBookGradeBookGETResponseStudentsItem].self, forKey: JSONKey("students"))
        self.taskGradeLevelId = try container.decodeIfPresent(Int.self, forKey: JSONKey("taskGradeLevelId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["customColumns", "editable", "gradeBookItems", "gradeItems", "gradeLevelItems", "gradeLevelName", "meanMap", "medianMap", "students", "taskGradeLevelId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("customColumns") { try container.encode(self.customColumns, forKey: JSONKey("customColumns")) }
        if presentFields.contains("editable") { try container.encode(self.editable, forKey: JSONKey("editable")) }
        if presentFields.contains("gradeBookItems") { try container.encode(self.gradeBookItems, forKey: JSONKey("gradeBookItems")) }
        if presentFields.contains("gradeItems") { try container.encode(self.gradeItems, forKey: JSONKey("gradeItems")) }
        if presentFields.contains("gradeLevelItems") { try container.encode(self.gradeLevelItems, forKey: JSONKey("gradeLevelItems")) }
        if presentFields.contains("gradeLevelName") { try container.encode(self.gradeLevelName, forKey: JSONKey("gradeLevelName")) }
        if presentFields.contains("meanMap") { try container.encode(self.meanMap, forKey: JSONKey("meanMap")) }
        if presentFields.contains("medianMap") { try container.encode(self.medianMap, forKey: JSONKey("medianMap")) }
        if presentFields.contains("students") { try container.encode(self.students, forKey: JSONKey("students")) }
        if presentFields.contains("taskGradeLevelId") { try container.encode(self.taskGradeLevelId, forKey: JSONKey("taskGradeLevelId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
