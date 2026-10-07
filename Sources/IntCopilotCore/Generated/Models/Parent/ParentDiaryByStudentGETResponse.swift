import Foundation

public struct ParentDiaryByStudentGETResponseItemsItem: CapturedResponse {
    /// 创建时刻，Unix 毫秒。
    public let createTime: Int
    /// 创建者显示信息。
    public let creator: String
    /// 业务说明或富文本内容。
    public let description: String
    /// 日记记录标识。
    public let diaryEntryId: Int
    /// 日记子类型中文名称。
    public let diaryEntryType: String
    /// 日记子类型英文名称。
    public let diaryEntryTypeEn: String
    /// 前端使用的显示名称。
    public let displayName: String
    /// 本次行为积分。
    public let points: Int
    /// 日记主类型中文名称。
    public let primaryType: String
    /// 日记主类型英文名称。
    public let primaryTypeEn: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.createTime = try container.decode(Int.self, forKey: JSONKey("createTime"))
        self.creator = try container.decode(String.self, forKey: JSONKey("creator"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.diaryEntryId = try container.decode(Int.self, forKey: JSONKey("diaryEntryId"))
        self.diaryEntryType = try container.decode(String.self, forKey: JSONKey("diaryEntryType"))
        self.diaryEntryTypeEn = try container.decode(String.self, forKey: JSONKey("diaryEntryTypeEn"))
        self.displayName = try container.decode(String.self, forKey: JSONKey("displayName"))
        self.points = try container.decode(Int.self, forKey: JSONKey("points"))
        self.primaryType = try container.decode(String.self, forKey: JSONKey("primaryType"))
        self.primaryTypeEn = try container.decode(String.self, forKey: JSONKey("primaryTypeEn"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["createTime", "creator", "description", "diaryEntryId", "diaryEntryType", "diaryEntryTypeEn", "displayName", "points", "primaryType", "primaryTypeEn"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("createTime") { try container.encode(self.createTime, forKey: JSONKey("createTime")) }
        if presentFields.contains("creator") { try container.encode(self.creator, forKey: JSONKey("creator")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("diaryEntryId") { try container.encode(self.diaryEntryId, forKey: JSONKey("diaryEntryId")) }
        if presentFields.contains("diaryEntryType") { try container.encode(self.diaryEntryType, forKey: JSONKey("diaryEntryType")) }
        if presentFields.contains("diaryEntryTypeEn") { try container.encode(self.diaryEntryTypeEn, forKey: JSONKey("diaryEntryTypeEn")) }
        if presentFields.contains("displayName") { try container.encode(self.displayName, forKey: JSONKey("displayName")) }
        if presentFields.contains("points") { try container.encode(self.points, forKey: JSONKey("points")) }
        if presentFields.contains("primaryType") { try container.encode(self.primaryType, forKey: JSONKey("primaryType")) }
        if presentFields.contains("primaryTypeEn") { try container.encode(self.primaryTypeEn, forKey: JSONKey("primaryTypeEn")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentDiaryByStudentGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [ParentDiaryByStudentGETResponseItemsItem]
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
        self.items = try container.decode([ParentDiaryByStudentGETResponseItemsItem].self, forKey: JSONKey("items"))
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
