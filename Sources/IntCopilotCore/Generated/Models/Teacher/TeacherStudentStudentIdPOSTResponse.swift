import Foundation

public struct TeacherStudentStudentIdPOSTResponseItem: CapturedResponse {
    /// 是否属于当前教师负责学生。
    public let myStudent: Bool
    /// 家长邮箱列表。
    public let parentsEmail: [String]
    /// 学生邮箱。
    public let studentEmail: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.myStudent = try container.decode(Bool.self, forKey: JSONKey("myStudent"))
        self.parentsEmail = try container.decode([String].self, forKey: JSONKey("parentsEmail"))
        self.studentEmail = try container.decode(String.self, forKey: JSONKey("studentEmail"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["myStudent", "parentsEmail", "studentEmail", "studentId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("myStudent") { try container.encode(self.myStudent, forKey: JSONKey("myStudent")) }
        if presentFields.contains("parentsEmail") { try container.encode(self.parentsEmail, forKey: JSONKey("parentsEmail")) }
        if presentFields.contains("studentEmail") { try container.encode(self.studentEmail, forKey: JSONKey("studentEmail")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherStudentStudentIdPOSTResponse = [TeacherStudentStudentIdPOSTResponseItem]
