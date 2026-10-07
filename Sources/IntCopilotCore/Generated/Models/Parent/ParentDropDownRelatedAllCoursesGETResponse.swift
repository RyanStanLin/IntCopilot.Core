import Foundation

public struct ParentDropDownRelatedAllCoursesGETResponseItem: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 业务说明或富文本内容。
    public let description: String
    /// 当前条目是否已读。
    public let isRead: Bool
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未提交任务数。
    public let unHandInNum: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.isRead = try container.decode(Bool.self, forKey: JSONKey("isRead"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "courseType", decoder: decoder)
        self.unHandInNum = try container.decode(Int.self, forKey: JSONKey("unHandInNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["courseId", "description", "isRead", "type", "unHandInNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("isRead") { try container.encode(self.isRead, forKey: JSONKey("isRead")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("unHandInNum") { try container.encode(self.unHandInNum, forKey: JSONKey("unHandInNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias ParentDropDownRelatedAllCoursesGETResponse = [ParentDropDownRelatedAllCoursesGETResponseItem]
