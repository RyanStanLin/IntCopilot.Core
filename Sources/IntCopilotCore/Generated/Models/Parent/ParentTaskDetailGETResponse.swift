import Foundation

public struct ParentTaskDetailGETResponse: CapturedResponse {
    /// 评语或备注内容。
    public let comments: String
    /// 正文或学生提交内容，可能包含富文本。
    public let content: String
    /// 课程名称。
    public let courseName: String
    /// 业务说明或富文本内容。
    public let description: String
    /// 结束日期或截止时刻，Unix 毫秒。
    public let endDate: Int
    /// 是否计入汇总成绩。
    public let inTotal: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 是否线上提交或线上状态。
    public let online: Bool
    /// 是否已超过截止时间。
    public let overDeadline: Bool
    /// 完整附件资源引用。
    public let resources: [JSONValue]
    /// 分数；单位及评分方式由任务或成绩规则决定。
    public let score: Int
    /// 是否启用评分。
    public let scoreFlag: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: Bool
    /// 学生提交的附件资源。
    public let studentResources: [JSONValue]
    /// 学科名称。
    public let subjectName: String
    /// 评分备注标签，需按评分业务解析。
    public let tag: SemanticValue
    /// 任务标识，来自任务列表。
    public let taskId: Int
    /// 学生任务关联标识，来自任务列表或任务学生记录。
    public let taskStudentId: Int
    /// 评分上限或统计最高分，依端点业务区分。
    public let topScore: Int
    /// 业务类型名称。
    public let typeName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.comments = try container.decode(String.self, forKey: JSONKey("comments"))
        self.content = try container.decode(String.self, forKey: JSONKey("content"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.endDate = try container.decode(Int.self, forKey: JSONKey("endDate"))
        self.inTotal = try container.decode(Bool.self, forKey: JSONKey("inTotal"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.online = try container.decode(Bool.self, forKey: JSONKey("online"))
        self.overDeadline = try container.decode(Bool.self, forKey: JSONKey("overDeadline"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.score = try container.decode(Int.self, forKey: JSONKey("score"))
        self.scoreFlag = try container.decode(Bool.self, forKey: JSONKey("scoreFlag"))
        self.status = try container.decode(Bool.self, forKey: JSONKey("status"))
        self.studentResources = try container.decode([JSONValue].self, forKey: JSONKey("studentResources"))
        self.subjectName = try container.decode(String.self, forKey: JSONKey("subjectName"))
        self.tag = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("tag")), domain: "unconfirmed:/api/task/detail:tag", decoder: decoder)
        self.taskId = try container.decode(Int.self, forKey: JSONKey("taskId"))
        self.taskStudentId = try container.decode(Int.self, forKey: JSONKey("taskStudentId"))
        self.topScore = try container.decode(Int.self, forKey: JSONKey("topScore"))
        self.typeName = try container.decode(String.self, forKey: JSONKey("typeName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["comments", "content", "courseName", "description", "endDate", "inTotal", "name", "online", "overDeadline", "resources", "score", "scoreFlag", "status", "studentResources", "subjectName", "tag", "taskId", "taskStudentId", "topScore", "typeName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("comments") { try container.encode(self.comments, forKey: JSONKey("comments")) }
        if presentFields.contains("content") { try container.encode(self.content, forKey: JSONKey("content")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("endDate") { try container.encode(self.endDate, forKey: JSONKey("endDate")) }
        if presentFields.contains("inTotal") { try container.encode(self.inTotal, forKey: JSONKey("inTotal")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("online") { try container.encode(self.online, forKey: JSONKey("online")) }
        if presentFields.contains("overDeadline") { try container.encode(self.overDeadline, forKey: JSONKey("overDeadline")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        if presentFields.contains("scoreFlag") { try container.encode(self.scoreFlag, forKey: JSONKey("scoreFlag")) }
        if presentFields.contains("status") { try container.encode(self.status, forKey: JSONKey("status")) }
        if presentFields.contains("studentResources") { try container.encode(self.studentResources, forKey: JSONKey("studentResources")) }
        if presentFields.contains("subjectName") { try container.encode(self.subjectName, forKey: JSONKey("subjectName")) }
        if presentFields.contains("tag") { try container.encode(self.tag.rawValue, forKey: JSONKey("tag")) }
        if presentFields.contains("taskId") { try container.encode(self.taskId, forKey: JSONKey("taskId")) }
        if presentFields.contains("taskStudentId") { try container.encode(self.taskStudentId, forKey: JSONKey("taskStudentId")) }
        if presentFields.contains("topScore") { try container.encode(self.topScore, forKey: JSONKey("topScore")) }
        if presentFields.contains("typeName") { try container.encode(self.typeName, forKey: JSONKey("typeName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
