import Foundation

public struct TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedListItemsItem: CapturedResponse {
    /// 是否保密记录。
    public let confidential: Bool
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
    /// 当前记录是否可编辑。
    public let editFlag: Bool
    /// 后续跟进日期，Unix 毫秒。
    public let followUpDate: Int
    /// 最后修改者显示信息。
    public let modifier: String
    /// 最后修改时刻，Unix 毫秒。
    public let modifyTime: Int
    /// 是否启用服务端通知标记。
    public let notice: Bool
    /// 本次行为积分。
    public let points: Int
    /// 日记主类型中文名称。
    public let primaryType: String
    /// 日记主类型英文名称。
    public let primaryTypeEn: String
    /// 记录是否已删除。
    public let removeFlag: Bool
    /// 完整响应记录集合。
    public let responseList: [JSONValue]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.confidential = try container.decode(Bool.self, forKey: JSONKey("confidential"))
        self.createTime = try container.decode(Int.self, forKey: JSONKey("createTime"))
        self.creator = try container.decode(String.self, forKey: JSONKey("creator"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.diaryEntryId = try container.decode(Int.self, forKey: JSONKey("diaryEntryId"))
        self.diaryEntryType = try container.decode(String.self, forKey: JSONKey("diaryEntryType"))
        self.diaryEntryTypeEn = try container.decode(String.self, forKey: JSONKey("diaryEntryTypeEn"))
        self.editFlag = try container.decode(Bool.self, forKey: JSONKey("editFlag"))
        self.followUpDate = try container.decode(Int.self, forKey: JSONKey("followUpDate"))
        self.modifier = try container.decode(String.self, forKey: JSONKey("modifier"))
        self.modifyTime = try container.decode(Int.self, forKey: JSONKey("modifyTime"))
        self.notice = try container.decode(Bool.self, forKey: JSONKey("notice"))
        self.points = try container.decode(Int.self, forKey: JSONKey("points"))
        self.primaryType = try container.decode(String.self, forKey: JSONKey("primaryType"))
        self.primaryTypeEn = try container.decode(String.self, forKey: JSONKey("primaryTypeEn"))
        self.removeFlag = try container.decode(Bool.self, forKey: JSONKey("removeFlag"))
        self.responseList = try container.decode([JSONValue].self, forKey: JSONKey("responseList"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["confidential", "createTime", "creator", "description", "diaryEntryId", "diaryEntryType", "diaryEntryTypeEn", "editFlag", "followUpDate", "modifier", "modifyTime", "notice", "points", "primaryType", "primaryTypeEn", "removeFlag", "responseList"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("confidential") { try container.encode(self.confidential, forKey: JSONKey("confidential")) }
        if presentFields.contains("createTime") { try container.encode(self.createTime, forKey: JSONKey("createTime")) }
        if presentFields.contains("creator") { try container.encode(self.creator, forKey: JSONKey("creator")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("diaryEntryId") { try container.encode(self.diaryEntryId, forKey: JSONKey("diaryEntryId")) }
        if presentFields.contains("diaryEntryType") { try container.encode(self.diaryEntryType, forKey: JSONKey("diaryEntryType")) }
        if presentFields.contains("diaryEntryTypeEn") { try container.encode(self.diaryEntryTypeEn, forKey: JSONKey("diaryEntryTypeEn")) }
        if presentFields.contains("editFlag") { try container.encode(self.editFlag, forKey: JSONKey("editFlag")) }
        if presentFields.contains("followUpDate") { try container.encode(self.followUpDate, forKey: JSONKey("followUpDate")) }
        if presentFields.contains("modifier") { try container.encode(self.modifier, forKey: JSONKey("modifier")) }
        if presentFields.contains("modifyTime") { try container.encode(self.modifyTime, forKey: JSONKey("modifyTime")) }
        if presentFields.contains("notice") { try container.encode(self.notice, forKey: JSONKey("notice")) }
        if presentFields.contains("points") { try container.encode(self.points, forKey: JSONKey("points")) }
        if presentFields.contains("primaryType") { try container.encode(self.primaryType, forKey: JSONKey("primaryType")) }
        if presentFields.contains("primaryTypeEn") { try container.encode(self.primaryTypeEn, forKey: JSONKey("primaryTypeEn")) }
        if presentFields.contains("removeFlag") { try container.encode(self.removeFlag, forKey: JSONKey("removeFlag")) }
        if presentFields.contains("responseList") { try container.encode(self.responseList, forKey: JSONKey("responseList")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedList: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedListItemsItem]
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
        self.items = try container.decode([TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedListItemsItem].self, forKey: JSONKey("items"))
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

public struct TeacherDiaryByStudentGETResponse: CapturedResponse {
    /// 行为积分汇总。
    public let conductPoints: Int
    /// 日记记录的分页集合。
    public let diaryEntryItemResponsePagedList: TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedList
    /// 学院积分汇总。
    public let housePoints: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.conductPoints = try container.decode(Int.self, forKey: JSONKey("conductPoints"))
        self.diaryEntryItemResponsePagedList = try container.decode(TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedList.self, forKey: JSONKey("diaryEntryItemResponsePagedList"))
        self.housePoints = try container.decode(Int.self, forKey: JSONKey("housePoints"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["conductPoints", "diaryEntryItemResponsePagedList", "housePoints"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("conductPoints") { try container.encode(self.conductPoints, forKey: JSONKey("conductPoints")) }
        if presentFields.contains("diaryEntryItemResponsePagedList") { try container.encode(self.diaryEntryItemResponsePagedList, forKey: JSONKey("diaryEntryItemResponsePagedList")) }
        if presentFields.contains("housePoints") { try container.encode(self.housePoints, forKey: JSONKey("housePoints")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
