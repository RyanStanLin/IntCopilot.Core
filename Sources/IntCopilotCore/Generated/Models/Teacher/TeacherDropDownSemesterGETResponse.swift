import Foundation

public struct TeacherDropDownSemesterGETResponseItem: CapturedResponse {
    /// 结束时刻，Unix 毫秒或端点定义的课节时间。
    public let endTime: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 学年标识，来自当前学年或学年选项。
    public let schoolYearId: Int
    /// 学年显示名称。
    public let schoolYearName: String
    /// 学期标识，来自学期选项。
    public let semesterId: Int
    /// 服务端 semesterType 字段；完整业务含义尚未确认，保留其完整结构。
    public let semesterType: SemanticValue
    /// 开始时刻，Unix 毫秒或端点定义的课节时间。
    public let startTime: Int
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.endTime = try container.decode(Int.self, forKey: JSONKey("endTime"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.schoolYearId = try container.decode(Int.self, forKey: JSONKey("schoolYearId"))
        self.schoolYearName = try container.decode(String.self, forKey: JSONKey("schoolYearName"))
        self.semesterId = try container.decode(Int.self, forKey: JSONKey("semesterId"))
        self.semesterType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("semesterType")), domain: "semesterType", decoder: decoder)
        self.startTime = try container.decode(Int.self, forKey: JSONKey("startTime"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "semesterStatus", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["endTime", "name", "schoolYearId", "schoolYearName", "semesterId", "semesterType", "startTime", "status"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("endTime") { try container.encode(self.endTime, forKey: JSONKey("endTime")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("schoolYearId") { try container.encode(self.schoolYearId, forKey: JSONKey("schoolYearId")) }
        if presentFields.contains("schoolYearName") { try container.encode(self.schoolYearName, forKey: JSONKey("schoolYearName")) }
        if presentFields.contains("semesterId") { try container.encode(self.semesterId, forKey: JSONKey("semesterId")) }
        if presentFields.contains("semesterType") { try container.encode(self.semesterType.rawValue, forKey: JSONKey("semesterType")) }
        if presentFields.contains("startTime") { try container.encode(self.startTime, forKey: JSONKey("startTime")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownSemesterGETResponse = [TeacherDropDownSemesterGETResponseItem]
