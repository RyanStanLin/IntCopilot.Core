import Foundation

public struct TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemAttainment: CapturedResponse {
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "unconfirmed:/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}:type", decoder: decoder)
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["key", "type", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemEffort: CapturedResponse {
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 本业务域类型；不能跨业务域套用代码表。
    public let type: SemanticValue
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.type = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("type")), domain: "unconfirmed:/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}:type", decoder: decoder)
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["key", "type", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("type") { try container.encode(self.type.rawValue, forKey: JSONKey("type")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItem: CapturedResponse {
    /// 学业达成等级或等级对象。
    public let attainment: TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemAttainment
    /// 评语或备注内容。
    public let comments: String
    /// 努力程度等级或等级对象。
    public let effort: TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemEffort
    /// 考试百分制成绩；允许为空或缺失。
    public let examPercentage: JSONValue?
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生显示姓名。
    public let studentName: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attainment = try container.decode(TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemAttainment.self, forKey: JSONKey("attainment"))
        self.comments = try container.decode(String.self, forKey: JSONKey("comments"))
        self.effort = try container.decode(TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemEffort.self, forKey: JSONKey("effort"))
        self.examPercentage = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("examPercentage"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentName = try container.decode(String.self, forKey: JSONKey("studentName"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attainment", "comments", "effort", "examPercentage", "studentId", "studentName", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attainment") { try container.encode(self.attainment, forKey: JSONKey("attainment")) }
        if presentFields.contains("comments") { try container.encode(self.comments, forKey: JSONKey("comments")) }
        if presentFields.contains("effort") { try container.encode(self.effort, forKey: JSONKey("effort")) }
        if presentFields.contains("examPercentage") { try container.encode(self.examPercentage, forKey: JSONKey("examPercentage")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentName") { try container.encode(self.studentName, forKey: JSONKey("studentName")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponse = [TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItem]
