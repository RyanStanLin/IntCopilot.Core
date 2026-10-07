import Foundation

public struct TeacherDropDownMessageReceiverGETResponseItemsItem: CapturedResponse {
    /// 所属学院显示名称。
    public let academy: String
    /// 是否寄宿。
    public let boarding: Bool
    /// 主班级名称。
    public let className: String
    /// 宿舍显示名称。
    public let dormitoryName: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: Int
    /// 名字或拼音名。
    public let firstName: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 业务实体或选项名称。
    public let name: String
    /// 家长标识。
    public let parentId: Int
    /// 家长与学生的关系，保留服务端拼写。
    public let relationShip: SemanticValue
    /// 是否乘坐校车。
    public let schoolBus: Bool
    /// 自习室显示名称。
    public let selfStudyRoomName: String
    /// 当前列表显示序号。
    public let seqNum: Int
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.academy = try container.decode(String.self, forKey: JSONKey("academy"))
        self.boarding = try container.decode(Bool.self, forKey: JSONKey("boarding"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.dormitoryName = try container.decode(String.self, forKey: JSONKey("dormitoryName"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(Int.self, forKey: JSONKey("enterDate"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.parentId = try container.decode(Int.self, forKey: JSONKey("parentId"))
        self.relationShip = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("relationShip")), domain: "relationship", decoder: decoder)
        self.schoolBus = try container.decode(Bool.self, forKey: JSONKey("schoolBus"))
        self.selfStudyRoomName = try container.decode(String.self, forKey: JSONKey("selfStudyRoomName"))
        self.seqNum = try container.decode(Int.self, forKey: JSONKey("seqNum"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["academy", "boarding", "className", "dormitoryName", "enName", "enterDate", "firstName", "gender", "lastName", "name", "parentId", "relationShip", "schoolBus", "selfStudyRoomName", "seqNum", "status", "studentId", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("academy") { try container.encode(self.academy, forKey: JSONKey("academy")) }
        if presentFields.contains("boarding") { try container.encode(self.boarding, forKey: JSONKey("boarding")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("dormitoryName") { try container.encode(self.dormitoryName, forKey: JSONKey("dormitoryName")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("parentId") { try container.encode(self.parentId, forKey: JSONKey("parentId")) }
        if presentFields.contains("relationShip") { try container.encode(self.relationShip.rawValue, forKey: JSONKey("relationShip")) }
        if presentFields.contains("schoolBus") { try container.encode(self.schoolBus, forKey: JSONKey("schoolBus")) }
        if presentFields.contains("selfStudyRoomName") { try container.encode(self.selfStudyRoomName, forKey: JSONKey("selfStudyRoomName")) }
        if presentFields.contains("seqNum") { try container.encode(self.seqNum, forKey: JSONKey("seqNum")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDropDownMessageReceiverGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherDropDownMessageReceiverGETResponseItemsItem]
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
        self.items = try container.decode([TeacherDropDownMessageReceiverGETResponseItemsItem].self, forKey: JSONKey("items"))
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
