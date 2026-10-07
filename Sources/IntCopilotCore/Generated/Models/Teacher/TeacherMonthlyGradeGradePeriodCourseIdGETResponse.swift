import Foundation

public struct TeacherMonthlyGradeGradePeriodCourseIdGETResponseItemExtraValue: CapturedResponse {
    /// 学业达成等级或等级对象。
    public let attainment: Bool
    /// 课程教师权限。
    public let courseTeacher: Bool
    /// 副负责人完整资料或周期是否启用副负责人评语。
    public let deputyHead: Bool
    /// 努力程度等级或等级对象。
    public let effort: Bool
    /// 成绩周期的考试百分比项目配置。
    public let ep: Bool
    /// 成绩周期的学院或行为积分项目配置。
    public let hc: Bool
    /// 主班教师信息或启用标记。
    public let headTeacher: Bool
    /// 此周期是否已发布报告。
    public let reported: Bool
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 辅导师显示信息。
    public let tutor: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.attainment = try container.decode(Bool.self, forKey: JSONKey("attainment"))
        self.courseTeacher = try container.decode(Bool.self, forKey: JSONKey("courseTeacher"))
        self.deputyHead = try container.decode(Bool.self, forKey: JSONKey("deputyHead"))
        self.effort = try container.decode(Bool.self, forKey: JSONKey("effort"))
        self.ep = try container.decode(Bool.self, forKey: JSONKey("ep"))
        self.hc = try container.decode(Bool.self, forKey: JSONKey("hc"))
        self.headTeacher = try container.decode(Bool.self, forKey: JSONKey("headTeacher"))
        self.reported = try container.decode(Bool.self, forKey: JSONKey("reported"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "unconfirmed:/api/monthly-grade/grade-period/{courseId}:status", decoder: decoder)
        self.tutor = try container.decode(Bool.self, forKey: JSONKey("tutor"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["attainment", "courseTeacher", "deputyHead", "effort", "ep", "hc", "headTeacher", "reported", "status", "tutor"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("attainment") { try container.encode(self.attainment, forKey: JSONKey("attainment")) }
        if presentFields.contains("courseTeacher") { try container.encode(self.courseTeacher, forKey: JSONKey("courseTeacher")) }
        if presentFields.contains("deputyHead") { try container.encode(self.deputyHead, forKey: JSONKey("deputyHead")) }
        if presentFields.contains("effort") { try container.encode(self.effort, forKey: JSONKey("effort")) }
        if presentFields.contains("ep") { try container.encode(self.ep, forKey: JSONKey("ep")) }
        if presentFields.contains("hc") { try container.encode(self.hc, forKey: JSONKey("hc")) }
        if presentFields.contains("headTeacher") { try container.encode(self.headTeacher, forKey: JSONKey("headTeacher")) }
        if presentFields.contains("reported") { try container.encode(self.reported, forKey: JSONKey("reported")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("tutor") { try container.encode(self.tutor, forKey: JSONKey("tutor")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherMonthlyGradeGradePeriodCourseIdGETResponseItem: CapturedResponse {
    /// 选项的英文显示文本。
    public let enValue: String
    /// 选项附加元数据，类型随业务域变化。
    public let extraValue: TeacherMonthlyGradeGradePeriodCourseIdGETResponseItemExtraValue
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.enValue = try container.decode(String.self, forKey: JSONKey("enValue"))
        self.extraValue = try container.decode(TeacherMonthlyGradeGradePeriodCourseIdGETResponseItemExtraValue.self, forKey: JSONKey("extraValue"))
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["enValue", "extraValue", "key", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("enValue") { try container.encode(self.enValue, forKey: JSONKey("enValue")) }
        if presentFields.contains("extraValue") { try container.encode(self.extraValue, forKey: JSONKey("extraValue")) }
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherMonthlyGradeGradePeriodCourseIdGETResponse = [TeacherMonthlyGradeGradePeriodCourseIdGETResponseItem]
