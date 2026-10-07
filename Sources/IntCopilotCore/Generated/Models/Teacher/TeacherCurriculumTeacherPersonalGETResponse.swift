import Foundation

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemClassRoomId: CapturedResponse {
    /// 教室标识或教室对象，来自教室选项或课表。
    public let classRoomId: Int
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
        self.classRoomId = try container.decode(Int.self, forKey: JSONKey("classRoomId"))
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

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdStudentsItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 名字或拼音名。
    public let firstName: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 业务实体或选项名称。
    public let name: String
    /// 年级或年段标识，来自年段选项；允许为空或缺失。
    public let sectionId: JSONValue?
    /// 年段名称。
    public let sectionName: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("sectionId"))
        self.sectionName = try container.decode(String.self, forKey: JSONKey("sectionName"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "enName", "firstName", "gender", "lastName", "name", "sectionId", "sectionName", "studentId", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionId") { try container.encode(self.sectionId, forKey: JSONKey("sectionId")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdSubject: CapturedResponse {
    /// 显示颜色。
    public let color: String
    /// 是否纳入成绩计算。
    public let countIn: Bool
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
        self.countIn = try container.decode(Bool.self, forKey: JSONKey("countIn"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.subjectId = try container.decode(Int.self, forKey: JSONKey("subjectId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["color", "countIn", "description", "subjectId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("color") { try container.encode(self.color, forKey: JSONKey("color")) }
        if presentFields.contains("countIn") { try container.encode(self.countIn, forKey: JSONKey("countIn")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("subjectId") { try container.encode(self.subjectId, forKey: JSONKey("subjectId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdTeacherItem: CapturedResponse {
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

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseId: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 业务说明或富文本内容。
    public let description: String
    /// 关联学生列表。
    public let students: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdStudentsItem]
    /// 学科对象或名称；允许为空或缺失。
    public let subject: TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdSubject?
    /// 完整教师对象或教师显示信息。
    public let teacher: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdTeacherItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.students = try container.decode([TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdStudentsItem].self, forKey: JSONKey("students"))
        self.subject = try container.decodeIfPresent(TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdSubject.self, forKey: JSONKey("subject"))
        self.teacher = try container.decode([TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdTeacherItem].self, forKey: JSONKey("teacher"))
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

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTargetSectionsItem: CapturedResponse {
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

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTeachersItem: CapturedResponse {
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

public struct TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItem: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表。
    public let classArrangeId: Int
    /// 教室标识或教室对象，来自教室选项或课表。
    public let classRoomId: TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemClassRoomId
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseId
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 调课前的星期序号；允许为空或缺失。
    public let originDayOfWeek: JSONValue?
    /// 安排包含的课节定义。
    public let periods: Int
    /// 完整附件资源引用。
    public let resources: [JSONValue]
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 课程对应年段集合。
    public let targetSections: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTargetSectionsItem]
    /// 关联教师列表。
    public let teachers: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTeachersItem]
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 本次安排所属周信息；允许为空或缺失。
    public let week: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decode(Int.self, forKey: JSONKey("classArrangeId"))
        self.classRoomId = try container.decode(TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemClassRoomId.self, forKey: JSONKey("classRoomId"))
        self.courseId = try container.decode(TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseId.self, forKey: JSONKey("courseId"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.originDayOfWeek = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("originDayOfWeek"))
        self.periods = try container.decode(Int.self, forKey: JSONKey("periods"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.targetSections = try container.decode([TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTargetSectionsItem].self, forKey: JSONKey("targetSections"))
        self.teachers = try container.decode([TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTeachersItem].self, forKey: JSONKey("teachers"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "curriculumType", decoder: decoder)
        self.week = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("week"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoomId", "courseId", "endTime", "originDayOfWeek", "periods", "resources", "startTime", "targetSections", "teachers", "type", "week"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoomId") { try container.encode(self.classRoomId, forKey: JSONKey("classRoomId")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("originDayOfWeek") { try container.encode(self.originDayOfWeek, forKey: JSONKey("originDayOfWeek")) }
        if presentFields.contains("periods") { try container.encode(self.periods, forKey: JSONKey("periods")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("targetSections") { try container.encode(self.targetSections, forKey: JSONKey("targetSections")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("week") { try container.encode(self.week, forKey: JSONKey("week")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumTeacherPersonalGETResponse: CapturedResponse {
    /// 按星期与课节组织的课表。
    public let classArranges: [String: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItem]]
    /// 公共或机构课程安排计数。
    public let institute: Int
    /// 常规课程安排计数。
    public let regular: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArranges = try container.decode([String: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItem]].self, forKey: JSONKey("classArranges"))
        self.institute = try container.decode(Int.self, forKey: JSONKey("institute"))
        self.regular = try container.decode(Int.self, forKey: JSONKey("regular"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArranges", "institute", "regular"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArranges") { try container.encode(self.classArranges, forKey: JSONKey("classArranges")) }
        if presentFields.contains("institute") { try container.encode(self.institute, forKey: JSONKey("institute")) }
        if presentFields.contains("regular") { try container.encode(self.regular, forKey: JSONKey("regular")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
