import Foundation

public struct TeacherAttendanceStatisticHouseGETResponseKindsItem: CapturedResponse {
    /// 业务名称缩写。
    public let abbr: String
    /// 是否计为出席。
    public let attend: Bool
    /// 考勤状态所属种类标识。
    public let attendanceKindId: Int
    /// 考勤状态字典记录标识。
    public let attendanceStatusId: Int
    /// 显示颜色。
    public let color: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 业务实体或选项名称。
    public let name: String
    /// 此状态或操作的权限标记。
    public let permissions: Bool
    /// 是否允许前端显示该选项。
    public let show: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: Bool
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.abbr = try container.decode(String.self, forKey: JSONKey("abbr"))
        self.attend = try container.decode(Bool.self, forKey: JSONKey("attend"))
        self.attendanceKindId = try container.decode(Int.self, forKey: JSONKey("attendanceKindId"))
        self.attendanceStatusId = try container.decode(Int.self, forKey: JSONKey("attendanceStatusId"))
        self.color = try container.decode(String.self, forKey: JSONKey("color"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.permissions = try container.decode(Bool.self, forKey: JSONKey("permissions"))
        self.show = try container.decode(Bool.self, forKey: JSONKey("show"))
        self.status = try container.decode(Bool.self, forKey: JSONKey("status"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["abbr", "attend", "attendanceKindId", "attendanceStatusId", "color", "enName", "name", "permissions", "show", "status", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("abbr") { try container.encode(self.abbr, forKey: JSONKey("abbr")) }
        if presentFields.contains("attend") { try container.encode(self.attend, forKey: JSONKey("attend")) }
        if presentFields.contains("attendanceKindId") { try container.encode(self.attendanceKindId, forKey: JSONKey("attendanceKindId")) }
        if presentFields.contains("attendanceStatusId") { try container.encode(self.attendanceStatusId, forKey: JSONKey("attendanceStatusId")) }
        if presentFields.contains("color") { try container.encode(self.color, forKey: JSONKey("color")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("permissions") { try container.encode(self.permissions, forKey: JSONKey("permissions")) }
        if presentFields.contains("show") { try container.encode(self.show, forKey: JSONKey("show")) }
        if presentFields.contains("status") { try container.encode(self.status, forKey: JSONKey("status")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticHouseGETResponseStatisticsItemStatisticDetailItem: CapturedResponse {
    /// 当前状态或维度的记录数量。
    public let count: Int
    /// 服务器返回的统计比率；刻度由业务规则决定，不自动换算。
    public let rate: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.count = try container.decode(Int.self, forKey: JSONKey("count"))
        self.rate = try container.decode(Double.self, forKey: JSONKey("rate"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["count", "rate"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("count") { try container.encode(self.count, forKey: JSONKey("count")) }
        if presentFields.contains("rate") { try container.encode(self.rate, forKey: JSONKey("rate")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticHouseGETResponseStatisticsItem: CapturedResponse {
    /// 统计范围内总记录数量。
    public let allNums: Int
    /// 统计范围内出勤记录数量。
    public let attendantNums: Int
    /// 出勤比率，按服务器统计规则解释。
    public let attendantRate: Double
    /// 统计维度中文名称。
    public let dimension: String
    /// 统计维度英文名称。
    public let enDimension: String
    /// 当前业务实体标识；允许为空或缺失。
    public let id: Int?
    /// 此维度的完整统计明细。
    public let statisticDetail: [String: TeacherAttendanceStatisticHouseGETResponseStatisticsItemStatisticDetailItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.allNums = try container.decode(Int.self, forKey: JSONKey("allNums"))
        self.attendantNums = try container.decode(Int.self, forKey: JSONKey("attendantNums"))
        self.attendantRate = try container.decode(Double.self, forKey: JSONKey("attendantRate"))
        self.dimension = try container.decode(String.self, forKey: JSONKey("dimension"))
        self.enDimension = try container.decode(String.self, forKey: JSONKey("enDimension"))
        self.id = try container.decodeIfPresent(Int.self, forKey: JSONKey("id"))
        self.statisticDetail = try container.decode([String: TeacherAttendanceStatisticHouseGETResponseStatisticsItemStatisticDetailItem].self, forKey: JSONKey("statisticDetail"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["allNums", "attendantNums", "attendantRate", "dimension", "enDimension", "id", "statisticDetail"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("allNums") { try container.encode(self.allNums, forKey: JSONKey("allNums")) }
        if presentFields.contains("attendantNums") { try container.encode(self.attendantNums, forKey: JSONKey("attendantNums")) }
        if presentFields.contains("attendantRate") { try container.encode(self.attendantRate, forKey: JSONKey("attendantRate")) }
        if presentFields.contains("dimension") { try container.encode(self.dimension, forKey: JSONKey("dimension")) }
        if presentFields.contains("enDimension") { try container.encode(self.enDimension, forKey: JSONKey("enDimension")) }
        if presentFields.contains("id") { try container.encode(self.id, forKey: JSONKey("id")) }
        if presentFields.contains("statisticDetail") { try container.encode(self.statisticDetail, forKey: JSONKey("statisticDetail")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherAttendanceStatisticHouseGETResponse: CapturedResponse {
    /// 统计使用的考勤状态字典。
    public let kinds: [TeacherAttendanceStatisticHouseGETResponseKindsItem]
    /// 按业务维度聚合的统计。
    public let statistics: [TeacherAttendanceStatisticHouseGETResponseStatisticsItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.kinds = try container.decode([TeacherAttendanceStatisticHouseGETResponseKindsItem].self, forKey: JSONKey("kinds"))
        self.statistics = try container.decode([TeacherAttendanceStatisticHouseGETResponseStatisticsItem].self, forKey: JSONKey("statistics"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["kinds", "statistics"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("kinds") { try container.encode(self.kinds, forKey: JSONKey("kinds")) }
        if presentFields.contains("statistics") { try container.encode(self.statistics, forKey: JSONKey("statistics")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
