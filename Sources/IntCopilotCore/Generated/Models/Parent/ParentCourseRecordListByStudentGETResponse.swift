import Foundation

public struct ParentCourseRecordListByStudentGETResponseItem: CapturedResponse {
    /// 备注、评语或考勤说明。
    public let comment: String
    /// 课程学分；允许为空或缺失。
    public let courseCredit: Double?
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 离开课程原因标识，来自课程原因选项。
    public let courseLeaveReasonId: Int
    /// 课程名称。
    public let courseName: String
    /// 学生课程记录标识。
    public let courseRecordId: Int
    /// 课程教学安排标识，来自课程安排。
    public let courseScheduleId: Int
    /// 课程教学班名称。
    public let courseScheduleName: String
    /// 是否允许授予学分。
    public let creditAvailable: Int
    /// 是否允许编辑学分。
    public let creditEditFlag: Bool
    /// 是否已设置学分；允许为空或缺失。
    public let creditSet: Double?
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 课程离班原因英文名称。
    public let leaveEnReason: String
    /// 课程离班原因中文名称。
    public let leaveReason: String
    /// 是否允许查看该报告。
    public let reportView: Bool
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 学科名称。
    public let subjectName: String
    /// 关联教师名称文本。
    public let teacherNames: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.comment = try container.decode(String.self, forKey: JSONKey("comment"))
        self.courseCredit = try container.decodeIfPresent(Double.self, forKey: JSONKey("courseCredit"))
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.courseLeaveReasonId = try container.decode(Int.self, forKey: JSONKey("courseLeaveReasonId"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.courseRecordId = try container.decode(Int.self, forKey: JSONKey("courseRecordId"))
        self.courseScheduleId = try container.decode(Int.self, forKey: JSONKey("courseScheduleId"))
        self.courseScheduleName = try container.decode(String.self, forKey: JSONKey("courseScheduleName"))
        self.creditAvailable = try container.decode(Int.self, forKey: JSONKey("creditAvailable"))
        self.creditEditFlag = try container.decode(Bool.self, forKey: JSONKey("creditEditFlag"))
        self.creditSet = try container.decodeIfPresent(Double.self, forKey: JSONKey("creditSet"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.leaveEnReason = try container.decode(String.self, forKey: JSONKey("leaveEnReason"))
        self.leaveReason = try container.decode(String.self, forKey: JSONKey("leaveReason"))
        self.reportView = try container.decode(Bool.self, forKey: JSONKey("reportView"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.subjectName = try container.decode(String.self, forKey: JSONKey("subjectName"))
        self.teacherNames = try container.decode(String.self, forKey: JSONKey("teacherNames"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["comment", "courseCredit", "courseId", "courseLeaveReasonId", "courseName", "courseRecordId", "courseScheduleId", "courseScheduleName", "creditAvailable", "creditEditFlag", "creditSet", "endTime", "leaveEnReason", "leaveReason", "reportView", "startTime", "studentId", "studentName", "subjectName", "teacherNames"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("comment") { try container.encode(self.comment, forKey: JSONKey("comment")) }
        if presentFields.contains("courseCredit") { try container.encode(self.courseCredit, forKey: JSONKey("courseCredit")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("courseLeaveReasonId") { try container.encode(self.courseLeaveReasonId, forKey: JSONKey("courseLeaveReasonId")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("courseRecordId") { try container.encode(self.courseRecordId, forKey: JSONKey("courseRecordId")) }
        if presentFields.contains("courseScheduleId") { try container.encode(self.courseScheduleId, forKey: JSONKey("courseScheduleId")) }
        if presentFields.contains("courseScheduleName") { try container.encode(self.courseScheduleName, forKey: JSONKey("courseScheduleName")) }
        if presentFields.contains("creditAvailable") { try container.encode(self.creditAvailable, forKey: JSONKey("creditAvailable")) }
        if presentFields.contains("creditEditFlag") { try container.encode(self.creditEditFlag, forKey: JSONKey("creditEditFlag")) }
        if presentFields.contains("creditSet") { try container.encode(self.creditSet, forKey: JSONKey("creditSet")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("leaveEnReason") { try container.encode(self.leaveEnReason, forKey: JSONKey("leaveEnReason")) }
        if presentFields.contains("leaveReason") { try container.encode(self.leaveReason, forKey: JSONKey("leaveReason")) }
        if presentFields.contains("reportView") { try container.encode(self.reportView, forKey: JSONKey("reportView")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("subjectName") { try container.encode(self.subjectName, forKey: JSONKey("subjectName")) }
        if presentFields.contains("teacherNames") { try container.encode(self.teacherNames, forKey: JSONKey("teacherNames")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias ParentCourseRecordListByStudentGETResponse = [ParentCourseRecordListByStudentGETResponseItem]
