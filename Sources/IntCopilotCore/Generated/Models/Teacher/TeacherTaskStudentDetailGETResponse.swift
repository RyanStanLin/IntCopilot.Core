import Foundation

public struct TeacherTaskStudentDetailGETResponse: CapturedResponse {
    /// 评语或备注内容。
    public let comments: String
    /// 正文或学生提交内容，可能包含富文本。
    public let content: String
    /// 完整附件资源引用。
    public let resources: [JSONValue]
    /// 分数；单位及评分方式由任务或成绩规则决定；允许为空或缺失。
    public let score: Double?
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 评分备注标签，需按评分业务解析。
    public let tag: SemanticValue
    /// 任务标识，来自任务列表。
    public let taskId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.comments = try container.decode(String.self, forKey: JSONKey("comments"))
        self.content = try container.decode(String.self, forKey: JSONKey("content"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.score = try container.decodeIfPresent(Double.self, forKey: JSONKey("score"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.tag = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("tag")), domain: "unconfirmed:/api/task/student/detail:tag", decoder: decoder)
        self.taskId = try container.decode(Int.self, forKey: JSONKey("taskId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["comments", "content", "resources", "score", "studentId", "studentName", "tag", "taskId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("comments") { try container.encode(self.comments, forKey: JSONKey("comments")) }
        if presentFields.contains("content") { try container.encode(self.content, forKey: JSONKey("content")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("tag") { try container.encode(self.tag.rawValue, forKey: JSONKey("tag")) }
        if presentFields.contains("taskId") { try container.encode(self.taskId, forKey: JSONKey("taskId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
