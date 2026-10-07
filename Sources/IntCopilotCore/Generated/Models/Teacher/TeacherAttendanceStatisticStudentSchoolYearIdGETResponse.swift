import Foundation

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表。
    public let classArrangeId: Int
    /// 教室名称或完整教室对象，来自教室配置。
    public let classRoom: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程名称。
    public let courseName: String
    /// 当前记录是否可编辑，保留服务端拼写。
    public let editAble: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decode(Int.self, forKey: JSONKey("classArrangeId"))
        self.classRoom = try container.decode(String.self, forKey: JSONKey("classRoom"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.editAble = try container.decode(Bool.self, forKey: JSONKey("editAble"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoom", "comment", "courseName", "editAble", "status"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoom") { try container.encode(self.classRoom, forKey: JSONKey("classRoom")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("editAble") { try container.encode(self.editAble, forKey: JSONKey("editAble")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem: CapturedResponse {
    /// 课节定义标识，来自课节列表。
    public let classPeriodId: Int
    /// 业务说明或富文本内容。
    public let description: String
    /// 区间结束值；日期查询使用 Unix 毫秒。
    public let end: Int
    /// 是否延展课程。
    public let isCCA: Bool
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
        self.isCCA = try container.decode(Bool.self, forKey: JSONKey("isCCA"))
        self.isFullPeriodArranged = try container.decode(Bool.self, forKey: JSONKey("isFullPeriodArranged"))
        self.sevenFive = try container.decode(Bool.self, forKey: JSONKey("sevenFive"))
        self.start = try container.decode(Int.self, forKey: JSONKey("start"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classPeriodId", "description", "end", "isCCA", "isFullPeriodArranged", "sevenFive", "start"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classPeriodId") { try container.encode(self.classPeriodId, forKey: JSONKey("classPeriodId")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("end") { try container.encode(self.end, forKey: JSONKey("end")) }
        if presentFields.contains("isCCA") { try container.encode(self.isCCA, forKey: JSONKey("isCCA")) }
        if presentFields.contains("isFullPeriodArranged") { try container.encode(self.isFullPeriodArranged, forKey: JSONKey("isFullPeriodArranged")) }
        if presentFields.contains("sevenFive") { try container.encode(self.sevenFive, forKey: JSONKey("sevenFive")) }
        if presentFields.contains("start") { try container.encode(self.start, forKey: JSONKey("start")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表；允许为空或缺失。
    public let classArrangeId: JSONValue?
    /// 教室名称或完整教室对象，来自教室配置。
    public let classRoom: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程名称。
    public let courseName: String
    /// 当前记录是否可编辑，保留服务端拼写。
    public let editAble: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classArrangeId"))
        self.classRoom = try container.decode(String.self, forKey: JSONKey("classRoom"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.editAble = try container.decode(Bool.self, forKey: JSONKey("editAble"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoom", "comment", "courseName", "editAble", "status"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoom") { try container.encode(self.classRoom, forKey: JSONKey("classRoom")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("editAble") { try container.encode(self.editAble, forKey: JSONKey("editAble")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表；允许为空或缺失。
    public let classArrangeId: JSONValue?
    /// 教室名称或完整教室对象，来自教室配置。
    public let classRoom: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程名称。
    public let courseName: String
    /// 当前记录是否可编辑，保留服务端拼写。
    public let editAble: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classArrangeId"))
        self.classRoom = try container.decode(String.self, forKey: JSONKey("classRoom"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.editAble = try container.decode(Bool.self, forKey: JSONKey("editAble"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoom", "comment", "courseName", "editAble", "status"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoom") { try container.encode(self.classRoom, forKey: JSONKey("classRoom")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("editAble") { try container.encode(self.editAble, forKey: JSONKey("editAble")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表；允许为空或缺失。
    public let classArrangeId: JSONValue?
    /// 教室名称或完整教室对象，来自教室配置。
    public let classRoom: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程名称。
    public let courseName: String
    /// 当前记录是否可编辑，保留服务端拼写。
    public let editAble: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classArrangeId"))
        self.classRoom = try container.decode(String.self, forKey: JSONKey("classRoom"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.editAble = try container.decode(Bool.self, forKey: JSONKey("editAble"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoom", "comment", "courseName", "editAble", "status"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoom") { try container.encode(self.classRoom, forKey: JSONKey("classRoom")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("editAble") { try container.encode(self.editAble, forKey: JSONKey("editAble")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances: CapturedResponse {
    /// 上午考勤。
    public let am: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm
    /// 晚间考勤。
    public let eve: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve
    /// 下午考勤。
    public let pm: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.am = try container.decode(TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm.self, forKey: JSONKey("am"))
        self.eve = try container.decode(TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve.self, forKey: JSONKey("eve"))
        self.pm = try container.decode(TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm.self, forKey: JSONKey("pm"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["am", "eve", "pm"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("am") { try container.encode(self.am, forKey: JSONKey("am")) }
        if presentFields.contains("eve") { try container.encode(self.eve, forKey: JSONKey("eve")) }
        if presentFields.contains("pm") { try container.encode(self.pm, forKey: JSONKey("pm")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve: CapturedResponse {
    /// 具体课节安排标识，来自考勤或课表；允许为空或缺失。
    public let classArrangeId: JSONValue?
    /// 教室名称或完整教室对象，来自教室配置。
    public let classRoom: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程名称。
    public let courseName: String
    /// 当前记录是否可编辑，保留服务端拼写。
    public let editAble: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classArrangeId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classArrangeId"))
        self.classRoom = try container.decode(String.self, forKey: JSONKey("classRoom"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.editAble = try container.decode(Bool.self, forKey: JSONKey("editAble"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classArrangeId", "classRoom", "comment", "courseName", "editAble", "status"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("classRoom") { try container.encode(self.classRoom, forKey: JSONKey("classRoom")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("editAble") { try container.encode(self.editAble, forKey: JSONKey("editAble")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances: CapturedResponse {
    /// 晚间考勤。
    public let eve: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.eve = try container.decode(TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve.self, forKey: JSONKey("eve"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["eve"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("eve") { try container.encode(self.eve, forKey: JSONKey("eve")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem: CapturedResponse {
    /// 上午考勤。
    public let am: String
    /// 上午考勤备注。
    public let amcomment: String
    /// 考勤记录或统计映射。
    public let attendances: [String: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem]
    /// 课节定义列表。
    public let classPeriods: [TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem]
    /// 业务日期，日期型端点使用 Unix 毫秒。
    public let date: Int
    /// 是否启用宿舍考勤。
    public let dormitoryAttendanceFlag: Bool
    /// 完整宿舍考勤数据。
    public let dormitoryAttendances: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances
    /// 上午是否可编辑。
    public let editAbleAM: Bool
    /// 晚间是否可编辑。
    public let editAbleEVE: Bool
    /// 下午是否可编辑。
    public let editAblePM: Bool
    /// 晚间考勤。
    public let eve: String
    /// 晚间考勤备注。
    public let evecomment: String
    /// 关联请假信息。
    public let leaveInfo: [JSONValue]
    /// 下午考勤。
    public let pm: String
    /// 下午考勤备注。
    public let pmcomment: String
    /// 是否启用自习室考勤。
    public let studyRoomAttendanceFlag: Bool
    /// 完整自习室考勤数据。
    public let studyRoomAttendances: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.am = try container.decode(String.self, forKey: JSONKey("am"))
        self.amcomment = try container.decode(String.self, forKey: JSONKey("amcomment"))
        self.attendances = try container.decode([String: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem].self, forKey: JSONKey("attendances"))
        self.classPeriods = try container.decode([TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem].self, forKey: JSONKey("classPeriods"))
        self.date = try container.decode(Int.self, forKey: JSONKey("date"))
        self.dormitoryAttendanceFlag = try container.decode(Bool.self, forKey: JSONKey("dormitoryAttendanceFlag"))
        self.dormitoryAttendances = try container.decode(TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances.self, forKey: JSONKey("dormitoryAttendances"))
        self.editAbleAM = try container.decode(Bool.self, forKey: JSONKey("editAbleAM"))
        self.editAbleEVE = try container.decode(Bool.self, forKey: JSONKey("editAbleEVE"))
        self.editAblePM = try container.decode(Bool.self, forKey: JSONKey("editAblePM"))
        self.eve = try container.decode(String.self, forKey: JSONKey("eve"))
        self.evecomment = try container.decode(String.self, forKey: JSONKey("evecomment"))
        self.leaveInfo = try container.decode([JSONValue].self, forKey: JSONKey("leaveInfo"))
        self.pm = try container.decode(String.self, forKey: JSONKey("pm"))
        self.pmcomment = try container.decode(String.self, forKey: JSONKey("pmcomment"))
        self.studyRoomAttendanceFlag = try container.decode(Bool.self, forKey: JSONKey("studyRoomAttendanceFlag"))
        self.studyRoomAttendances = try container.decode(TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances.self, forKey: JSONKey("studyRoomAttendances"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["am", "amcomment", "attendances", "classPeriods", "date", "dormitoryAttendanceFlag", "dormitoryAttendances", "editAbleAM", "editAbleEVE", "editAblePM", "eve", "evecomment", "leaveInfo", "pm", "pmcomment", "studyRoomAttendanceFlag", "studyRoomAttendances"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("am") { try container.encode(self.am, forKey: JSONKey("am")) }
        if presentFields.contains("amcomment") { try container.encode(self.amcomment, forKey: JSONKey("amcomment")) }
        if presentFields.contains("attendances") { try container.encode(self.attendances, forKey: JSONKey("attendances")) }
        if presentFields.contains("classPeriods") { try container.encode(self.classPeriods, forKey: JSONKey("classPeriods")) }
        if presentFields.contains("date") { try container.encode(self.date, forKey: JSONKey("date")) }
        if presentFields.contains("dormitoryAttendanceFlag") { try container.encode(self.dormitoryAttendanceFlag, forKey: JSONKey("dormitoryAttendanceFlag")) }
        if presentFields.contains("dormitoryAttendances") { try container.encode(self.dormitoryAttendances, forKey: JSONKey("dormitoryAttendances")) }
        if presentFields.contains("editAbleAM") { try container.encode(self.editAbleAM, forKey: JSONKey("editAbleAM")) }
        if presentFields.contains("editAbleEVE") { try container.encode(self.editAbleEVE, forKey: JSONKey("editAbleEVE")) }
        if presentFields.contains("editAblePM") { try container.encode(self.editAblePM, forKey: JSONKey("editAblePM")) }
        if presentFields.contains("eve") { try container.encode(self.eve, forKey: JSONKey("eve")) }
        if presentFields.contains("evecomment") { try container.encode(self.evecomment, forKey: JSONKey("evecomment")) }
        if presentFields.contains("leaveInfo") { try container.encode(self.leaveInfo, forKey: JSONKey("leaveInfo")) }
        if presentFields.contains("pm") { try container.encode(self.pm, forKey: JSONKey("pm")) }
        if presentFields.contains("pmcomment") { try container.encode(self.pmcomment, forKey: JSONKey("pmcomment")) }
        if presentFields.contains("studyRoomAttendanceFlag") { try container.encode(self.studyRoomAttendanceFlag, forKey: JSONKey("studyRoomAttendanceFlag")) }
        if presentFields.contains("studyRoomAttendances") { try container.encode(self.studyRoomAttendances, forKey: JSONKey("studyRoomAttendances")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentSchoolYearIdGETResponse: CapturedResponse {
    /// 允许的考勤时段或模式。
    public let attendanceTypes: [String]
    /// 日常考勤时段。
    public let dailySession: [String]
    /// 按日期组织的考勤记录。
    public let dailyStatistics: [TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem]
    /// 宿舍考勤时段。
    public let dormitorySession: [String]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendanceTypes = try container.decode([String].self, forKey: JSONKey("attendanceTypes"))
        self.dailySession = try container.decode([String].self, forKey: JSONKey("dailySession"))
        self.dailyStatistics = try container.decode([TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem].self, forKey: JSONKey("dailyStatistics"))
        self.dormitorySession = try container.decode([String].self, forKey: JSONKey("dormitorySession"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceTypes", "dailySession", "dailyStatistics", "dormitorySession"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceTypes") { try container.encode(self.attendanceTypes, forKey: JSONKey("attendanceTypes")) }
        if presentFields.contains("dailySession") { try container.encode(self.dailySession, forKey: JSONKey("dailySession")) }
        if presentFields.contains("dailyStatistics") { try container.encode(self.dailyStatistics, forKey: JSONKey("dailyStatistics")) }
        if presentFields.contains("dormitorySession") { try container.encode(self.dormitorySession, forKey: JSONKey("dormitorySession")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
