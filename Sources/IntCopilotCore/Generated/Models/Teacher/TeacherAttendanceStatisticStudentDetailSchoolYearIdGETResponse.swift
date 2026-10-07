import Foundation

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseAttendancesItem: CapturedResponse {
    /// 缺席记录或数量；允许为空或缺失。
    public let absent: Int?
    /// 病假记录或数量；允许为空或缺失。
    public let illness: Int?
    /// 出席记录或出席数量。
    public let intime: Int
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 可谅解缺席记录或数量；允许为空或缺失。
    public let personal: Int?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.absent = try container.decodeIfPresent(Int.self, forKey: JSONKey("absent"))
        self.illness = try container.decodeIfPresent(Int.self, forKey: JSONKey("illness"))
        self.intime = try container.decode(Int.self, forKey: JSONKey("intime"))
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        self.personal = try container.decodeIfPresent(Int.self, forKey: JSONKey("personal"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["absent", "illness", "intime", "noRecords", "personal"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("absent") { try container.encode(self.absent, forKey: JSONKey("absent")) }
        if presentFields.contains("illness") { try container.encode(self.illness, forKey: JSONKey("illness")) }
        if presentFields.contains("intime") { try container.encode(self.intime, forKey: JSONKey("intime")) }
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        if presentFields.contains("personal") { try container.encode(self.personal, forKey: JSONKey("personal")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseClassPeriodsItem: CapturedResponse {
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

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesAm: CapturedResponse {
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["noRecords"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesEve: CapturedResponse {
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["noRecords"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesPm: CapturedResponse {
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["noRecords"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendances: CapturedResponse {
    /// 上午考勤。
    public let am: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesAm
    /// 晚间考勤。
    public let eve: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesEve
    /// 下午考勤。
    public let pm: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesPm
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.am = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesAm.self, forKey: JSONKey("am"))
        self.eve = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesEve.self, forKey: JSONKey("eve"))
        self.pm = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesPm.self, forKey: JSONKey("pm"))
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

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesAm: CapturedResponse {
    /// 病假记录或数量。
    public let illness: Int
    /// 出席记录或出席数量。
    public let intime: Int
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 假期记录或数量。
    public let weekendHoliday: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.illness = try container.decode(Int.self, forKey: JSONKey("illness"))
        self.intime = try container.decode(Int.self, forKey: JSONKey("intime"))
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        self.weekendHoliday = try container.decode(Int.self, forKey: JSONKey("weekendHoliday"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["illness", "intime", "noRecords", "weekendHoliday"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("illness") { try container.encode(self.illness, forKey: JSONKey("illness")) }
        if presentFields.contains("intime") { try container.encode(self.intime, forKey: JSONKey("intime")) }
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        if presentFields.contains("weekendHoliday") { try container.encode(self.weekendHoliday, forKey: JSONKey("weekendHoliday")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesEve: CapturedResponse {
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 假期记录或数量。
    public let weekendHoliday: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        self.weekendHoliday = try container.decode(Int.self, forKey: JSONKey("weekendHoliday"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["noRecords", "weekendHoliday"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        if presentFields.contains("weekendHoliday") { try container.encode(self.weekendHoliday, forKey: JSONKey("weekendHoliday")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesPm: CapturedResponse {
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 假期记录或数量。
    public let weekendHoliday: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        self.weekendHoliday = try container.decode(Int.self, forKey: JSONKey("weekendHoliday"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["noRecords", "weekendHoliday"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        if presentFields.contains("weekendHoliday") { try container.encode(self.weekendHoliday, forKey: JSONKey("weekendHoliday")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendances: CapturedResponse {
    /// 上午考勤。
    public let am: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesAm
    /// 晚间考勤。
    public let eve: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesEve
    /// 下午考勤。
    public let pm: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesPm
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.am = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesAm.self, forKey: JSONKey("am"))
        self.eve = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesEve.self, forKey: JSONKey("eve"))
        self.pm = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesPm.self, forKey: JSONKey("pm"))
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

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendancesEve: CapturedResponse {
    /// 未考勤记录或未考勤数量，依所在统计节点区分。
    public let noRecords: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.noRecords = try container.decode(Int.self, forKey: JSONKey("noRecords"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["noRecords"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("noRecords") { try container.encode(self.noRecords, forKey: JSONKey("noRecords")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendances: CapturedResponse {
    /// 晚间考勤。
    public let eve: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendancesEve
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.eve = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendancesEve.self, forKey: JSONKey("eve"))
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

public struct TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponse: CapturedResponse {
    /// 允许的考勤时段或模式。
    public let attendanceTypes: [String]
    /// 考勤记录或统计映射。
    public let attendances: [String: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseAttendancesItem]
    /// 课节定义列表。
    public let classPeriods: [TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseClassPeriodsItem]
    /// 日常考勤时段。
    public let dailySession: [String]
    /// 是否启用宿舍考勤。
    public let dormitoryAttendanceFlag: Bool
    /// 完整宿舍考勤数据。
    public let dormitoryAttendances: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendances
    /// 宿舍考勤时段。
    public let dormitorySession: [String]
    /// 全日考勤记录或统计节点。
    public let full_day: Bool
    /// 按考勤时段组织的完整记录。
    public let sessionAttendances: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendances
    /// 是否启用自习室考勤。
    public let studyRoomAttendanceFlag: Bool
    /// 完整自习室考勤数据。
    public let studyRoomAttendances: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendances
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendanceTypes = try container.decode([String].self, forKey: JSONKey("attendanceTypes"))
        self.attendances = try container.decode([String: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseAttendancesItem].self, forKey: JSONKey("attendances"))
        self.classPeriods = try container.decode([TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseClassPeriodsItem].self, forKey: JSONKey("classPeriods"))
        self.dailySession = try container.decode([String].self, forKey: JSONKey("dailySession"))
        self.dormitoryAttendanceFlag = try container.decode(Bool.self, forKey: JSONKey("dormitoryAttendanceFlag"))
        self.dormitoryAttendances = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendances.self, forKey: JSONKey("dormitoryAttendances"))
        self.dormitorySession = try container.decode([String].self, forKey: JSONKey("dormitorySession"))
        self.full_day = try container.decode(Bool.self, forKey: JSONKey("full_day"))
        self.sessionAttendances = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendances.self, forKey: JSONKey("sessionAttendances"))
        self.studyRoomAttendanceFlag = try container.decode(Bool.self, forKey: JSONKey("studyRoomAttendanceFlag"))
        self.studyRoomAttendances = try container.decode(TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendances.self, forKey: JSONKey("studyRoomAttendances"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceTypes", "attendances", "classPeriods", "dailySession", "dormitoryAttendanceFlag", "dormitoryAttendances", "dormitorySession", "full_day", "sessionAttendances", "studyRoomAttendanceFlag", "studyRoomAttendances"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceTypes") { try container.encode(self.attendanceTypes, forKey: JSONKey("attendanceTypes")) }
        if presentFields.contains("attendances") { try container.encode(self.attendances, forKey: JSONKey("attendances")) }
        if presentFields.contains("classPeriods") { try container.encode(self.classPeriods, forKey: JSONKey("classPeriods")) }
        if presentFields.contains("dailySession") { try container.encode(self.dailySession, forKey: JSONKey("dailySession")) }
        if presentFields.contains("dormitoryAttendanceFlag") { try container.encode(self.dormitoryAttendanceFlag, forKey: JSONKey("dormitoryAttendanceFlag")) }
        if presentFields.contains("dormitoryAttendances") { try container.encode(self.dormitoryAttendances, forKey: JSONKey("dormitoryAttendances")) }
        if presentFields.contains("dormitorySession") { try container.encode(self.dormitorySession, forKey: JSONKey("dormitorySession")) }
        if presentFields.contains("full_day") { try container.encode(self.full_day, forKey: JSONKey("full_day")) }
        if presentFields.contains("sessionAttendances") { try container.encode(self.sessionAttendances, forKey: JSONKey("sessionAttendances")) }
        if presentFields.contains("studyRoomAttendanceFlag") { try container.encode(self.studyRoomAttendanceFlag, forKey: JSONKey("studyRoomAttendanceFlag")) }
        if presentFields.contains("studyRoomAttendances") { try container.encode(self.studyRoomAttendances, forKey: JSONKey("studyRoomAttendances")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
