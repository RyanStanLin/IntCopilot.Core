import Foundation

public struct TeacherMonthlyGradeReportGETResponseItemsItem: CapturedResponse {
    /// 主班级名称。
    public let className: String
    /// 已填写评语数量。
    public let commentedNum: Int
    /// 课程数量。
    public let courseNum: Int
    /// 已填写副负责人评语数量。
    public let deputyHeadCommentNum: Int
    /// 已录入考试百分比成绩数量。
    public let epGradedNum: Int
    /// 已评分学生数量。
    public let gradedNum: Int
    /// 已填写主班教师评语数量。
    public let headTeacherCommentedNum: Int
    /// 主班教师数量。
    public let headTeacherNum: Int
    /// 完整学院小组或小组显示文本。
    public let houseGroup: String
    /// 报告请求地址或路径。
    public let requestUrl: String
    /// 是否已发送。
    public let sent: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 本次认证或业务操作是否成功。
    public let success: Bool
    /// 报告模板标识。
    public let templateId: Int
    /// 已填写辅导师评语数量。
    public let tutorCommentedNum: Int
    /// 辅导师数量。
    public let tutorNum: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.commentedNum = try container.decode(Int.self, forKey: JSONKey("commentedNum"))
        self.courseNum = try container.decode(Int.self, forKey: JSONKey("courseNum"))
        self.deputyHeadCommentNum = try container.decode(Int.self, forKey: JSONKey("deputyHeadCommentNum"))
        self.epGradedNum = try container.decode(Int.self, forKey: JSONKey("epGradedNum"))
        self.gradedNum = try container.decode(Int.self, forKey: JSONKey("gradedNum"))
        self.headTeacherCommentedNum = try container.decode(Int.self, forKey: JSONKey("headTeacherCommentedNum"))
        self.headTeacherNum = try container.decode(Int.self, forKey: JSONKey("headTeacherNum"))
        self.houseGroup = try container.decode(String.self, forKey: JSONKey("houseGroup"))
        self.requestUrl = try container.decode(String.self, forKey: JSONKey("requestUrl"))
        self.sent = try container.decode(String.self, forKey: JSONKey("sent"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        self.success = try container.decode(Bool.self, forKey: JSONKey("success"))
        self.templateId = try container.decode(Int.self, forKey: JSONKey("templateId"))
        self.tutorCommentedNum = try container.decode(Int.self, forKey: JSONKey("tutorCommentedNum"))
        self.tutorNum = try container.decode(Int.self, forKey: JSONKey("tutorNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["className", "commentedNum", "courseNum", "deputyHeadCommentNum", "epGradedNum", "gradedNum", "headTeacherCommentedNum", "headTeacherNum", "houseGroup", "requestUrl", "sent", "studentId", "studentName", "studentNum", "success", "templateId", "tutorCommentedNum", "tutorNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("commentedNum") { try container.encode(self.commentedNum, forKey: JSONKey("commentedNum")) }
        if presentFields.contains("courseNum") { try container.encode(self.courseNum, forKey: JSONKey("courseNum")) }
        if presentFields.contains("deputyHeadCommentNum") { try container.encode(self.deputyHeadCommentNum, forKey: JSONKey("deputyHeadCommentNum")) }
        if presentFields.contains("epGradedNum") { try container.encode(self.epGradedNum, forKey: JSONKey("epGradedNum")) }
        if presentFields.contains("gradedNum") { try container.encode(self.gradedNum, forKey: JSONKey("gradedNum")) }
        if presentFields.contains("headTeacherCommentedNum") { try container.encode(self.headTeacherCommentedNum, forKey: JSONKey("headTeacherCommentedNum")) }
        if presentFields.contains("headTeacherNum") { try container.encode(self.headTeacherNum, forKey: JSONKey("headTeacherNum")) }
        if presentFields.contains("houseGroup") { try container.encode(self.houseGroup, forKey: JSONKey("houseGroup")) }
        if presentFields.contains("requestUrl") { try container.encode(self.requestUrl, forKey: JSONKey("requestUrl")) }
        if presentFields.contains("sent") { try container.encode(self.sent, forKey: JSONKey("sent")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        if presentFields.contains("success") { try container.encode(self.success, forKey: JSONKey("success")) }
        if presentFields.contains("templateId") { try container.encode(self.templateId, forKey: JSONKey("templateId")) }
        if presentFields.contains("tutorCommentedNum") { try container.encode(self.tutorCommentedNum, forKey: JSONKey("tutorCommentedNum")) }
        if presentFields.contains("tutorNum") { try container.encode(self.tutorNum, forKey: JSONKey("tutorNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMonthlyGradeReportGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherMonthlyGradeReportGETResponseItemsItem]
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
        self.items = try container.decode([TeacherMonthlyGradeReportGETResponseItemsItem].self, forKey: JSONKey("items"))
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
