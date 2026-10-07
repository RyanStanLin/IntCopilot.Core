import Foundation

public struct TeacherTaskMergeListGETResponseItemsItem: CapturedResponse {
    /// 业务名称缩写。
    public let abbr: String
    /// 统计总数量。
    public let allNum: Int
    /// 显示颜色。
    public let color: String
    /// 创建时刻，Unix 毫秒。
    public let createTime: Int
    /// 创建者显示信息。
    public let creator: Int
    /// 创建者姓名。
    public let creatorName: String
    /// 当前记录是否可编辑。
    public let editFlag: Bool
    /// 混合列表实体标识；任务条目与教学资源条目的标识语义不同。
    public let entityId: Int
    /// 已评分学生数量。
    public let gradedNum: Int
    /// 是否计入汇总成绩。
    public let inTotal: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 是否线上提交或线上状态。
    public let online: Bool
    /// 是否开放。
    public let openFlag: Bool
    /// 关联家长数量。
    public let parentNum: Int
    /// 家长已读数量。
    public let parentReadNum: Int
    /// 是否启用评分。
    public let scoreFlag: Bool
    /// 学生已读数量。
    public let studentReadNum: Int
    /// 已提交数量。
    public let submitNum: Int
    /// 任务类型名称。
    public let taskTypeName: String
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.abbr = try container.decode(String.self, forKey: JSONKey("abbr"))
        self.allNum = try container.decode(Int.self, forKey: JSONKey("allNum"))
        self.color = try container.decode(String.self, forKey: JSONKey("color"))
        self.createTime = try container.decode(Int.self, forKey: JSONKey("createTime"))
        self.creator = try container.decode(Int.self, forKey: JSONKey("creator"))
        self.creatorName = try container.decode(String.self, forKey: JSONKey("creatorName"))
        self.editFlag = try container.decode(Bool.self, forKey: JSONKey("editFlag"))
        self.entityId = try container.decode(Int.self, forKey: JSONKey("entityId"))
        self.gradedNum = try container.decode(Int.self, forKey: JSONKey("gradedNum"))
        self.inTotal = try container.decode(Bool.self, forKey: JSONKey("inTotal"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.online = try container.decode(Bool.self, forKey: JSONKey("online"))
        self.openFlag = try container.decode(Bool.self, forKey: JSONKey("openFlag"))
        self.parentNum = try container.decode(Int.self, forKey: JSONKey("parentNum"))
        self.parentReadNum = try container.decode(Int.self, forKey: JSONKey("parentReadNum"))
        self.scoreFlag = try container.decode(Bool.self, forKey: JSONKey("scoreFlag"))
        self.studentReadNum = try container.decode(Int.self, forKey: JSONKey("studentReadNum"))
        self.submitNum = try container.decode(Int.self, forKey: JSONKey("submitNum"))
        self.taskTypeName = try container.decode(String.self, forKey: JSONKey("taskTypeName"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "taskFeedType", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["abbr", "allNum", "color", "createTime", "creator", "creatorName", "editFlag", "entityId", "gradedNum", "inTotal", "name", "online", "openFlag", "parentNum", "parentReadNum", "scoreFlag", "studentReadNum", "submitNum", "taskTypeName", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("abbr") { try container.encode(self.abbr, forKey: JSONKey("abbr")) }
        if presentFields.contains("allNum") { try container.encode(self.allNum, forKey: JSONKey("allNum")) }
        if presentFields.contains("color") { try container.encode(self.color, forKey: JSONKey("color")) }
        if presentFields.contains("createTime") { try container.encode(self.createTime, forKey: JSONKey("createTime")) }
        if presentFields.contains("creator") { try container.encode(self.creator, forKey: JSONKey("creator")) }
        if presentFields.contains("creatorName") { try container.encode(self.creatorName, forKey: JSONKey("creatorName")) }
        if presentFields.contains("editFlag") { try container.encode(self.editFlag, forKey: JSONKey("editFlag")) }
        if presentFields.contains("entityId") { try container.encode(self.entityId, forKey: JSONKey("entityId")) }
        if presentFields.contains("gradedNum") { try container.encode(self.gradedNum, forKey: JSONKey("gradedNum")) }
        if presentFields.contains("inTotal") { try container.encode(self.inTotal, forKey: JSONKey("inTotal")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("online") { try container.encode(self.online, forKey: JSONKey("online")) }
        if presentFields.contains("openFlag") { try container.encode(self.openFlag, forKey: JSONKey("openFlag")) }
        if presentFields.contains("parentNum") { try container.encode(self.parentNum, forKey: JSONKey("parentNum")) }
        if presentFields.contains("parentReadNum") { try container.encode(self.parentReadNum, forKey: JSONKey("parentReadNum")) }
        if presentFields.contains("scoreFlag") { try container.encode(self.scoreFlag, forKey: JSONKey("scoreFlag")) }
        if presentFields.contains("studentReadNum") { try container.encode(self.studentReadNum, forKey: JSONKey("studentReadNum")) }
        if presentFields.contains("submitNum") { try container.encode(self.submitNum, forKey: JSONKey("submitNum")) }
        if presentFields.contains("taskTypeName") { try container.encode(self.taskTypeName, forKey: JSONKey("taskTypeName")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherTaskMergeListGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherTaskMergeListGETResponseItemsItem]
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
        self.items = try container.decode([TeacherTaskMergeListGETResponseItemsItem].self, forKey: JSONKey("items"))
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
