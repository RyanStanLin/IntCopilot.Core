import Foundation

public struct TeacherMessageFromListGETResponseItemsItemFromMember: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: String
    /// 当前消息成员标识，需结合 memberType 解释。
    public let memberId: Int
    /// 消息成员身份类别。
    public let memberType: String
    /// 业务实体或选项名称。
    public let name: String
    /// 家长与学生的关系。
    public let relationship: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单；允许为空或缺失。
    public let studentId: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(String.self, forKey: JSONKey("enterDate"))
        self.memberId = try container.decode(Int.self, forKey: JSONKey("memberId"))
        self.memberType = try container.decode(String.self, forKey: JSONKey("memberType"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.relationship = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("relationship")), domain: "relationship", decoder: decoder)
        self.studentId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("studentId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "enName", "enterDate", "memberId", "memberType", "name", "relationship", "studentId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("memberId") { try container.encode(self.memberId, forKey: JSONKey("memberId")) }
        if presentFields.contains("memberType") { try container.encode(self.memberType, forKey: JSONKey("memberType")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("relationship") { try container.encode(self.relationship.rawValue, forKey: JSONKey("relationship")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMessageFromListGETResponseItemsItemToMembersItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: String
    /// 当前消息成员标识，需结合 memberType 解释。
    public let memberId: Int
    /// 消息成员身份类别。
    public let memberType: String
    /// 业务实体或选项名称。
    public let name: String
    /// 家长与学生的关系。
    public let relationship: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(String.self, forKey: JSONKey("enterDate"))
        self.memberId = try container.decode(Int.self, forKey: JSONKey("memberId"))
        self.memberType = try container.decode(String.self, forKey: JSONKey("memberType"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.relationship = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("relationship")), domain: "relationship", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "enName", "enterDate", "memberId", "memberType", "name", "relationship", "studentId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("memberId") { try container.encode(self.memberId, forKey: JSONKey("memberId")) }
        if presentFields.contains("memberType") { try container.encode(self.memberType, forKey: JSONKey("memberType")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("relationship") { try container.encode(self.relationship.rawValue, forKey: JSONKey("relationship")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMessageFromListGETResponseItemsItem: CapturedResponse {
    /// 正文或学生提交内容，可能包含富文本。
    public let content: String
    /// 发送方完整信息。
    public let fromMember: TeacherMessageFromListGETResponseItemsItemFromMember
    /// 消息主记录标识，来自消息列表。
    public let messageMasterId: Int
    /// 已读收件人数量。
    public let readNum: Int
    /// 消息发送时刻，Unix 毫秒。
    public let sendTime: Int
    /// 当前列表显示序号。
    public let seqNum: Int
    /// 消息或公告标题。
    public let title: String
    /// 接收方完整列表。
    public let toMembers: [TeacherMessageFromListGETResponseItemsItemToMembersItem]
    /// 消息是否已撤回。
    public let withdraw: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.content = try container.decode(String.self, forKey: JSONKey("content"))
        self.fromMember = try container.decode(TeacherMessageFromListGETResponseItemsItemFromMember.self, forKey: JSONKey("fromMember"))
        self.messageMasterId = try container.decode(Int.self, forKey: JSONKey("messageMasterId"))
        self.readNum = try container.decode(Int.self, forKey: JSONKey("readNum"))
        self.sendTime = try container.decode(Int.self, forKey: JSONKey("sendTime"))
        self.seqNum = try container.decode(Int.self, forKey: JSONKey("seqNum"))
        self.title = try container.decode(String.self, forKey: JSONKey("title"))
        self.toMembers = try container.decode([TeacherMessageFromListGETResponseItemsItemToMembersItem].self, forKey: JSONKey("toMembers"))
        self.withdraw = try container.decode(Bool.self, forKey: JSONKey("withdraw"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["content", "fromMember", "messageMasterId", "readNum", "sendTime", "seqNum", "title", "toMembers", "withdraw"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("content") { try container.encode(self.content, forKey: JSONKey("content")) }
        if presentFields.contains("fromMember") { try container.encode(self.fromMember, forKey: JSONKey("fromMember")) }
        if presentFields.contains("messageMasterId") { try container.encode(self.messageMasterId, forKey: JSONKey("messageMasterId")) }
        if presentFields.contains("readNum") { try container.encode(self.readNum, forKey: JSONKey("readNum")) }
        if presentFields.contains("sendTime") { try container.encode(self.sendTime, forKey: JSONKey("sendTime")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        if presentFields.contains("title") { try container.encode(self.title, forKey: JSONKey("title")) }
        if presentFields.contains("toMembers") { try container.encode(self.toMembers, forKey: JSONKey("toMembers")) }
        if presentFields.contains("withdraw") { try container.encode(self.withdraw, forKey: JSONKey("withdraw")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMessageFromListGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherMessageFromListGETResponseItemsItem]
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
        self.items = try container.decode([TeacherMessageFromListGETResponseItemsItem].self, forKey: JSONKey("items"))
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
