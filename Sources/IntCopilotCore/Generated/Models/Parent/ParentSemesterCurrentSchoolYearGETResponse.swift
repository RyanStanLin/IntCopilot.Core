import Foundation

public struct ParentSemesterCurrentSchoolYearGETResponse: CapturedResponse {
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 学年标识，来自当前学年或学年选项。
    public let schoolYearId: Int
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.schoolYearId = try container.decode(Int.self, forKey: JSONKey("schoolYearId"))
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["endTime", "name", "schoolYearId", "startTime"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("schoolYearId") { try container.encode(self.schoolYearId, forKey: JSONKey("schoolYearId")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
