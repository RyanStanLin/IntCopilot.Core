import Foundation

public struct SchoolDateRange: Sendable {
    /// 查询开始时刻，调用时编码为 Unix 毫秒。
    public let start: Date
    /// 查询结束时刻，调用时编码为 Unix 毫秒。
    public let end: Date
    public init(start: Date, end: Date) { self.start = start; self.end = end }
    func query() throws -> [String: APIParameter] {
        guard start <= end else { throw APIError.invalidParameter("结束时间早于开始时间") }
        return ["start":.date(start),"end":.date(end)]
    }
    public static func schoolWeek(containing date: Date, timeZone: TimeZone = TimeZone(identifier: "Asia/Shanghai")!) -> SchoolDateRange {
        var calendar = Calendar(identifier: .iso8601); calendar.timeZone = timeZone; calendar.firstWeekday = 2
        guard let interval = calendar.dateInterval(of: .weekOfYear, for: date) else { return SchoolDateRange(start: date, end: date) }
        return SchoolDateRange(start: interval.start, end: interval.end.addingTimeInterval(-0.001))
    }
}

public enum CourseKind: String, Codable, Sendable {
    case regular = "1001", cca = "1002"
    public var option: SemanticOption { SemanticOption(rawValue: .string(rawValue), name: self == .regular ? "常规课程" : "延展课程", enName: self == .regular ? "Course" : "CCA", domain: "courseType") }
}

public struct Course: Sendable, Identifiable {
    /// 此课程引用所属学校。
    public let schoolID: SchoolID
    /// 课程标识，来自课程级联或关联课程列表。
    public let id: CourseID
    /// 完整课程显示名称。
    public let name: String
    /// 完整上游课程记录，包括级联元数据。
    public let record: JSONValue
    init(record: JSONValue, schoolID: SchoolID) throws {
        guard let id = record["courseId"]?.stringValue ?? record["key"]?.stringValue else { throw APIError.invalidResponse("课程缺少标识") }
        self.schoolID = schoolID; self.id = CourseID(id)
        name = record["description"]?.stringValue ?? record["value"]?.stringValue ?? record["name"]?.stringValue ?? "未提供课程名称"
        self.record = record
    }
}

func flattenOptions(_ value: JSONValue) -> [JSONValue] {
    if let array = value.arrayValue { return array.flatMap(flattenOptions) }
    if let children = value["subOptions"]?.arrayValue, !children.isEmpty { return children.flatMap(flattenOptions) }
    return value.objectValue == nil ? [] : [value]
}
