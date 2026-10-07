import Foundation

public struct ParentCalendarByMonthGETResponseCalendarDaysItem: CapturedResponse {
    /// 业务日期，日期型端点使用 Unix 毫秒。
    public let date: Int
    /// 业务说明或富文本内容。
    public let description: String
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.date = try container.decode(Int.self, forKey: JSONKey("date"))
        self.description = try container.decode(String.self, forKey: JSONKey("description"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "calendarDayType", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["date", "description", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("date") { try container.encode(self.date, forKey: JSONKey("date")) }
        if presentFields.contains("description") { try container.encode(self.description, forKey: JSONKey("description")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct ParentCalendarByMonthGETResponse: CapturedResponse {
    /// 日历日期配置。
    public let calendarDays: [ParentCalendarByMonthGETResponseCalendarDaysItem]
    /// 日历事件列表。
    public let eventList: [JSONValue]
    /// 第一学期结束日期，Unix 毫秒。
    public let firstSemEndDate: Int
    /// 第一学期开始日期，Unix 毫秒。
    public let firstSemStartDate: Int
    /// 最后关联日期，Unix 毫秒。
    public let lastDate: Int
    /// 第二学期结束日期，Unix 毫秒。
    public let secondSemEndDate: Int
    /// 第二学期开始日期，Unix 毫秒。
    public let secondSemStartDate: Int
    /// 开始日期或时刻，Unix 毫秒。
    public let startDate: Int
    /// 第三学期结束日期，Unix 毫秒；允许为空或缺失。
    public let thirdSemEndDate: JSONValue?
    /// 第三学期开始日期，Unix 毫秒；允许为空或缺失。
    public let thirdSemStartDate: JSONValue?
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.calendarDays = try container.decode([ParentCalendarByMonthGETResponseCalendarDaysItem].self, forKey: JSONKey("calendarDays"))
        self.eventList = try container.decode([JSONValue].self, forKey: JSONKey("eventList"))
        self.firstSemEndDate = try container.decode(Int.self, forKey: JSONKey("firstSemEndDate"))
        self.firstSemStartDate = try container.decode(Int.self, forKey: JSONKey("firstSemStartDate"))
        self.lastDate = try container.decode(Int.self, forKey: JSONKey("lastDate"))
        self.secondSemEndDate = try container.decode(Int.self, forKey: JSONKey("secondSemEndDate"))
        self.secondSemStartDate = try container.decode(Int.self, forKey: JSONKey("secondSemStartDate"))
        self.startDate = try container.decode(Int.self, forKey: JSONKey("startDate"))
        self.thirdSemEndDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("thirdSemEndDate"))
        self.thirdSemStartDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("thirdSemStartDate"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["calendarDays", "eventList", "firstSemEndDate", "firstSemStartDate", "lastDate", "secondSemEndDate", "secondSemStartDate", "startDate", "thirdSemEndDate", "thirdSemStartDate"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("calendarDays") { try container.encode(self.calendarDays, forKey: JSONKey("calendarDays")) }
        if presentFields.contains("eventList") { try container.encode(self.eventList, forKey: JSONKey("eventList")) }
        if presentFields.contains("firstSemEndDate") { try container.encode(self.firstSemEndDate, forKey: JSONKey("firstSemEndDate")) }
        if presentFields.contains("firstSemStartDate") { try container.encode(self.firstSemStartDate, forKey: JSONKey("firstSemStartDate")) }
        if presentFields.contains("lastDate") { try container.encode(self.lastDate, forKey: JSONKey("lastDate")) }
        if presentFields.contains("secondSemEndDate") { try container.encode(self.secondSemEndDate, forKey: JSONKey("secondSemEndDate")) }
        if presentFields.contains("secondSemStartDate") { try container.encode(self.secondSemStartDate, forKey: JSONKey("secondSemStartDate")) }
        if presentFields.contains("startDate") { try container.encode(self.startDate, forKey: JSONKey("startDate")) }
        if presentFields.contains("thirdSemEndDate") { try container.encode(self.thirdSemEndDate, forKey: JSONKey("thirdSemEndDate")) }
        if presentFields.contains("thirdSemStartDate") { try container.encode(self.thirdSemStartDate, forKey: JSONKey("thirdSemStartDate")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
