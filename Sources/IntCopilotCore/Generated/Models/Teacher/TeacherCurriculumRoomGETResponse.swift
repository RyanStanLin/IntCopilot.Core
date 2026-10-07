import Foundation

public struct TeacherCurriculumRoomGETResponseItemItemClassRoomId: CapturedResponse {
    /// 完整楼栋对象或名称。
    public let building: String
    /// 教室标识或教室对象，来自教室选项或课表。
    public let classRoomId: Int
    /// 本业务域代码，需结合该对象的名称解释。
    public let code: String
    /// 业务实体或选项名称。
    public let name: String
    /// 上游实际业务编码，含义依实体区分。
    public let realCode: String
    /// 关联学科列表；允许为空或缺失。
    public let subjects: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.building = try container.decode(String.self, forKey: JSONKey("building"))
        self.classRoomId = try container.decode(Int.self, forKey: JSONKey("classRoomId"))
        self.code = try container.decode(String.self, forKey: JSONKey("code"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.realCode = try container.decode(String.self, forKey: JSONKey("realCode"))
        self.subjects = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("subjects"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["building", "classRoomId", "code", "name", "realCode", "subjects"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("building") { try container.encode(self.building, forKey: JSONKey("building")) }
        if presentFields.contains("classRoomId") { try container.encode(self.classRoomId, forKey: JSONKey("classRoomId")) }
        if presentFields.contains("code") { try container.encode(self.code, forKey: JSONKey("code")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("realCode") { try container.encode(self.realCode, forKey: JSONKey("realCode")) }
        if presentFields.contains("subjects") { try container.encode(self.subjects, forKey: JSONKey("subjects")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdClassRoom: CapturedResponse {
    /// 完整楼栋对象或名称；允许为空或缺失。
    public let building: JSONValue?
    /// 教室标识或教室对象，来自教室选项或课表。
    public let classRoomId: Int
    /// 本业务域代码，需结合该对象的名称解释。
    public let code: String
    /// 业务实体或选项名称；允许为空或缺失。
    public let name: JSONValue?
    /// 上游实际业务编码，含义依实体区分；允许为空或缺失。
    public let realCode: JSONValue?
    /// 关联学科列表；允许为空或缺失。
    public let subjects: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.building = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("building"))
        self.classRoomId = try container.decode(Int.self, forKey: JSONKey("classRoomId"))
        self.code = try container.decode(String.self, forKey: JSONKey("code"))
        self.name = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("name"))
        self.realCode = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("realCode"))
        self.subjects = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("subjects"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["building", "classRoomId", "code", "name", "realCode", "subjects"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("building") { try container.encode(self.building, forKey: JSONKey("building")) }
        if presentFields.contains("classRoomId") { try container.encode(self.classRoomId, forKey: JSONKey("classRoomId")) }
        if presentFields.contains("code") { try container.encode(self.code, forKey: JSONKey("code")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("realCode") { try container.encode(self.realCode, forKey: JSONKey("realCode")) }
        if presentFields.contains("subjects") { try container.encode(self.subjects, forKey: JSONKey("subjects")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdOpenSchoolYear: CapturedResponse {
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 学年标识，来自当前学年或学年选项。
    public let schoolYearId: Int
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.schoolYearId = try container.decode(Int.self, forKey: JSONKey("schoolYearId"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["endTime", "name", "schoolYearId", "startTime"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("schoolYearId") { try container.encode(self.schoolYearId, forKey: JSONKey("schoolYearId")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdSemestersItem: CapturedResponse {
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 学期标识，来自学期选项。
    public let semesterId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.semesterId = try container.decode(Int.self, forKey: JSONKey("semesterId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["endTime", "name", "semesterId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("semesterId") { try container.encode(self.semesterId, forKey: JSONKey("semesterId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdStudentsItem: CapturedResponse {
    /// 头像资源地址；允许为空或缺失。
    public let avatarUrl: JSONValue?
    /// 完整展开显示名称；允许为空或缺失。
    public let detailedName: JSONValue?
    /// 英文名称，可能为空；允许为空或缺失。
    public let enName: JSONValue?
    /// 名字或拼音名；允许为空或缺失。
    public let firstName: JSONValue?
    /// 性别语义值；允许为空或缺失。
    public let gender: JSONValue?
    /// 姓氏或拼音姓；允许为空或缺失。
    public let lastName: JSONValue?
    /// 业务实体或选项名称。
    public let name: String
    /// 年级或年段标识，来自年段选项；允许为空或缺失。
    public let sectionId: JSONValue?
    /// 年段名称；允许为空或缺失。
    public let sectionName: JSONValue?
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生学号或统计学生数量，依端点区分；允许为空或缺失。
    public let studentNum: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("avatarUrl"))
        self.detailedName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("detailedName"))
        self.enName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("enName"))
        self.firstName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("firstName"))
        self.gender = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("gender"))
        self.lastName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("lastName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("sectionId"))
        self.sectionName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("sectionName"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "detailedName", "enName", "firstName", "gender", "lastName", "name", "sectionId", "sectionName", "studentId", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("detailedName") { try container.encode(self.detailedName, forKey: JSONKey("detailedName")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("gender") { try container.encode(self.gender, forKey: JSONKey("gender")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionId") { try container.encode(self.sectionId, forKey: JSONKey("sectionId")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdSubject: CapturedResponse {
    /// 显示颜色。
    public let color: String
    /// 是否纳入成绩计算。
    public let countIn: Bool
    /// 业务说明或富文本内容。
    public let description: String
    /// 显示排序序号；允许为空或缺失。
    public let sortNum: JSONValue?
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
        self.sortNum = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("sortNum"))
        self.subjectId = try container.decode(Int.self, forKey: JSONKey("subjectId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["color", "countIn", "description", "sortNum", "subjectId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("color") { try container.encode(self.color, forKey: JSONKey("color")) }
        if presentFields.contains("countIn") { try container.encode(self.countIn, forKey: JSONKey("countIn")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("sortNum") { try container.encode(self.sortNum, forKey: JSONKey("sortNum")) }
        if presentFields.contains("subjectId") { try container.encode(self.subjectId, forKey: JSONKey("subjectId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdTargetSectionsItem: CapturedResponse {
    /// 学部名称；允许为空或缺失。
    public let campusName: JSONValue?
    /// 业务实体或选项名称。
    public let name: String
    /// 年段所属学部标识。
    public let sectionCampusId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.campusName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("campusName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionCampusId = try container.decode(Int.self, forKey: JSONKey("sectionCampusId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["campusName", "name", "sectionCampusId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("campusName") { try container.encode(self.campusName, forKey: JSONKey("campusName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionCampusId") { try container.encode(self.sectionCampusId, forKey: JSONKey("sectionCampusId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseIdTeacherItem: CapturedResponse {
    /// 前端使用的显示名称。
    public let displayName: String
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
        self.displayName = try container.decode(String.self, forKey: JSONKey("displayName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["displayName", "name", "teacherId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("displayName") { try container.encode(self.displayName, forKey: JSONKey("displayName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemCourseId: CapturedResponse {
    /// 是否已安排；允许为空或缺失。
    public let arranged: JSONValue?
    /// 教室名称或完整教室对象，来自教室配置。
    public let classRoom: TeacherCurriculumRoomGETResponseItemItemCourseIdClassRoom
    /// 课程筛选或课程功能标记，按所属接口解释；允许为空或缺失。
    public let courseFlag: JSONValue?
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 课程教学安排标识，来自课程安排；允许为空或缺失。
    public let courseScheduleId: JSONValue?
    /// 业务说明或富文本内容。
    public let description: String
    /// 评分等级标识，来自等级配置；允许为空或缺失。
    public let gradeLevelId: JSONValue?
    /// 是否开放此学年。
    public let openSchoolYear: TeacherCurriculumRoomGETResponseItemItemCourseIdOpenSchoolYear
    /// 完整学期集合。
    public let semesters: [TeacherCurriculumRoomGETResponseItemItemCourseIdSemestersItem]
    /// 关联学生列表。
    public let students: [TeacherCurriculumRoomGETResponseItemItemCourseIdStudentsItem]
    /// 学科对象或名称；允许为空或缺失。
    public let subject: TeacherCurriculumRoomGETResponseItemItemCourseIdSubject?
    /// 课程对应年段集合。
    public let targetSections: [TeacherCurriculumRoomGETResponseItemItemCourseIdTargetSectionsItem]
    /// 课程助教集合；允许为空或缺失。
    public let tas: JSONValue?
    /// 完整教师对象或教师显示信息。
    public let teacher: [TeacherCurriculumRoomGETResponseItemItemCourseIdTeacherItem]
    /// 本业务域类型；不能跨业务域套用代码表；允许为空或缺失。
    public let type: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.arranged = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("arranged"))
        self.classRoom = try container.decode(TeacherCurriculumRoomGETResponseItemItemCourseIdClassRoom.self, forKey: JSONKey("classRoom"))
        self.courseFlag = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("courseFlag"))
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.courseScheduleId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("courseScheduleId"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.gradeLevelId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("gradeLevelId"))
        self.openSchoolYear = try container.decode(TeacherCurriculumRoomGETResponseItemItemCourseIdOpenSchoolYear.self, forKey: JSONKey("openSchoolYear"))
        self.semesters = try container.decode([TeacherCurriculumRoomGETResponseItemItemCourseIdSemestersItem].self, forKey: JSONKey("semesters"))
        self.students = try container.decode([TeacherCurriculumRoomGETResponseItemItemCourseIdStudentsItem].self, forKey: JSONKey("students"))
        self.subject = try container.decodeIfPresent(TeacherCurriculumRoomGETResponseItemItemCourseIdSubject.self, forKey: JSONKey("subject"))
        self.targetSections = try container.decode([TeacherCurriculumRoomGETResponseItemItemCourseIdTargetSectionsItem].self, forKey: JSONKey("targetSections"))
        self.tas = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("tas"))
        self.teacher = try container.decode([TeacherCurriculumRoomGETResponseItemItemCourseIdTeacherItem].self, forKey: JSONKey("teacher"))
        self.type = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("type"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["arranged", "classRoom", "courseFlag", "courseId", "courseScheduleId", "description", "gradeLevelId", "openSchoolYear", "semesters", "students", "subject", "targetSections", "tas", "teacher", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("arranged") { try container.encode(self.arranged, forKey: JSONKey("arranged")) }
        if presentFields.contains("classRoom") { try container.encode(self.classRoom, forKey: JSONKey("classRoom")) }
        if presentFields.contains("courseFlag") { try container.encode(self.courseFlag, forKey: JSONKey("courseFlag")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("courseScheduleId") { try container.encode(self.courseScheduleId, forKey: JSONKey("courseScheduleId")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("gradeLevelId") { try container.encode(self.gradeLevelId, forKey: JSONKey("gradeLevelId")) }
        if presentFields.contains("openSchoolYear") { try container.encode(self.openSchoolYear, forKey: JSONKey("openSchoolYear")) }
        if presentFields.contains("semesters") { try container.encode(self.semesters, forKey: JSONKey("semesters")) }
        if presentFields.contains("students") { try container.encode(self.students, forKey: JSONKey("students")) }
        if presentFields.contains("subject") { try container.encode(self.subject, forKey: JSONKey("subject")) }
        if presentFields.contains("targetSections") { try container.encode(self.targetSections, forKey: JSONKey("targetSections")) }
        if presentFields.contains("tas") { try container.encode(self.tas, forKey: JSONKey("tas")) }
        if presentFields.contains("teacher") { try container.encode(self.teacher, forKey: JSONKey("teacher")) }
        if presentFields.contains("type") { try container.encode(self.type, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemStudentsItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构。
    public let campusType: SemanticValue
    /// 学生卡号，敏感资料。
    public let cardNum: String
    /// 主班级名称。
    public let className: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: Int
    /// 性别语义值。
    public let gender: SemanticValue
    /// 业务实体或选项名称。
    public let name: String
    /// 年级或年段标识，来自年段选项。
    public let sectionId: Int
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
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
        self.campusType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("campusType")), domain: "campusType", decoder: decoder)
        self.cardNum = try container.decode(String.self, forKey: JSONKey("cardNum"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.enterDate = try container.decode(Int.self, forKey: JSONKey("enterDate"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionId = try container.decode(Int.self, forKey: JSONKey("sectionId"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "unconfirmed:/api/curriculum/room:status", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "campusType", "cardNum", "className", "enterDate", "gender", "name", "sectionId", "status", "studentId", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("campusType") { try container.encode(self.campusType.rawValue, forKey: JSONKey("campusType")) }
        if presentFields.contains("cardNum") { try container.encode(self.cardNum, forKey: JSONKey("cardNum")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionId") { try container.encode(self.sectionId, forKey: JSONKey("sectionId")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemTargetSectionsItem: CapturedResponse {
    /// 学部名称；允许为空或缺失。
    public let campusName: JSONValue?
    /// 业务实体或选项名称。
    public let name: String
    /// 年段所属学部标识。
    public let sectionCampusId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.campusName = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("campusName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.sectionCampusId = try container.decode(Int.self, forKey: JSONKey("sectionCampusId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["campusName", "name", "sectionCampusId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("campusName") { try container.encode(self.campusName, forKey: JSONKey("campusName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("sectionCampusId") { try container.encode(self.sectionCampusId, forKey: JSONKey("sectionCampusId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCurriculumRoomGETResponseItemItemTeachersItem: CapturedResponse {
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

public struct TeacherCurriculumRoomGETResponseItemItem: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表。
    public let classArrangeId: Int
    /// 教学资源标识，来自混合资源列表；允许为空或缺失。
    public let classMaterialId: JSONValue?
    /// 课节定义标识，来自课节列表。
    public let classPeriodId: Int
    /// 教室标识或教室对象，来自教室选项或课表。
    public let classRoomId: TeacherCurriculumRoomGETResponseItemItemClassRoomId
    /// 是否纳入成绩计算；允许为空或缺失。
    public let countIn: JSONValue?
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: TeacherCurriculumRoomGETResponseItemItemCourseId
    /// 课表安排标识，来自课表记录。
    public let curriculumId: Int
    /// 星期序号。
    public let dayOfWeek: Int
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
    /// 关联学生列表。
    public let students: [TeacherCurriculumRoomGETResponseItemItemStudentsItem]
    /// 课程对应年段集合。
    public let targetSections: [TeacherCurriculumRoomGETResponseItemItemTargetSectionsItem]
    /// 关联教师列表。
    public let teachers: [TeacherCurriculumRoomGETResponseItemItemTeachersItem]
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
        self.classMaterialId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classMaterialId"))
        self.classPeriodId = try container.decode(Int.self, forKey: JSONKey("classPeriodId"))
        self.classRoomId = try container.decode(TeacherCurriculumRoomGETResponseItemItemClassRoomId.self, forKey: JSONKey("classRoomId"))
        self.countIn = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("countIn"))
        self.courseId = try container.decode(TeacherCurriculumRoomGETResponseItemItemCourseId.self, forKey: JSONKey("courseId"))
        self.curriculumId = try container.decode(Int.self, forKey: JSONKey("curriculumId"))
        self.dayOfWeek = try container.decode(Int.self, forKey: JSONKey("dayOfWeek"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.originDayOfWeek = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("originDayOfWeek"))
        self.periods = try container.decode(Int.self, forKey: JSONKey("periods"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.students = try container.decode([TeacherCurriculumRoomGETResponseItemItemStudentsItem].self, forKey: JSONKey("students"))
        self.targetSections = try container.decode([TeacherCurriculumRoomGETResponseItemItemTargetSectionsItem].self, forKey: JSONKey("targetSections"))
        self.teachers = try container.decode([TeacherCurriculumRoomGETResponseItemItemTeachersItem].self, forKey: JSONKey("teachers"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "curriculumType", decoder: decoder)
        self.week = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("week"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classMaterialId", "classPeriodId", "classRoomId", "countIn", "courseId", "curriculumId", "dayOfWeek", "endTime", "originDayOfWeek", "periods", "resources", "startTime", "students", "targetSections", "teachers", "type", "week"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classMaterialId") { try container.encode(self.classMaterialId, forKey: JSONKey("classMaterialId")) }
        if presentFields.contains("classPeriodId") { try container.encode(self.classPeriodId, forKey: JSONKey("classPeriodId")) }
        if presentFields.contains("classRoomId") { try container.encode(self.classRoomId, forKey: JSONKey("classRoomId")) }
        if presentFields.contains("countIn") { try container.encode(self.countIn, forKey: JSONKey("countIn")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("curriculumId") { try container.encode(self.curriculumId, forKey: JSONKey("curriculumId")) }
        if presentFields.contains("dayOfWeek") { try container.encode(self.dayOfWeek, forKey: JSONKey("dayOfWeek")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("originDayOfWeek") { try container.encode(self.originDayOfWeek, forKey: JSONKey("originDayOfWeek")) }
        if presentFields.contains("periods") { try container.encode(self.periods, forKey: JSONKey("periods")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("students") { try container.encode(self.students, forKey: JSONKey("students")) }
        if presentFields.contains("targetSections") { try container.encode(self.targetSections, forKey: JSONKey("targetSections")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("week") { try container.encode(self.week, forKey: JSONKey("week")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherCurriculumRoomGETResponse = [String: [TeacherCurriculumRoomGETResponseItemItem]]
