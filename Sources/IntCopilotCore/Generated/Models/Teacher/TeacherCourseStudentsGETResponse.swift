import Foundation

public struct TeacherCourseStudentsGETResponseItemsItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 主班级名称。
    public let className: String
    /// 本业务域代码，需结合该对象的名称解释。
    public let code: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 年级名称或成绩等级，按所在业务解释。
    public let grade: String
    /// 学院名称。
    public let house: String
    /// 完整学院小组或小组显示文本。
    public let houseGroup: String
    /// 医疗说明，属于敏感资料。
    public let medical: String
    /// 是否有医疗提示。
    public let medicalTag: Bool
    /// 授课语言或相关提示文本。
    public let medium: String
    /// 是否有语言提示标记。
    public let mediumTag: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 家长邮箱显示文本。
    public let parentEmail: String
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
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.code = try container.decode(String.self, forKey: JSONKey("code"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.grade = try container.decode(String.self, forKey: JSONKey("grade"))
        self.house = try container.decode(String.self, forKey: JSONKey("house"))
        self.houseGroup = try container.decode(String.self, forKey: JSONKey("houseGroup"))
        self.medical = try container.decode(String.self, forKey: JSONKey("medical"))
        self.medicalTag = try container.decode(Bool.self, forKey: JSONKey("medicalTag"))
        self.medium = try container.decode(String.self, forKey: JSONKey("medium"))
        self.mediumTag = try container.decode(Bool.self, forKey: JSONKey("mediumTag"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.parentEmail = try container.decode(String.self, forKey: JSONKey("parentEmail"))
        self.parentsEmail = try container.decode([String].self, forKey: JSONKey("parentsEmail"))
        self.studentEmail = try container.decode(String.self, forKey: JSONKey("studentEmail"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "className", "code", "gender", "grade", "house", "houseGroup", "medical", "medicalTag", "medium", "mediumTag", "name", "parentEmail", "parentsEmail", "studentEmail", "studentId"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("code") { try container.encode(self.code, forKey: JSONKey("code")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("grade") { try container.encode(self.grade, forKey: JSONKey("grade")) }
        if presentFields.contains("house") { try container.encode(self.house, forKey: JSONKey("house")) }
        if presentFields.contains("houseGroup") { try container.encode(self.houseGroup, forKey: JSONKey("houseGroup")) }
        if presentFields.contains("medical") { try container.encode(self.medical, forKey: JSONKey("medical")) }
        if presentFields.contains("medicalTag") { try container.encode(self.medicalTag, forKey: JSONKey("medicalTag")) }
        if presentFields.contains("medium") { try container.encode(self.medium, forKey: JSONKey("medium")) }
        if presentFields.contains("mediumTag") { try container.encode(self.mediumTag, forKey: JSONKey("mediumTag")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("parentEmail") { try container.encode(self.parentEmail, forKey: JSONKey("parentEmail")) }
        if presentFields.contains("parentsEmail") { try container.encode(self.parentsEmail, forKey: JSONKey("parentsEmail")) }
        if presentFields.contains("studentEmail") { try container.encode(self.studentEmail, forKey: JSONKey("studentEmail")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherCourseStudentsGETResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherCourseStudentsGETResponseItemsItem]
    /// 页码，从 1 开始。
    public let pageCurrent: Int
    /// 分页大小，以记录条数为单位。
    public let pageSize: Int
    /// 满足条件的总记录数。
    public let totalItem: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.items = try container.decode([TeacherCourseStudentsGETResponseItemsItem].self, forKey: JSONKey("items"))
        self.pageCurrent = try container.decode(Int.self, forKey: JSONKey("pageCurrent"))
        self.pageSize = try container.decode(Int.self, forKey: JSONKey("pageSize"))
        self.totalItem = try container.decode(Int.self, forKey: JSONKey("totalItem"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["items", "pageCurrent", "pageSize", "totalItem"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("items") { try container.encode(self.items, forKey: JSONKey("items")) }
        if presentFields.contains("pageCurrent") { try container.encode(self.pageCurrent, forKey: JSONKey("pageCurrent")) }
        if presentFields.contains("pageSize") { try container.encode(self.pageSize, forKey: JSONKey("pageSize")) }
        if presentFields.contains("totalItem") { try container.encode(self.totalItem, forKey: JSONKey("totalItem")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
