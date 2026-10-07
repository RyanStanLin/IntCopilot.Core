import Foundation

public struct TeacherMessageFromDetailGETResponseItemFromMember: CapturedResponse {
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

public struct TeacherMessageFromDetailGETResponseItemToParentsItem: CapturedResponse {
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

public struct TeacherMessageFromDetailGETResponseItem: CapturedResponse {
    /// 当前账号是否可删除此收发记录。
    public let canDelete: Bool
    /// 正文或学生提交内容，可能包含富文本。
    public let content: String
    /// 发送方完整信息。
    public let fromMember: TeacherMessageFromDetailGETResponseItemFromMember
    /// 消息收发关联记录标识；允许为空或缺失。
    public let masterRecordId: JSONValue?
    /// 消息主记录标识，来自消息列表。
    public let messageMasterId: Int
    /// 完整附件资源引用。
    public let resources: [JSONValue]
    /// 当前账号是否已删除此收发记录。
    public let selfDelete: Bool
    /// 是否同时发送邮件。
    public let sendMail: Bool
    /// 消息发送时刻，Unix 毫秒。
    public let sendTime: Int
    /// 消息或公告标题。
    public let title: String
    /// 家长接收方。
    public let toParents: [TeacherMessageFromDetailGETResponseItemToParentsItem]
    /// 学生接收方。
    public let toStudents: [JSONValue]
    /// 教师接收方。
    public let toTeachers: [JSONValue]
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 消息是否已撤回。
    public let withdraw: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.canDelete = try container.decode(Bool.self, forKey: JSONKey("canDelete"))
        self.content = try container.decode(String.self, forKey: JSONKey("content"))
        self.fromMember = try container.decode(TeacherMessageFromDetailGETResponseItemFromMember.self, forKey: JSONKey("fromMember"))
        self.masterRecordId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("masterRecordId"))
        self.messageMasterId = try container.decode(Int.self, forKey: JSONKey("messageMasterId"))
        self.resources = try container.decode([JSONValue].self, forKey: JSONKey("resources"))
        self.selfDelete = try container.decode(Bool.self, forKey: JSONKey("selfDelete"))
        self.sendMail = try container.decode(Bool.self, forKey: JSONKey("sendMail"))
        self.sendTime = try container.decode(Int.self, forKey: JSONKey("sendTime"))
        self.title = try container.decode(String.self, forKey: JSONKey("title"))
        self.toParents = try container.decode([TeacherMessageFromDetailGETResponseItemToParentsItem].self, forKey: JSONKey("toParents"))
        self.toStudents = try container.decode([JSONValue].self, forKey: JSONKey("toStudents"))
        self.toTeachers = try container.decode([JSONValue].self, forKey: JSONKey("toTeachers"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "unconfirmed:/api/message/fromDetail:type", decoder: decoder)
        self.withdraw = try container.decode(Bool.self, forKey: JSONKey("withdraw"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["canDelete", "content", "fromMember", "masterRecordId", "messageMasterId", "resources", "selfDelete", "sendMail", "sendTime", "title", "toParents", "toStudents", "toTeachers", "type", "withdraw"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("canDelete") { try container.encode(self.canDelete, forKey: JSONKey("canDelete")) }
        if presentFields.contains("content") { try container.encode(self.content, forKey: JSONKey("content")) }
        if presentFields.contains("fromMember") { try container.encode(self.fromMember, forKey: JSONKey("fromMember")) }
        if presentFields.contains("masterRecordId") { try container.encode(self.masterRecordId, forKey: JSONKey("masterRecordId")) }
        if presentFields.contains("messageMasterId") { try container.encode(self.messageMasterId, forKey: JSONKey("messageMasterId")) }
        if presentFields.contains("resources") { try container.encode(self.resources, forKey: JSONKey("resources")) }
        if presentFields.contains("selfDelete") { try container.encode(self.selfDelete, forKey: JSONKey("selfDelete")) }
        if presentFields.contains("sendMail") { try container.encode(self.sendMail, forKey: JSONKey("sendMail")) }
        if presentFields.contains("sendTime") { try container.encode(self.sendTime, forKey: JSONKey("sendTime")) }
        if presentFields.contains("title") { try container.encode(self.title, forKey: JSONKey("title")) }
        if presentFields.contains("toParents") { try container.encode(self.toParents, forKey: JSONKey("toParents")) }
        if presentFields.contains("toStudents") { try container.encode(self.toStudents, forKey: JSONKey("toStudents")) }
        if presentFields.contains("toTeachers") { try container.encode(self.toTeachers, forKey: JSONKey("toTeachers")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("withdraw") { try container.encode(self.withdraw, forKey: JSONKey("withdraw")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherMessageFromDetailGETResponse = [TeacherMessageFromDetailGETResponseItem]
