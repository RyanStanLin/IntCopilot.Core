import Foundation

public struct TeacherMonthlyGradeTeachingReviewListGETResponseItem: CapturedResponse {
    /// 课程标识或课程引用，来自课程选择或课表。
    public let courseId: Int
    /// 课程名称。
    public let courseName: String
    /// 教学关键词。
    public let keyWords: String
    /// 月度成绩周期标识，来自月度成绩周期列表。
    public let monthlyGradePeriodId: Int
    /// 年级或年段标识，来自年段选项；允许为空或缺失。
    public let sectionId: JSONValue?
    /// 年段名称。
    public let sectionName: String
    /// 学科标识，来自学科选项或课程配置；允许为空或缺失。
    public let subjectId: JSONValue?
    /// 学科名称。
    public let subjectName: String
    /// 关联教师列表。
    public let teachers: String
    /// 教学内容。
    public let teachingContent: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.courseId = try container.decode(Int.self, forKey: JSONKey("courseId"))
        self.courseName = try container.decode(String.self, forKey: JSONKey("courseName"))
        self.keyWords = try container.decode(String.self, forKey: JSONKey("keyWords"))
        self.monthlyGradePeriodId = try container.decode(Int.self, forKey: JSONKey("monthlyGradePeriodId"))
        self.sectionId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("sectionId"))
        self.sectionName = try container.decode(String.self, forKey: JSONKey("sectionName"))
        self.subjectId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("subjectId"))
        self.subjectName = try container.decode(String.self, forKey: JSONKey("subjectName"))
        self.teachers = try container.decode(String.self, forKey: JSONKey("teachers"))
        self.teachingContent = try container.decode(String.self, forKey: JSONKey("teachingContent"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["courseId", "courseName", "keyWords", "monthlyGradePeriodId", "sectionId", "sectionName", "subjectId", "subjectName", "teachers", "teachingContent"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("courseName") { try container.encode(self.courseName, forKey: JSONKey("courseName")) }
        if presentFields.contains("keyWords") { try container.encode(self.keyWords, forKey: JSONKey("keyWords")) }
        if presentFields.contains("monthlyGradePeriodId") { try container.encode(self.monthlyGradePeriodId, forKey: JSONKey("monthlyGradePeriodId")) }
        if presentFields.contains("sectionId") { try container.encode(self.sectionId, forKey: JSONKey("sectionId")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("subjectId") { try container.encode(self.subjectId, forKey: JSONKey("subjectId")) }
        if presentFields.contains("subjectName") { try container.encode(self.subjectName, forKey: JSONKey("subjectName")) }
        if presentFields.contains("teachers") { try container.encode(self.teachers, forKey: JSONKey("teachers")) }
        if presentFields.contains("teachingContent") { try container.encode(self.teachingContent, forKey: JSONKey("teachingContent")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherMonthlyGradeTeachingReviewListGETResponse = [TeacherMonthlyGradeTeachingReviewListGETResponseItem]
