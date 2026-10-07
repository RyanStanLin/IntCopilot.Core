import Foundation

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId: CapturedResponse {
    /// 教室标识或教室对象，来自教室选项或课表；允许为空或缺失。
    public let classRoomId: Int?
    /// 本业务域代码，需结合该对象的名称解释。
    public let code: String
    /// 当前列表显示序号；允许为空或缺失。
    public let seqNum: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classRoomId = try container.decodeIfPresent(Int.self, forKey: JSONKey("classRoomId"))
        self.code = try container.decode(String.self, forKey: JSONKey("code"))
        self.seqNum = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("seqNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classRoomId", "code", "seqNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classRoomId") { try container.encode(self.classRoomId, forKey: JSONKey("classRoomId")) }
        if presentFields.contains("code") { try container.encode(self.code, forKey: JSONKey("code")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem: CapturedResponse {
    /// 业务实体或选项名称。
    public let name: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["name", "studentId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject: CapturedResponse {
    /// 显示颜色。
    public let color: String
    /// 业务说明或富文本内容。
    public let description: String
    /// 学科标识，来自学科选项或课程配置。
    public let subjectId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.color = try container.decode(String.self, forKey: JSONKey("color"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.subjectId = try container.decode(Int.self, forKey: JSONKey("subjectId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["color", "description", "subjectId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("color") { try container.encode(self.color, forKey: JSONKey("color")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("subjectId") { try container.encode(self.subjectId, forKey: JSONKey("subjectId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 主班教师权限。
    public let classTeacher: Bool
    /// 课程教师权限。
    public let courseTeacher: Bool
    /// 前端使用的显示名称。
    public let displayName: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 学院教师权限。
    public let houseTeacher: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 年段教师权限。
    public let sectionTeacher: Bool
    /// 教师标识，来自用户信息或教师列表。
    public let teacherId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.classTeacher = try container.decode(Bool.self, forKey: JSONKey("classTeacher"))
        self.courseTeacher = try container.decode(Bool.self, forKey: JSONKey("courseTeacher"))
        self.displayName = try container.decode(String.self, forKey: JSONKey("displayName"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.houseTeacher = try container.decode(Bool.self, forKey: JSONKey("houseTeacher"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionTeacher = try container.decode(Bool.self, forKey: JSONKey("sectionTeacher"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "classTeacher", "courseTeacher", "displayName", "enName", "houseTeacher", "name", "sectionTeacher", "teacherId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("classTeacher") { try container.encode(self.classTeacher, forKey: JSONKey("classTeacher")) }
        if presentFields.contains("courseTeacher") { try container.encode(self.courseTeacher, forKey: JSONKey("courseTeacher")) }
        if presentFields.contains("displayName") { try container.encode(self.displayName, forKey: JSONKey("displayName")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("houseTeacher") { try container.encode(self.houseTeacher, forKey: JSONKey("houseTeacher")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionTeacher") { try container.encode(self.sectionTeacher, forKey: JSONKey("sectionTeacher")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表；允许为空或缺失。
    public let courseId: Int?
    /// 业务说明或富文本内容。
    public let description: String
    /// 关联学生列表。
    public let students: [ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem]
    /// 学科对象或名称；允许为空或缺失。
    public let subject: ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject?
    /// 完整教师对象或教师显示信息。
    public let teacher: [ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decodeIfPresent(Int.self, forKey: JSONKey("courseId"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.students = try container.decode([ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem].self, forKey: JSONKey("students"))
        self.subject = try container.decodeIfPresent(ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject.self, forKey: JSONKey("subject"))
        self.teacher = try container.decode([ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem].self, forKey: JSONKey("teacher"))
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

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem: CapturedResponse {
    /// 学部名称。
    public let campusName: String
    /// 业务实体或选项名称。
    public let name: String
    /// 年段所属学部标识。
    public let sectionCampusId: Int
    /// 年段名称。
    public let sectionName: String
    /// 当前列表显示序号；允许为空或缺失。
    public let seqNum: JSONValue?
    /// 关联教师列表。
    public let teachers: [JSONValue]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.campusName = try container.decode(String.self, forKey: JSONKey("campusName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionCampusId = try container.decode(Int.self, forKey: JSONKey("sectionCampusId"))
        self.sectionName = try container.decode(String.self, forKey: JSONKey("sectionName"))
        self.seqNum = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("seqNum"))
        self.teachers = try container.decode([JSONValue].self, forKey: JSONKey("teachers"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["campusName", "name", "sectionCampusId", "sectionName", "seqNum", "teachers"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("campusName") { try container.encode(self.campusName, forKey: JSONKey("campusName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionCampusId") { try container.encode(self.sectionCampusId, forKey: JSONKey("sectionCampusId")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem: CapturedResponse {
    /// 是否代课安排。
    public let isSubstitute: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 教师标识，来自用户信息或教师列表。
    public let teacherId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.isSubstitute = try container.decode(Bool.self, forKey: JSONKey("isSubstitute"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["isSubstitute", "name", "teacherId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("isSubstitute") { try container.encode(self.isSubstitute, forKey: JSONKey("isSubstitute")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表。
    public let classArrangeId: Int
    /// 教室标识或教室对象，来自教室选项或课表。
    public let classRoomId: ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 调课前的星期序号；允许为空或缺失。
    public let originDayOfWeek: JSONValue?
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 课程对应年段集合。
    public let targetSections: [ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem]
    /// 关联教师列表。
    public let teachers: [ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem]
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 本次安排所属周信息；允许为空或缺失。
    public let week: Int?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decode(Int.self, forKey: JSONKey("classArrangeId"))
        self.classRoomId = try container.decode(ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId.self, forKey: JSONKey("classRoomId"))
        self.courseId = try container.decode(ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId.self, forKey: JSONKey("courseId"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.originDayOfWeek = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("originDayOfWeek"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.targetSections = try container.decode([ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem].self, forKey: JSONKey("targetSections"))
        self.teachers = try container.decode([ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem].self, forKey: JSONKey("teachers"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "curriculumType", decoder: decoder)
        self.week = try container.decodeIfPresent(Int.self, forKey: JSONKey("week"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoomId", "courseId", "endTime", "originDayOfWeek", "startTime", "targetSections", "teachers", "type", "week"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoomId") { try container.encode(self.classRoomId, forKey: JSONKey("classRoomId")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("originDayOfWeek") { try container.encode(self.originDayOfWeek, forKey: JSONKey("originDayOfWeek")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("targetSections") { try container.encode(self.targetSections, forKey: JSONKey("targetSections")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("week") { try container.encode(self.week, forKey: JSONKey("week")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem: CapturedResponse {
    /// 课节定义标识，来自课节列表。
    public let classPeriodId: Int
    /// 业务说明或富文本内容。
    public let description: String
    /// 区间结束值；日期查询使用 Unix 毫秒。
    public let end: Int
    /// 是否安排完整课节。
    public let isFullPeriodArranged: Bool
    /// 未确认语义的课节配置标记，保留上游值。
    public let sevenFive: Bool
    /// 区间开始值；日期查询使用 Unix 毫秒。
    public let start: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classPeriodId = try container.decode(Int.self, forKey: JSONKey("classPeriodId"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.end = try container.decode(Int.self, forKey: JSONKey("end"))
        self.isFullPeriodArranged = try container.decode(Bool.self, forKey: JSONKey("isFullPeriodArranged"))
        self.sevenFive = try container.decode(Bool.self, forKey: JSONKey("sevenFive"))
        self.start = try container.decode(Int.self, forKey: JSONKey("start"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classPeriodId", "description", "end", "isFullPeriodArranged", "sevenFive", "start"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classPeriodId") { try container.encode(self.classPeriodId, forKey: JSONKey("classPeriodId")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("end") { try container.encode(self.end, forKey: JSONKey("end")) }
        if presentFields.contains("isFullPeriodArranged") { try container.encode(self.isFullPeriodArranged, forKey: JSONKey("isFullPeriodArranged")) }
        if presentFields.contains("sevenFive") { try container.encode(self.sevenFive, forKey: JSONKey("sevenFive")) }
        if presentFields.contains("start") { try container.encode(self.start, forKey: JSONKey("start")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCurriculumStudentSchoolYearIdGETResponse: CapturedResponse {
    /// 按星期与课节组织的课表。
    public let classArranges: [String: [String: ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem]]
    /// 课节定义列表。
    public let classPeriods: [ParentCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem]
    /// 课表安排日期信息。
    public let dayOfArranged: [JSONValue]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArranges = try container.decode([String: [String: ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem]].self, forKey: JSONKey("classArranges"))
        self.classPeriods = try container.decode([ParentCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem].self, forKey: JSONKey("classPeriods"))
        self.dayOfArranged = try container.decode([JSONValue].self, forKey: JSONKey("dayOfArranged"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArranges", "classPeriods", "dayOfArranged"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArranges") { try container.encode(self.classArranges, forKey: JSONKey("classArranges")) }
        if presentFields.contains("classPeriods") { try container.encode(self.classPeriods, forKey: JSONKey("classPeriods")) }
        if presentFields.contains("dayOfArranged") { try container.encode(self.dayOfArranged, forKey: JSONKey("dayOfArranged")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
