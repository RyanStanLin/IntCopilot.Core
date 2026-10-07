import Foundation

public struct TeacherLoginSwitchTokenGETResponseSchoolsItem: CapturedResponse {
    /// 联系地址。
    public let address: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 学校公开标志资源地址。
    public let logoUrl: String
    /// 业务实体或选项名称。
    public let name: String
    /// 学校标识，来自认证学校列表。
    public let schoolId: Int
    /// 学校或机构简称。
    public let shortName: String
    /// 联系电话。
    public let tel: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.address = try container.decode(String.self, forKey: JSONKey("address"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.logoUrl = try container.decode(String.self, forKey: JSONKey("logoUrl"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.schoolId = try container.decode(Int.self, forKey: JSONKey("schoolId"))
        self.shortName = try container.decode(String.self, forKey: JSONKey("shortName"))
        self.tel = try container.decode(String.self, forKey: JSONKey("tel"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["address", "enName", "logoUrl", "name", "schoolId", "shortName", "tel"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("address") { try container.encode(self.address, forKey: JSONKey("address")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("logoUrl") { try container.encode(self.logoUrl, forKey: JSONKey("logoUrl")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("schoolId") { try container.encode(self.schoolId, forKey: JSONKey("schoolId")) }
        if presentFields.contains("shortName") { try container.encode(self.shortName, forKey: JSONKey("shortName")) }
        if presentFields.contains("tel") { try container.encode(self.tel, forKey: JSONKey("tel")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherLoginSwitchTokenGETResponse: CapturedResponse {
    /// CCA 教师权限。
    public let ccaCourseTeacher: Bool
    /// 主班教师权限。
    public let classTeacher: Bool
    /// 课程管理权限。
    public let courseManager: Bool
    /// 课程教师权限。
    public let courseTeacher: Bool
    /// 学院小组教师权限。
    public let houseGroupTeacher: Bool
    /// 学院教师权限。
    public let houseTeacher: Bool
    /// 业务结果说明。
    public let msg: String
    /// 业务结果代码，与 HTTP 状态码独立；允许为空或缺失。
    public let resCode: JSONValue?
    /// 可访问学校列表。
    public let schools: [TeacherLoginSwitchTokenGETResponseSchoolsItem]
    /// 年段教师权限。
    public let sectionTeacher: Bool
    /// 本次认证或业务操作是否成功。
    public let success: Bool
    /// 平台会话 Token，敏感认证材料，不应记录。
    public let token: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.ccaCourseTeacher = try container.decode(Bool.self, forKey: JSONKey("ccaCourseTeacher"))
        self.classTeacher = try container.decode(Bool.self, forKey: JSONKey("classTeacher"))
        self.courseManager = try container.decode(Bool.self, forKey: JSONKey("courseManager"))
        self.courseTeacher = try container.decode(Bool.self, forKey: JSONKey("courseTeacher"))
        self.houseGroupTeacher = try container.decode(Bool.self, forKey: JSONKey("houseGroupTeacher"))
        self.houseTeacher = try container.decode(Bool.self, forKey: JSONKey("houseTeacher"))
        self.msg = try container.decode(String.self, forKey: JSONKey("msg"))
        self.resCode = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("resCode"))
        self.schools = try container.decode([TeacherLoginSwitchTokenGETResponseSchoolsItem].self, forKey: JSONKey("schools"))
        self.sectionTeacher = try container.decode(Bool.self, forKey: JSONKey("sectionTeacher"))
        self.success = try container.decode(Bool.self, forKey: JSONKey("success"))
        self.token = try container.decode(String.self, forKey: JSONKey("token"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["ccaCourseTeacher", "classTeacher", "courseManager", "courseTeacher", "houseGroupTeacher", "houseTeacher", "msg", "resCode", "schools", "sectionTeacher", "success", "token"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("ccaCourseTeacher") { try container.encode(self.ccaCourseTeacher, forKey: JSONKey("ccaCourseTeacher")) }
        if presentFields.contains("classTeacher") { try container.encode(self.classTeacher, forKey: JSONKey("classTeacher")) }
        if presentFields.contains("courseManager") { try container.encode(self.courseManager, forKey: JSONKey("courseManager")) }
        if presentFields.contains("courseTeacher") { try container.encode(self.courseTeacher, forKey: JSONKey("courseTeacher")) }
        if presentFields.contains("houseGroupTeacher") { try container.encode(self.houseGroupTeacher, forKey: JSONKey("houseGroupTeacher")) }
        if presentFields.contains("houseTeacher") { try container.encode(self.houseTeacher, forKey: JSONKey("houseTeacher")) }
        if presentFields.contains("msg") { try container.encode(self.msg, forKey: JSONKey("msg")) }
        if presentFields.contains("resCode") { try container.encode(self.resCode, forKey: JSONKey("resCode")) }
        if presentFields.contains("schools") { try container.encode(self.schools, forKey: JSONKey("schools")) }
        if presentFields.contains("sectionTeacher") { try container.encode(self.sectionTeacher, forKey: JSONKey("sectionTeacher")) }
        if presentFields.contains("success") { try container.encode(self.success, forKey: JSONKey("success")) }
        if presentFields.contains("token") { try container.encode(self.token, forKey: JSONKey("token")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
