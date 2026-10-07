import Foundation

public struct TeacherAttendanceSsRoomDailyGETResponseItemsItemLeaveInfo: CapturedResponse {
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

public struct TeacherAttendanceSsRoomDailyGETResponseItemsItem: CapturedResponse {
    /// 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构。
    public let attendanceType: SemanticValue
    /// 头像资源地址。
    public let avatarUrl: String
    /// 主班级名称。
    public let className: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 当前记录是否可编辑。
    public let editable: Bool
    /// 性别语义值。
    public let gender: SemanticValue
    /// 学院名称。
    public let houseName: String
    /// 关联请假信息；允许为空或缺失。
    public let leaveInfo: TeacherAttendanceSsRoomDailyGETResponseItemsItemLeaveInfo?
    /// 当前记录是否已锁定。
    public let locked: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
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
        self.attendanceType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("attendanceType")), domain: "attendanceType", decoder: decoder)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.editable = try container.decode(Bool.self, forKey: JSONKey("editable"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.houseName = try container.decode(String.self, forKey: JSONKey("houseName"))
        self.leaveInfo = try container.decodeIfPresent(TeacherAttendanceSsRoomDailyGETResponseItemsItemLeaveInfo.self, forKey: JSONKey("leaveInfo"))
        self.locked = try container.decode(Bool.self, forKey: JSONKey("locked"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "attendanceStatus", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendanceType", "avatarUrl", "className", "comment", "editable", "gender", "houseName", "leaveInfo", "locked", "status", "studentId", "studentName", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendanceType") { try container.encode(self.attendanceType.rawValue, forKey: JSONKey("attendanceType")) }
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("editable") { try container.encode(self.editable, forKey: JSONKey("editable")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("houseName") { try container.encode(self.houseName, forKey: JSONKey("houseName")) }
        if presentFields.contains("leaveInfo") { try container.encode(self.leaveInfo, forKey: JSONKey("leaveInfo")) }
        if presentFields.contains("locked") { try container.encode(self.locked, forKey: JSONKey("locked")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceSsRoomDailyGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherAttendanceSsRoomDailyGETResponseItemsItem]
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
        self.items = try container.decode([TeacherAttendanceSsRoomDailyGETResponseItemsItem].self, forKey: JSONKey("items"))
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
