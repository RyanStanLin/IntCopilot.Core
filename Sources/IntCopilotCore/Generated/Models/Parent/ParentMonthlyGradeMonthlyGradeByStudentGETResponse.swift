import Foundation

public struct ParentMonthlyGradeMonthlyGradeByStudentGETResponseItem: CapturedResponse {
    /// 英文名称，可能为空。
    public let enName: String
    /// 成绩周期标识，来自报告周期选项。
    public let gradePeriodId: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 报告请求地址或路径。
    public let requestUrl: String
    /// 所属学年显示文本或选项对象。
    public let schoolYear: String
    /// 学生标识，来自学生列表或课程学生名单；允许为空或缺失。
    public let studentId: JSONValue?
    /// 报告模板标识。
    public let templateId: Int
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.gradePeriodId = try container.decode(Int.self, forKey: JSONKey("gradePeriodId"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.requestUrl = try container.decode(String.self, forKey: JSONKey("requestUrl"))
        self.schoolYear = try container.decode(String.self, forKey: JSONKey("schoolYear"))
        self.studentId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("studentId"))
        self.templateId = try container.decode(Int.self, forKey: JSONKey("templateId"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "unconfirmed:/api/monthly-grade/monthly-grade/by-student:type", decoder: decoder)
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["enName", "gradePeriodId", "name", "requestUrl", "schoolYear", "studentId", "templateId", "type"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("gradePeriodId") { try container.encode(self.gradePeriodId, forKey: JSONKey("gradePeriodId")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("requestUrl") { try container.encode(self.requestUrl, forKey: JSONKey("requestUrl")) }
        if presentFields.contains("schoolYear") { try container.encode(self.schoolYear, forKey: JSONKey("schoolYear")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("templateId") { try container.encode(self.templateId, forKey: JSONKey("templateId")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias ParentMonthlyGradeMonthlyGradeByStudentGETResponse = [ParentMonthlyGradeMonthlyGradeByStudentGETResponseItem]
