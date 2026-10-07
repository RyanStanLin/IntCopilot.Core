import Foundation

public struct TeacherTaskPerformanceGETResponseItem: CapturedResponse {
    /// 主班级名称。
    public let className: String
    /// 评语或备注内容。
    public let comments: String
    /// 当前记录是否可编辑。
    public let editFlag: Bool
    /// 入学日期，Unix 毫秒；允许为空或缺失。
    public let enterDate: JSONValue?
    /// 学生提交时刻，Unix 毫秒；允许为空或缺失。
    public let handInTime: JSONValue?
    /// 学院名称。
    public let houseName: String
    /// 最后参与课程日期，Unix 毫秒；允许为空或缺失。
    public let lastClassDate: JSONValue?
    /// 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失。
    public let outDate: JSONValue?
    /// 是否允许再次提交。
    public let reSubmit: Bool
    /// 完整附件资源引用。
    public let resources: [JSONValue]
    /// 分数；单位及评分方式由任务或成绩规则决定。
    public let score: Double
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: Bool
    /// 学生显示姓名。
    public let studentName: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 评分备注标签，需按评分业务解析。
    public let tag: SemanticValue
    /// 学生任务关联标识，来自任务列表或任务学生记录。
    public let taskStudentId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.comments = try container.decode(String.self, forKey: JSONKey("comments"))
        self.editFlag = try container.decode(Bool.self, forKey: JSONKey("editFlag"))
        self.enterDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("enterDate"))
        self.handInTime = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("handInTime"))
        self.houseName = try container.decode(String.self, forKey: JSONKey("houseName"))
        self.lastClassDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("lastClassDate"))
        self.outDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("outDate"))
        self.reSubmit = try container.decode(Bool.self, forKey: JSONKey("reSubmit"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.score = try container.decode(Double.self, forKey: JSONKey("score"))
        self.status = try container.decode(Bool.self, forKey: JSONKey("status"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        self.tag = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("tag")), domain: "unconfirmed:/api/task/performance:tag", decoder: decoder)
        self.taskStudentId = try container.decode(Int.self, forKey: JSONKey("taskStudentId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["className", "comments", "editFlag", "enterDate", "handInTime", "houseName", "lastClassDate", "outDate", "reSubmit", "resources", "score", "status", "studentName", "studentNum", "tag", "taskStudentId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("comments") { try container.encode(self.comments, forKey: JSONKey("comments")) }
        if presentFields.contains("editFlag") { try container.encode(self.editFlag, forKey: JSONKey("editFlag")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("handInTime") { try container.encode(self.handInTime, forKey: JSONKey("handInTime")) }
        if presentFields.contains("houseName") { try container.encode(self.houseName, forKey: JSONKey("houseName")) }
        if presentFields.contains("lastClassDate") { try container.encode(self.lastClassDate, forKey: JSONKey("lastClassDate")) }
        if presentFields.contains("outDate") { try container.encode(self.outDate, forKey: JSONKey("outDate")) }
        if presentFields.contains("reSubmit") { try container.encode(self.reSubmit, forKey: JSONKey("reSubmit")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        if presentFields.contains("status") { try container.encode(self.status, forKey: JSONKey("status")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        if presentFields.contains("tag") { try container.encode(self.tag.rawValue, forKey: JSONKey("tag")) }
        if presentFields.contains("taskStudentId") { try container.encode(self.taskStudentId, forKey: JSONKey("taskStudentId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherTaskPerformanceGETResponse = [TeacherTaskPerformanceGETResponseItem]
