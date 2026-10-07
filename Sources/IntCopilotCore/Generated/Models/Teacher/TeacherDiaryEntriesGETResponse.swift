import Foundation

public struct TeacherDiaryEntriesGETResponseItemsItemDiaryEntryStatisticsItem: CapturedResponse {
    /// 当前节点记录数量。
    public let countNum: Int
    /// 日记子类型标识，来自对应主类型的子类型选项。
    public let diaryEntryTypeId: Int
    /// 选项的英文显示文本。
    public let enValue: String
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.countNum = try container.decode(Int.self, forKey: JSONKey("countNum"))
        self.diaryEntryTypeId = try container.decode(Int.self, forKey: JSONKey("diaryEntryTypeId"))
        self.enValue = try container.decode(String.self, forKey: JSONKey("enValue"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["countNum", "diaryEntryTypeId", "enValue", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("countNum") { try container.encode(self.countNum, forKey: JSONKey("countNum")) }
        if presentFields.contains("diaryEntryTypeId") { try container.encode(self.diaryEntryTypeId, forKey: JSONKey("diaryEntryTypeId")) }
        if presentFields.contains("enValue") { try container.encode(self.enValue, forKey: JSONKey("enValue")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDiaryEntriesGETResponseItemsItem: CapturedResponse {
    /// 主班级名称。
    public let className: String
    /// 行为积分汇总。
    public let conductPoints: Int
    /// 当前节点记录数量。
    public let countNum: Int
    /// 日记积分或行为统计。
    public let diaryEntryStatistics: [TeacherDiaryEntriesGETResponseItemsItemDiaryEntryStatisticsItem]
    /// 关联日记标识集合。
    public let diaryIds: [Int]
    /// 宿舍显示名称。
    public let dormitoryName: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 学院名称。
    public let house: String
    /// 学院积分汇总；允许为空或缺失。
    public let housePoints: JSONValue?
    /// 类型关联图标。
    public let icons: [JSONValue]
    /// 最后修改时刻，Unix 毫秒。
    public let modifyTime: Int
    /// 负向行为积分。
    public let negativePoints: Int
    /// 备注类记录积分。
    public let notePoints: Int
    /// 本次行为积分。
    public let points: Int
    /// 正向表现积分。
    public let positivePoints: Int
    /// 自习室显示名称。
    public let selfStudyRoomName: String
    /// 学生头像资源地址。
    public let studentAvatar: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.conductPoints = try container.decode(Int.self, forKey: JSONKey("conductPoints"))
        self.countNum = try container.decode(Int.self, forKey: JSONKey("countNum"))
        self.diaryEntryStatistics = try container.decode([TeacherDiaryEntriesGETResponseItemsItemDiaryEntryStatisticsItem].self, forKey: JSONKey("diaryEntryStatistics"))
        self.diaryIds = try container.decode([Int].self, forKey: JSONKey("diaryIds"))
        self.dormitoryName = try container.decode(String.self, forKey: JSONKey("dormitoryName"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.house = try container.decode(String.self, forKey: JSONKey("house"))
        self.housePoints = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("housePoints"))
        self.icons = try container.decode([JSONValue].self, forKey: JSONKey("icons"))
        self.modifyTime = try container.decode(Int.self, forKey: JSONKey("modifyTime"))
        self.negativePoints = try container.decode(Int.self, forKey: JSONKey("negativePoints"))
        self.notePoints = try container.decode(Int.self, forKey: JSONKey("notePoints"))
        self.points = try container.decode(Int.self, forKey: JSONKey("points"))
        self.positivePoints = try container.decode(Int.self, forKey: JSONKey("positivePoints"))
        self.selfStudyRoomName = try container.decode(String.self, forKey: JSONKey("selfStudyRoomName"))
        self.studentAvatar = try container.decode(String.self, forKey: JSONKey("studentAvatar"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["className", "conductPoints", "countNum", "diaryEntryStatistics", "diaryIds", "dormitoryName", "gender", "house", "housePoints", "icons", "modifyTime", "negativePoints", "notePoints", "points", "positivePoints", "selfStudyRoomName", "studentAvatar", "studentId", "studentName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("conductPoints") { try container.encode(self.conductPoints, forKey: JSONKey("conductPoints")) }
        if presentFields.contains("countNum") { try container.encode(self.countNum, forKey: JSONKey("countNum")) }
        if presentFields.contains("diaryEntryStatistics") { try container.encode(self.diaryEntryStatistics, forKey: JSONKey("diaryEntryStatistics")) }
        if presentFields.contains("diaryIds") { try container.encode(self.diaryIds, forKey: JSONKey("diaryIds")) }
        if presentFields.contains("dormitoryName") { try container.encode(self.dormitoryName, forKey: JSONKey("dormitoryName")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("house") { try container.encode(self.house, forKey: JSONKey("house")) }
        if presentFields.contains("housePoints") { try container.encode(self.housePoints, forKey: JSONKey("housePoints")) }
        if presentFields.contains("icons") { try container.encode(self.icons, forKey: JSONKey("icons")) }
        if presentFields.contains("modifyTime") { try container.encode(self.modifyTime, forKey: JSONKey("modifyTime")) }
        if presentFields.contains("negativePoints") { try container.encode(self.negativePoints, forKey: JSONKey("negativePoints")) }
        if presentFields.contains("notePoints") { try container.encode(self.notePoints, forKey: JSONKey("notePoints")) }
        if presentFields.contains("points") { try container.encode(self.points, forKey: JSONKey("points")) }
        if presentFields.contains("positivePoints") { try container.encode(self.positivePoints, forKey: JSONKey("positivePoints")) }
        if presentFields.contains("selfStudyRoomName") { try container.encode(self.selfStudyRoomName, forKey: JSONKey("selfStudyRoomName")) }
        if presentFields.contains("studentAvatar") { try container.encode(self.studentAvatar, forKey: JSONKey("studentAvatar")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDiaryEntriesGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherDiaryEntriesGETResponseItemsItem]
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
        self.items = try container.decode([TeacherDiaryEntriesGETResponseItemsItem].self, forKey: JSONKey("items"))
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
