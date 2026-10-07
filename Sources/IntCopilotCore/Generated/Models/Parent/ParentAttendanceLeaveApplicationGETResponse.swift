import Foundation

public struct ParentAttendanceLeaveApplicationGETResponseItemsItem: CapturedResponse {
    /// 审批回复。
    public let approveReply: String
    /// 已关联附件列表。
    public let attachment: [JSONValue]
    /// 审批人员显示信息。
    public let auditor: String
    /// 审批拒绝原因。
    public let declineReason: String
    /// 前端使用的显示名称。
    public let displayName: String
    /// 请假时长，以天为单位。
    public let durationInDays: Double
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 请假申请标识，来自请假记录。
    public let leaveApplicationId: Int
    /// 最后修改时刻，Unix 毫秒。
    public let modifyTime: Int
    /// 请假原因说明或课程离班说明。
    public let reason: String
    /// 请假原因选项英文名称。
    public let reasonEnName: String
    /// 请假原因选项标识，来自原因字典。
    public let reasonId: Int
    /// 请假原因选项中文名称。
    public let reasonName: String
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.approveReply = try container.decode(String.self, forKey: JSONKey("approveReply"))
        self.attachment = try container.decode([JSONValue].self, forKey: JSONKey("attachment"))
        self.auditor = try container.decode(String.self, forKey: JSONKey("auditor"))
        self.declineReason = try container.decode(String.self, forKey: JSONKey("declineReason"))
        self.displayName = try container.decode(String.self, forKey: JSONKey("displayName"))
        self.durationInDays = try container.decode(Double.self, forKey: JSONKey("durationInDays"))
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.leaveApplicationId = try container.decode(Int.self, forKey: JSONKey("leaveApplicationId"))
        self.modifyTime = try container.decode(Int.self, forKey: JSONKey("modifyTime"))
        self.reason = try container.decode(String.self, forKey: JSONKey("reason"))
        self.reasonEnName = try container.decode(String.self, forKey: JSONKey("reasonEnName"))
        self.reasonId = try container.decode(Int.self, forKey: JSONKey("reasonId"))
        self.reasonName = try container.decode(String.self, forKey: JSONKey("reasonName"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "leaveStatus", decoder: decoder)
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "leaveKind", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["approveReply", "attachment", "auditor", "declineReason", "displayName", "durationInDays", "endTime", "leaveApplicationId", "modifyTime", "reason", "reasonEnName", "reasonId", "reasonName", "startTime", "status", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("approveReply") { try container.encode(self.approveReply, forKey: JSONKey("approveReply")) }
        if presentFields.contains("attachment") { try container.encode(self.attachment, forKey: JSONKey("attachment")) }
        if presentFields.contains("auditor") { try container.encode(self.auditor, forKey: JSONKey("auditor")) }
        if presentFields.contains("declineReason") { try container.encode(self.declineReason, forKey: JSONKey("declineReason")) }
        if presentFields.contains("displayName") { try container.encode(self.displayName, forKey: JSONKey("displayName")) }
        if presentFields.contains("durationInDays") { try container.encode(self.durationInDays, forKey: JSONKey("durationInDays")) }
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("leaveApplicationId") { try container.encode(self.leaveApplicationId, forKey: JSONKey("leaveApplicationId")) }
        if presentFields.contains("modifyTime") { try container.encode(self.modifyTime, forKey: JSONKey("modifyTime")) }
        if presentFields.contains("reason") { try container.encode(self.reason, forKey: JSONKey("reason")) }
        if presentFields.contains("reasonEnName") { try container.encode(self.reasonEnName, forKey: JSONKey("reasonEnName")) }
        if presentFields.contains("reasonId") { try container.encode(self.reasonId, forKey: JSONKey("reasonId")) }
        if presentFields.contains("reasonName") { try container.encode(self.reasonName, forKey: JSONKey("reasonName")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentAttendanceLeaveApplicationGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [ParentAttendanceLeaveApplicationGETResponseItemsItem]
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
        self.items = try container.decode([ParentAttendanceLeaveApplicationGETResponseItemsItem].self, forKey: JSONKey("items"))
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
