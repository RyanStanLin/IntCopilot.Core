import Foundation

public struct TeacherAttendanceDailyGETResponseAttendancesItemsItemLeaveInfoItem: CapturedResponse {
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 请假原因说明或课程离班说明。
    public let reason: String
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.reason = try container.decode(String.self, forKey: JSONKey("reason"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["endTime", "reason", "startTime"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("reason") { try container.encode(self.reason, forKey: JSONKey("reason")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceDailyGETResponseAttendancesItemsItem: CapturedResponse {
    /// 上午考勤。
    public let am: String
    /// 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构。
    public let attendanceType: SemanticValue
    /// 头像资源地址。
    public let avatarUrl: String
    /// 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构。
    public let campusType: SemanticValue
    /// 主班级名称。
    public let className: String
    /// 上午考勤备注。
    public let commentAM: String
    /// 晚间考勤备注。
    public let commentEVE: String
    /// 下午考勤备注。
    public let commentPM: String
    /// 上午是否可编辑。
    public let editFlagAM: Bool
    /// 晚间是否可编辑。
    public let editFlagEVE: Bool
    /// 下午是否可编辑。
    public let editFlagPM: Bool
    /// 晚间考勤。
    public let eve: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 关联请假信息。
    public let leaveInfo: [TeacherAttendanceDailyGETResponseAttendancesItemsItemLeaveInfoItem]
    /// 上午是否已锁定。
    public let lockedAM: Bool
    /// 晚间是否已锁定。
    public let lockedEVE: Bool
    /// 下午是否已锁定。
    public let lockedPM: Bool
    /// 下午考勤。
    public let pm: String
    /// 当前列表显示序号；允许为空或缺失。
    public let seqNum: JSONValue?
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 学生学号。
    public let studentNo: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.am = try container.decode(String.self, forKey: JSONKey("am"))
        self.attendanceType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("attendanceType")), domain: "attendanceType", decoder: decoder)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.campusType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("campusType")), domain: "campusType", decoder: decoder)
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.commentAM = try container.decode(String.self, forKey: JSONKey("commentAM"))
        self.commentEVE = try container.decode(String.self, forKey: JSONKey("commentEVE"))
        self.commentPM = try container.decode(String.self, forKey: JSONKey("commentPM"))
        self.editFlagAM = try container.decode(Bool.self, forKey: JSONKey("editFlagAM"))
        self.editFlagEVE = try container.decode(Bool.self, forKey: JSONKey("editFlagEVE"))
        self.editFlagPM = try container.decode(Bool.self, forKey: JSONKey("editFlagPM"))
        self.eve = try container.decode(String.self, forKey: JSONKey("eve"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.leaveInfo = try container.decode([TeacherAttendanceDailyGETResponseAttendancesItemsItemLeaveInfoItem].self, forKey: JSONKey("leaveInfo"))
        self.lockedAM = try container.decode(Bool.self, forKey: JSONKey("lockedAM"))
        self.lockedEVE = try container.decode(Bool.self, forKey: JSONKey("lockedEVE"))
        self.lockedPM = try container.decode(Bool.self, forKey: JSONKey("lockedPM"))
        self.pm = try container.decode(String.self, forKey: JSONKey("pm"))
        self.seqNum = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("seqNum"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNo = try container.decode(String.self, forKey: JSONKey("studentNo"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["am", "attendanceType", "avatarUrl", "campusType", "className", "commentAM", "commentEVE", "commentPM", "editFlagAM", "editFlagEVE", "editFlagPM", "eve", "gender", "leaveInfo", "lockedAM", "lockedEVE", "lockedPM", "pm", "seqNum", "studentId", "studentName", "studentNo"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("am") { try container.encode(self.am, forKey: JSONKey("am")) }
        if presentFields.contains("attendanceType") { try container.encode(self.attendanceType.rawValue, forKey: JSONKey("attendanceType")) }
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("campusType") { try container.encode(self.campusType.rawValue, forKey: JSONKey("campusType")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("commentAM") { try container.encode(self.commentAM, forKey: JSONKey("commentAM")) }
        if presentFields.contains("commentEVE") { try container.encode(self.commentEVE, forKey: JSONKey("commentEVE")) }
        if presentFields.contains("commentPM") { try container.encode(self.commentPM, forKey: JSONKey("commentPM")) }
        if presentFields.contains("editFlagAM") { try container.encode(self.editFlagAM, forKey: JSONKey("editFlagAM")) }
        if presentFields.contains("editFlagEVE") { try container.encode(self.editFlagEVE, forKey: JSONKey("editFlagEVE")) }
        if presentFields.contains("editFlagPM") { try container.encode(self.editFlagPM, forKey: JSONKey("editFlagPM")) }
        if presentFields.contains("eve") { try container.encode(self.eve, forKey: JSONKey("eve")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("leaveInfo") { try container.encode(self.leaveInfo, forKey: JSONKey("leaveInfo")) }
        if presentFields.contains("lockedAM") { try container.encode(self.lockedAM, forKey: JSONKey("lockedAM")) }
        if presentFields.contains("lockedEVE") { try container.encode(self.lockedEVE, forKey: JSONKey("lockedEVE")) }
        if presentFields.contains("lockedPM") { try container.encode(self.lockedPM, forKey: JSONKey("lockedPM")) }
        if presentFields.contains("pm") { try container.encode(self.pm, forKey: JSONKey("pm")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNo") { try container.encode(self.studentNo, forKey: JSONKey("studentNo")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceDailyGETResponseAttendances: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherAttendanceDailyGETResponseAttendancesItemsItem]
    /// 页码，从 1 开始。
    public let pageCurrent: Int
    /// 分页大小，以记录条数为单位。
    public let pageSize: Int
    /// 满足条件的总记录数。
    public let totalItem: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.items = try container.decode([TeacherAttendanceDailyGETResponseAttendancesItemsItem].self, forKey: JSONKey("items"))
        self.pageCurrent = try container.decode(Int.self, forKey: JSONKey("pageCurrent"))
        self.pageSize = try container.decode(Int.self, forKey: JSONKey("pageSize"))
        self.totalItem = try container.decode(Int.self, forKey: JSONKey("totalItem"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["items", "pageCurrent", "pageSize", "totalItem"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("items") { try container.encode(self.items, forKey: JSONKey("items")) }
        if presentFields.contains("pageCurrent") { try container.encode(self.pageCurrent, forKey: JSONKey("pageCurrent")) }
        if presentFields.contains("pageSize") { try container.encode(self.pageSize, forKey: JSONKey("pageSize")) }
        if presentFields.contains("totalItem") { try container.encode(self.totalItem, forKey: JSONKey("totalItem")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceDailyGETResponse: CapturedResponse {
    /// 允许的考勤时段或模式。
    public let attendanceTypes: [String]
    /// 考勤记录或统计映射。
    public let attendances: TeacherAttendanceDailyGETResponseAttendances
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendanceTypes = try container.decode([String].self, forKey: JSONKey("attendanceTypes"))
        self.attendances = try container.decode(TeacherAttendanceDailyGETResponseAttendances.self, forKey: JSONKey("attendances"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceTypes", "attendances"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceTypes") { try container.encode(self.attendanceTypes, forKey: JSONKey("attendanceTypes")) }
        if presentFields.contains("attendances") { try container.encode(self.attendances, forKey: JSONKey("attendances")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
