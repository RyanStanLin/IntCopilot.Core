import Foundation

public struct TeacherAttendanceClassGETResponseAttendancesItemsItem: CapturedResponse {
    /// 上午考勤。
    public let am: String
    /// 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构。
    public let attendanceType: SemanticValue
    /// 头像资源地址。
    public let avatarUrl: String
    /// 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构。
    public let campusType: SemanticValue
    /// 具体课节安排标识，来自考勤或课表。
    public let classArrangeId: Int
    /// 主班级名称。
    public let className: String
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 当前记录是否可编辑。
    public let editable: Bool
    /// 性别语义值。
    public let gender: SemanticValue
    /// 上次考勤备注。
    public let lastComment: String
    /// 上次考勤状态。
    public let lastStatus: SemanticValue
    /// 关联请假信息；允许为空或缺失。
    public let leaveInfo: JSONValue?
    /// 当前记录是否已锁定。
    public let locked: Bool
    /// 下午考勤。
    public let pm: String
    /// 年段英文名称。
    public let sectionEnName: String
    /// 年段名称。
    public let sectionName: String
    /// 当前列表显示序号。
    public let seqNum: Int
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
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
        self.classArrangeId = try container.decode(Int.self, forKey: JSONKey("classArrangeId"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.editable = try container.decode(Bool.self, forKey: JSONKey("editable"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.lastComment = try container.decode(String.self, forKey: JSONKey("lastComment"))
        self.lastStatus = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("lastStatus")), domain: "attendanceStatus", decoder: decoder)
        self.leaveInfo = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("leaveInfo"))
        self.locked = try container.decode(Bool.self, forKey: JSONKey("locked"))
        self.pm = try container.decode(String.self, forKey: JSONKey("pm"))
        self.sectionEnName = try container.decode(String.self, forKey: JSONKey("sectionEnName"))
        self.sectionName = try container.decode(String.self, forKey: JSONKey("sectionName"))
        self.seqNum = try container.decode(Int.self, forKey: JSONKey("seqNum"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "attendanceStatus", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNo = try container.decode(String.self, forKey: JSONKey("studentNo"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["am", "attendanceType", "avatarUrl", "campusType", "classArrangeId", "className", "comment", "editable", "gender", "lastComment", "lastStatus", "leaveInfo", "locked", "pm", "sectionEnName", "sectionName", "seqNum", "status", "studentId", "studentName", "studentNo"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("am") { try container.encode(self.am, forKey: JSONKey("am")) }
        if presentFields.contains("attendanceType") { try container.encode(self.attendanceType.rawValue, forKey: JSONKey("attendanceType")) }
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("campusType") { try container.encode(self.campusType.rawValue, forKey: JSONKey("campusType")) }
        if presentFields.contains("classArrangeId") { try container.encode(self.classArrangeId, forKey: JSONKey("classArrangeId")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("editable") { try container.encode(self.editable, forKey: JSONKey("editable")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("lastComment") { try container.encode(self.lastComment, forKey: JSONKey("lastComment")) }
        if presentFields.contains("lastStatus") { try container.encode(self.lastStatus.rawValue, forKey: JSONKey("lastStatus")) }
        if presentFields.contains("leaveInfo") { try container.encode(self.leaveInfo, forKey: JSONKey("leaveInfo")) }
        if presentFields.contains("locked") { try container.encode(self.locked, forKey: JSONKey("locked")) }
        if presentFields.contains("pm") { try container.encode(self.pm, forKey: JSONKey("pm")) }
        if presentFields.contains("sectionEnName") { try container.encode(self.sectionEnName, forKey: JSONKey("sectionEnName")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNo") { try container.encode(self.studentNo, forKey: JSONKey("studentNo")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceClassGETResponseAttendances: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherAttendanceClassGETResponseAttendancesItemsItem]
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
        self.items = try container.decode([TeacherAttendanceClassGETResponseAttendancesItemsItem].self, forKey: JSONKey("items"))
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

public struct TeacherAttendanceClassGETResponse: CapturedResponse {
    /// 考勤记录或统计映射。
    public let attendances: TeacherAttendanceClassGETResponseAttendances
    /// 当前课节显示名称。
    public let currentPeriod: String
    /// 上一课节显示名称。
    public let lastPeriod: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attendances = try container.decode(TeacherAttendanceClassGETResponseAttendances.self, forKey: JSONKey("attendances"))
        self.currentPeriod = try container.decode(String.self, forKey: JSONKey("currentPeriod"))
        self.lastPeriod = try container.decode(String.self, forKey: JSONKey("lastPeriod"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attendances", "currentPeriod", "lastPeriod"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attendances") { try container.encode(self.attendances, forKey: JSONKey("attendances")) }
        if presentFields.contains("currentPeriod") { try container.encode(self.currentPeriod, forKey: JSONKey("currentPeriod")) }
        if presentFields.contains("lastPeriod") { try container.encode(self.lastPeriod, forKey: JSONKey("lastPeriod")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
