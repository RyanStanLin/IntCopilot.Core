import Foundation

public struct ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItemData: CapturedResponse {
    /// 出席记录或出席数量。
    public let intime: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.intime = try container.decode(Int.self, forKey: JSONKey("intime"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["intime"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("intime") { try container.encode(self.intime, forKey: JSONKey("intime")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItem: CapturedResponse {
    /// 完整业务数据；结构由当前端点决定。
    public let data: ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItemData
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 成绩周期标识，来自报告周期选项。
    public let gradePeriodId: Int
    /// 报告周期名称。
    public let gradePeriodName: String
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.data = try container.decode(ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItemData.self, forKey: JSONKey("data"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.gradePeriodId = try container.decode(Int.self, forKey: JSONKey("gradePeriodId"))
        self.gradePeriodName = try container.decode(String.self, forKey: JSONKey("gradePeriodName"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["data", "endTime", "gradePeriodId", "gradePeriodName", "startTime"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("data") { try container.encode(self.data, forKey: JSONKey("data")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("gradePeriodId") { try container.encode(self.gradePeriodId, forKey: JSONKey("gradePeriodId")) }
        if presentFields.contains("gradePeriodName") { try container.encode(self.gradePeriodName, forKey: JSONKey("gradePeriodName")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponseGradeItemsItem: CapturedResponse {
    /// 学业达成等级或等级对象。
    public let attainment: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程名称。
    public let courseName: String
    /// 课程教学班名称。
    public let courseScheduleName: String
    /// 自定义列分数。
    public let customColumnScore: Double
    /// 努力程度等级或等级对象。
    public let effort: String
    /// 教学关键词。
    public let keyWords: String
    /// 成绩等级名称。
    public let level: String
    /// 百分制成绩；允许为空或缺失。
    public let percentage: JSONValue?
    /// 完整学科班级信息。
    public let subjectClass: String
    /// 关联教师列表。
    public let teachers: String
    /// 教学内容。
    public let teachingContent: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attainment = try container.decode(String.self, forKey: JSONKey("attainment"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.courseScheduleName = try container.decode(String.self, forKey: JSONKey("courseScheduleName"))
        self.customColumnScore = try container.decode(Double.self, forKey: JSONKey("customColumnScore"))
        self.effort = try container.decode(String.self, forKey: JSONKey("effort"))
        self.keyWords = try container.decode(String.self, forKey: JSONKey("keyWords"))
        self.level = try container.decode(String.self, forKey: JSONKey("level"))
        self.percentage = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("percentage"))
        self.subjectClass = try container.decode(String.self, forKey: JSONKey("subjectClass"))
        self.teachers = try container.decode(String.self, forKey: JSONKey("teachers"))
        self.teachingContent = try container.decode(String.self, forKey: JSONKey("teachingContent"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attainment", "comment", "courseName", "courseScheduleName", "customColumnScore", "effort", "keyWords", "level", "percentage", "subjectClass", "teachers", "teachingContent"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attainment") { try container.encode(self.attainment, forKey: JSONKey("attainment")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("courseScheduleName") { try container.encode(self.courseScheduleName, forKey: JSONKey("courseScheduleName")) }
        if presentFields.contains("customColumnScore") { try container.encode(self.customColumnScore, forKey: JSONKey("customColumnScore")) }
        if presentFields.contains("effort") { try container.encode(self.effort, forKey: JSONKey("effort")) }
        if presentFields.contains("keyWords") { try container.encode(self.keyWords, forKey: JSONKey("keyWords")) }
        if presentFields.contains("level") { try container.encode(self.level, forKey: JSONKey("level")) }
        if presentFields.contains("percentage") { try container.encode(self.percentage, forKey: JSONKey("percentage")) }
        if presentFields.contains("subjectClass") { try container.encode(self.subjectClass, forKey: JSONKey("subjectClass")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        if presentFields.contains("teachingContent") { try container.encode(self.teachingContent, forKey: JSONKey("teachingContent")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponseGradePeriodCampus: CapturedResponse {
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 选项值或显示文本；具体角色由所属选项字典决定；允许为空或缺失。
    public let value: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.value = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["key", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponseGradePeriodSchoolYear: CapturedResponse {
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["key", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponseGradePeriod: CapturedResponse {
    /// 学业达成等级或等级对象。
    public let attainment: Bool
    /// 完整学部对象。
    public let campus: ParentMonthlyGradeReportDetailGETResponseGradePeriodCampus
    /// 课程教师权限。
    public let courseTeacher: Bool
    /// 副负责人完整资料或周期是否启用副负责人评语。
    public let deputyHead: Bool
    /// 副负责人标识，来自教师配置；允许为空或缺失。
    public let deputyHeadId: JSONValue?
    /// 努力程度等级或等级对象。
    public let effort: Bool
    /// 英文名称，可能为空。
    public let enName: String
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 成绩周期的考试百分比项目配置。
    public let ep: Bool
    /// 成绩周期的学院或行为积分项目配置。
    public let hc: Bool
    /// 主班教师信息或启用标记。
    public let headTeacher: Bool
    /// 月度成绩周期标识，来自月度成绩周期列表。
    public let monthlyGradePeriodId: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 报告类别。
    public let reportType: SemanticValue
    /// 所属学年显示文本或选项对象。
    public let schoolYear: ParentMonthlyGradeReportDetailGETResponseGradePeriodSchoolYear
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 课程教学回顾内容。
    public let teachingReview: Bool
    /// 辅导师显示信息。
    public let tutor: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attainment = try container.decode(Bool.self, forKey: JSONKey("attainment"))
        self.campus = try container.decode(ParentMonthlyGradeReportDetailGETResponseGradePeriodCampus.self, forKey: JSONKey("campus"))
        self.courseTeacher = try container.decode(Bool.self, forKey: JSONKey("courseTeacher"))
        self.deputyHead = try container.decode(Bool.self, forKey: JSONKey("deputyHead"))
        self.deputyHeadId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("deputyHeadId"))
        self.effort = try container.decode(Bool.self, forKey: JSONKey("effort"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.ep = try container.decode(Bool.self, forKey: JSONKey("ep"))
        self.hc = try container.decode(Bool.self, forKey: JSONKey("hc"))
        self.headTeacher = try container.decode(Bool.self, forKey: JSONKey("headTeacher"))
        self.monthlyGradePeriodId = try container.decode(Int.self, forKey: JSONKey("monthlyGradePeriodId"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.reportType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("reportType")), domain: "unconfirmed:/api/monthly-grade/report/detail:reportType", decoder: decoder)
        self.schoolYear = try container.decode(ParentMonthlyGradeReportDetailGETResponseGradePeriodSchoolYear.self, forKey: JSONKey("schoolYear"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.teachingReview = try container.decode(Bool.self, forKey: JSONKey("teachingReview"))
        self.tutor = try container.decode(Bool.self, forKey: JSONKey("tutor"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attainment", "campus", "courseTeacher", "deputyHead", "deputyHeadId", "effort", "enName", "endTime", "ep", "hc", "headTeacher", "monthlyGradePeriodId", "name", "reportType", "schoolYear", "startTime", "teachingReview", "tutor"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attainment") { try container.encode(self.attainment, forKey: JSONKey("attainment")) }
        if presentFields.contains("campus") { try container.encode(self.campus, forKey: JSONKey("campus")) }
        if presentFields.contains("courseTeacher") { try container.encode(self.courseTeacher, forKey: JSONKey("courseTeacher")) }
        if presentFields.contains("deputyHead") { try container.encode(self.deputyHead, forKey: JSONKey("deputyHead")) }
        if presentFields.contains("deputyHeadId") { try container.encode(self.deputyHeadId, forKey: JSONKey("deputyHeadId")) }
        if presentFields.contains("effort") { try container.encode(self.effort, forKey: JSONKey("effort")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("ep") { try container.encode(self.ep, forKey: JSONKey("ep")) }
        if presentFields.contains("hc") { try container.encode(self.hc, forKey: JSONKey("hc")) }
        if presentFields.contains("headTeacher") { try container.encode(self.headTeacher, forKey: JSONKey("headTeacher")) }
        if presentFields.contains("monthlyGradePeriodId") { try container.encode(self.monthlyGradePeriodId, forKey: JSONKey("monthlyGradePeriodId")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("reportType") { try container.encode(self.reportType.rawValue, forKey: JSONKey("reportType")) }
        if presentFields.contains("schoolYear") { try container.encode(self.schoolYear, forKey: JSONKey("schoolYear")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("teachingReview") { try container.encode(self.teachingReview, forKey: JSONKey("teachingReview")) }
        if presentFields.contains("tutor") { try container.encode(self.tutor, forKey: JSONKey("tutor")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponseTutorCommentsItem: CapturedResponse {
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 教师显示名称。
    public let teacherName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.teacherName = try container.decode(String.self, forKey: JSONKey("teacherName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["comment", "teacherName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("teacherName") { try container.encode(self.teacherName, forKey: JSONKey("teacherName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentMonthlyGradeReportDetailGETResponse: CapturedResponse {
    /// 报告附带的完整考勤统计。
    public let attendanceInfo: [ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItem]
    /// 行为事件说明。
    public let behaviourEvents: String
    /// 行为积分汇总；允许为空或缺失。
    public let conductPoints: JSONValue?
    /// 自定义成绩列。
    public let customColumns: [JSONValue]
    /// 副负责人评语；允许为空或缺失。
    public let deputyComment: JSONValue?
    /// 年级名称或成绩等级，按所在业务解释。
    public let grade: String
    /// 完整成绩列或报告成绩项目。
    public let gradeItems: [ParentMonthlyGradeReportDetailGETResponseGradeItemsItem]
    /// 完整报告周期配置。
    public let gradePeriod: ParentMonthlyGradeReportDetailGETResponseGradePeriod
    /// 主班教师信息或启用标记。
    public let headTeacher: String
    /// 主班教师评语。
    public let headTeacherComments: [JSONValue]
    /// 学院名称。
    public let house: String
    /// 学院表现说明。
    public let houseAchievements: String
    /// 学院积分；允许为空或缺失。
    public let housePoint: JSONValue?
    /// 报告月份。
    public let month: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 辅导师显示信息。
    public let tutor: String
    /// 辅导师评语。
    public let tutorComments: [ParentMonthlyGradeReportDetailGETResponseTutorCommentsItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendanceInfo = try container.decode([ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItem].self, forKey: JSONKey("attendanceInfo"))
        self.behaviourEvents = try container.decode(String.self, forKey: JSONKey("behaviourEvents"))
        self.conductPoints = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("conductPoints"))
        self.customColumns = try container.decode([JSONValue].self, forKey: JSONKey("customColumns"))
        self.deputyComment = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("deputyComment"))
        self.grade = try container.decode(String.self, forKey: JSONKey("grade"))
        self.gradeItems = try container.decode([ParentMonthlyGradeReportDetailGETResponseGradeItemsItem].self, forKey: JSONKey("gradeItems"))
        self.gradePeriod = try container.decode(ParentMonthlyGradeReportDetailGETResponseGradePeriod.self, forKey: JSONKey("gradePeriod"))
        self.headTeacher = try container.decode(String.self, forKey: JSONKey("headTeacher"))
        self.headTeacherComments = try container.decode([JSONValue].self, forKey: JSONKey("headTeacherComments"))
        self.house = try container.decode(String.self, forKey: JSONKey("house"))
        self.houseAchievements = try container.decode(String.self, forKey: JSONKey("houseAchievements"))
        self.housePoint = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("housePoint"))
        self.month = try container.decode(Int.self, forKey: JSONKey("month"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        self.tutor = try container.decode(String.self, forKey: JSONKey("tutor"))
        self.tutorComments = try container.decode([ParentMonthlyGradeReportDetailGETResponseTutorCommentsItem].self, forKey: JSONKey("tutorComments"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceInfo", "behaviourEvents", "conductPoints", "customColumns", "deputyComment", "grade", "gradeItems", "gradePeriod", "headTeacher", "headTeacherComments", "house", "houseAchievements", "housePoint", "month", "studentName", "studentNum", "tutor", "tutorComments"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceInfo") { try container.encode(self.attendanceInfo, forKey: JSONKey("attendanceInfo")) }
        if presentFields.contains("behaviourEvents") { try container.encode(self.behaviourEvents, forKey: JSONKey("behaviourEvents")) }
        if presentFields.contains("conductPoints") { try container.encode(self.conductPoints, forKey: JSONKey("conductPoints")) }
        if presentFields.contains("customColumns") { try container.encode(self.customColumns, forKey: JSONKey("customColumns")) }
        if presentFields.contains("deputyComment") { try container.encode(self.deputyComment, forKey: JSONKey("deputyComment")) }
        if presentFields.contains("grade") { try container.encode(self.grade, forKey: JSONKey("grade")) }
        if presentFields.contains("gradeItems") { try container.encode(self.gradeItems, forKey: JSONKey("gradeItems")) }
        if presentFields.contains("gradePeriod") { try container.encode(self.gradePeriod, forKey: JSONKey("gradePeriod")) }
        if presentFields.contains("headTeacher") { try container.encode(self.headTeacher, forKey: JSONKey("headTeacher")) }
        if presentFields.contains("headTeacherComments") { try container.encode(self.headTeacherComments, forKey: JSONKey("headTeacherComments")) }
        if presentFields.contains("house") { try container.encode(self.house, forKey: JSONKey("house")) }
        if presentFields.contains("houseAchievements") { try container.encode(self.houseAchievements, forKey: JSONKey("houseAchievements")) }
        if presentFields.contains("housePoint") { try container.encode(self.housePoint, forKey: JSONKey("housePoint")) }
        if presentFields.contains("month") { try container.encode(self.month, forKey: JSONKey("month")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        if presentFields.contains("tutor") { try container.encode(self.tutor, forKey: JSONKey("tutor")) }
        if presentFields.contains("tutorComments") { try container.encode(self.tutorComments, forKey: JSONKey("tutorComments")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
