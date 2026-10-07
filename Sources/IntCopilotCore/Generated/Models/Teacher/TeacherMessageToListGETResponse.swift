import Foundation

public struct TeacherMessageToListGETResponseItemsItemFromMember: CapturedResponse {
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

public struct TeacherMessageToListGETResponseItemsItemToMember: CapturedResponse {
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

public struct TeacherMessageToListGETResponseItemsItem: CapturedResponse {
    /// 正文或学生提交内容，可能包含富文本。
    public let content: String
    /// 发送方完整信息。
    public let fromMember: TeacherMessageToListGETResponseItemsItemFromMember
    /// 是否重要消息。
    public let important: Bool
    /// 消息收发关联记录标识；允许为空或缺失。
    public let masterRecordId: JSONValue?
    /// 消息记录标识。
    public let messageId: Int
    /// 消息主记录标识，来自消息列表。
    public let messageMasterId: Int
    /// 当前记录是否已读。
    public let readFlag: Bool
    /// 消息发送时刻，Unix 毫秒。
    public let sendTime: Int
    /// 当前列表显示序号。
    public let seqNum: Int
    /// 消息或公告标题。
    public let title: String
    /// 接收方完整信息。
    public let toMember: TeacherMessageToListGETResponseItemsItemToMember
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.content = try container.decode(String.self, forKey: JSONKey("content"))
        self.fromMember = try container.decode(TeacherMessageToListGETResponseItemsItemFromMember.self, forKey: JSONKey("fromMember"))
        self.important = try container.decode(Bool.self, forKey: JSONKey("important"))
        self.masterRecordId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("masterRecordId"))
        self.messageId = try container.decode(Int.self, forKey: JSONKey("messageId"))
        self.messageMasterId = try container.decode(Int.self, forKey: JSONKey("messageMasterId"))
        self.readFlag = try container.decode(Bool.self, forKey: JSONKey("readFlag"))
        self.sendTime = try container.decode(Int.self, forKey: JSONKey("sendTime"))
        self.seqNum = try container.decode(Int.self, forKey: JSONKey("seqNum"))
        self.title = try container.decode(String.self, forKey: JSONKey("title"))
        self.toMember = try container.decode(TeacherMessageToListGETResponseItemsItemToMember.self, forKey: JSONKey("toMember"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "unconfirmed:/api/message/toList:type", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["content", "fromMember", "important", "masterRecordId", "messageId", "messageMasterId", "readFlag", "sendTime", "seqNum", "title", "toMember", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("content") { try container.encode(self.content, forKey: JSONKey("content")) }
        if presentFields.contains("fromMember") { try container.encode(self.fromMember, forKey: JSONKey("fromMember")) }
        if presentFields.contains("important") { try container.encode(self.important, forKey: JSONKey("important")) }
        if presentFields.contains("masterRecordId") { try container.encode(self.masterRecordId, forKey: JSONKey("masterRecordId")) }
        if presentFields.contains("messageId") { try container.encode(self.messageId, forKey: JSONKey("messageId")) }
        if presentFields.contains("messageMasterId") { try container.encode(self.messageMasterId, forKey: JSONKey("messageMasterId")) }
        if presentFields.contains("readFlag") { try container.encode(self.readFlag, forKey: JSONKey("readFlag")) }
        if presentFields.contains("sendTime") { try container.encode(self.sendTime, forKey: JSONKey("sendTime")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        if presentFields.contains("title") { try container.encode(self.title, forKey: JSONKey("title")) }
        if presentFields.contains("toMember") { try container.encode(self.toMember, forKey: JSONKey("toMember")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMessageToListGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherMessageToListGETResponseItemsItem]
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
        self.items = try container.decode([TeacherMessageToListGETResponseItemsItem].self, forKey: JSONKey("items"))
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
