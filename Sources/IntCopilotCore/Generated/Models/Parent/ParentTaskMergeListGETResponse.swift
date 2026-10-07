import Foundation

public struct ParentTaskMergeListGETResponseItemsItem: CapturedResponse {
    /// 创建者姓名。
    public let creatorName: String
    /// 前端使用的显示名称。
    public let displayName: String
    /// 结束日期或截止时刻，Unix 毫秒。
    public let endDate: Int
    /// 混合列表实体标识；任务条目与教学资源条目的标识语义不同。
    public let entityId: Int
    /// 当前条目是否已读。
    public let isRead: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 是否线上提交或线上状态。
    public let online: Bool
    /// 作业分数；单位由任务评分规则决定；未评分或服务端缺失时为 nil，不当作零分。
    public let score: Double?
    /// 开始日期或时刻，Unix 毫秒。
    public let startDate: Int
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: Bool
    /// 评分上限或统计最高分，依端点业务区分。
    public let topScore: Int
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.creatorName = try container.decode(String.self, forKey: JSONKey("creatorName"))
        self.displayName = try container.decode(String.self, forKey: JSONKey("displayName"))
        self.endDate = try container.decode(Int.self, forKey: JSONKey("endDate"))
        self.entityId = try container.decode(Int.self, forKey: JSONKey("entityId"))
        self.isRead = try container.decode(Bool.self, forKey: JSONKey("isRead"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.online = try container.decode(Bool.self, forKey: JSONKey("online"))
        self.score = try container.decodeIfPresent(Double.self, forKey: JSONKey("score"))
        self.startDate = try container.decode(Int.self, forKey: JSONKey("startDate"))
        self.status = try container.decode(Bool.self, forKey: JSONKey("status"))
        self.topScore = try container.decode(Int.self, forKey: JSONKey("topScore"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "taskFeedType", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["creatorName", "displayName", "endDate", "entityId", "isRead", "name", "online", "score", "startDate", "status", "topScore", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("creatorName") { try container.encode(self.creatorName, forKey: JSONKey("creatorName")) }
        if presentFields.contains("displayName") { try container.encode(self.displayName, forKey: JSONKey("displayName")) }
        if presentFields.contains("endDate") { try container.encode(self.endDate, forKey: JSONKey("endDate")) }
        if presentFields.contains("entityId") { try container.encode(self.entityId, forKey: JSONKey("entityId")) }
        if presentFields.contains("isRead") { try container.encode(self.isRead, forKey: JSONKey("isRead")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("online") { try container.encode(self.online, forKey: JSONKey("online")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        if presentFields.contains("startDate") { try container.encode(self.startDate, forKey: JSONKey("startDate")) }
        if presentFields.contains("status") { try container.encode(self.status, forKey: JSONKey("status")) }
        if presentFields.contains("topScore") { try container.encode(self.topScore, forKey: JSONKey("topScore")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentTaskMergeListGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [ParentTaskMergeListGETResponseItemsItem]
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
        self.items = try container.decode([ParentTaskMergeListGETResponseItemsItem].self, forKey: JSONKey("items"))
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
