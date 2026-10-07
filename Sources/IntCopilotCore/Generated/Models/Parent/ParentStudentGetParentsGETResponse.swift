import Foundation

public struct ParentStudentGetParentsGETResponseItem: CapturedResponse {
    /// 电话国家或地区区号。
    public let areaCode: String
    /// 国家中文名称。
    public let countryName: String
    /// 邮箱地址。
    public let email: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 是否主要联系人。
    public let isMajor: Bool
    /// 是否关联教师身份。
    public let isTeacher: Bool
    /// 手机号码，不包含国家区号。
    public let mobile: String
    /// 业务实体或选项名称。
    public let name: String
    /// 外部账号关联标识，敏感资料。
    public let openId: String
    /// 家长标识。
    public let parentId: Int
    /// 家长或成员职位。
    public let position: String
    /// 家长与学生的关系。
    public let relationship: SemanticValue
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: Bool
    /// 教师英文显示名称。
    public let teacherEnName: String
    /// 教师显示名称。
    public let teacherName: String
    /// 家长或成员工作单位。
    public let workUnit: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.areaCode = try container.decode(String.self, forKey: JSONKey("areaCode"))
        self.countryName = try container.decode(String.self, forKey: JSONKey("countryName"))
        self.email = try container.decode(String.self, forKey: JSONKey("email"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.isMajor = try container.decode(Bool.self, forKey: JSONKey("isMajor"))
        self.isTeacher = try container.decode(Bool.self, forKey: JSONKey("isTeacher"))
        self.mobile = try container.decode(String.self, forKey: JSONKey("mobile"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.openId = try container.decode(String.self, forKey: JSONKey("openId"))
        self.parentId = try container.decode(Int.self, forKey: JSONKey("parentId"))
        self.position = try container.decode(String.self, forKey: JSONKey("position"))
        self.relationship = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("relationship")), domain: "relationship", decoder: decoder)
        self.status = try container.decode(Bool.self, forKey: JSONKey("status"))
        self.teacherEnName = try container.decode(String.self, forKey: JSONKey("teacherEnName"))
        self.teacherName = try container.decode(String.self, forKey: JSONKey("teacherName"))
        self.workUnit = try container.decode(String.self, forKey: JSONKey("workUnit"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["areaCode", "countryName", "email", "enName", "isMajor", "isTeacher", "mobile", "name", "openId", "parentId", "position", "relationship", "status", "teacherEnName", "teacherName", "workUnit"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("areaCode") { try container.encode(self.areaCode, forKey: JSONKey("areaCode")) }
        if presentFields.contains("countryName") { try container.encode(self.countryName, forKey: JSONKey("countryName")) }
        if presentFields.contains("email") { try container.encode(self.email, forKey: JSONKey("email")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("isMajor") { try container.encode(self.isMajor, forKey: JSONKey("isMajor")) }
        if presentFields.contains("isTeacher") { try container.encode(self.isTeacher, forKey: JSONKey("isTeacher")) }
        if presentFields.contains("mobile") { try container.encode(self.mobile, forKey: JSONKey("mobile")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("openId") { try container.encode(self.openId, forKey: JSONKey("openId")) }
        if presentFields.contains("parentId") { try container.encode(self.parentId, forKey: JSONKey("parentId")) }
        if presentFields.contains("position") { try container.encode(self.position, forKey: JSONKey("position")) }
        if presentFields.contains("relationship") { try container.encode(self.relationship.rawValue, forKey: JSONKey("relationship")) }
        if presentFields.contains("status") { try container.encode(self.status, forKey: JSONKey("status")) }
        if presentFields.contains("teacherEnName") { try container.encode(self.teacherEnName, forKey: JSONKey("teacherEnName")) }
        if presentFields.contains("teacherName") { try container.encode(self.teacherName, forKey: JSONKey("teacherName")) }
        if presentFields.contains("workUnit") { try container.encode(self.workUnit, forKey: JSONKey("workUnit")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias ParentStudentGetParentsGETResponse = [ParentStudentGetParentsGETResponseItem]
