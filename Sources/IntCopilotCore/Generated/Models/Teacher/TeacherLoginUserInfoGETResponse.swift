import Foundation

public struct TeacherLoginUserInfoGETResponseDataPermission: CapturedResponse {
    /// CCA 教师权限。
    public let ccaCourseTeacher: Bool
    /// 课节考勤摘要。
    public let classAtten: Bool
    /// 主班教师权限。
    public let classTeacher: Bool
    /// 课程管理权限。
    public let courseManager: Bool
    /// 课程教师权限。
    public let courseTeacher: Bool
    /// 副负责人完整资料或周期是否启用副负责人评语。
    public let deputyHead: Bool
    /// 完整宿舍对象或宿舍名称。
    public let dormitory: Bool
    /// 高中延展课程教师权限，保留服务端拼写。
    public let higSchoolCcaTeacher: Bool
    /// 学院小组教师权限。
    public let houseGroupTeacher: Bool
    /// 学院教师权限。
    public let houseTeacher: Bool
    /// 年段教师权限。
    public let sectionTeacher: Bool
    /// 完整自习室对象或名称。
    public let selfStudyRoom: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.ccaCourseTeacher = try container.decode(Bool.self, forKey: JSONKey("ccaCourseTeacher"))
        self.classAtten = try container.decode(Bool.self, forKey: JSONKey("classAtten"))
        self.classTeacher = try container.decode(Bool.self, forKey: JSONKey("classTeacher"))
        self.courseManager = try container.decode(Bool.self, forKey: JSONKey("courseManager"))
        self.courseTeacher = try container.decode(Bool.self, forKey: JSONKey("courseTeacher"))
        self.deputyHead = try container.decode(Bool.self, forKey: JSONKey("deputyHead"))
        self.dormitory = try container.decode(Bool.self, forKey: JSONKey("dormitory"))
        self.higSchoolCcaTeacher = try container.decode(Bool.self, forKey: JSONKey("higSchoolCcaTeacher"))
        self.houseGroupTeacher = try container.decode(Bool.self, forKey: JSONKey("houseGroupTeacher"))
        self.houseTeacher = try container.decode(Bool.self, forKey: JSONKey("houseTeacher"))
        self.sectionTeacher = try container.decode(Bool.self, forKey: JSONKey("sectionTeacher"))
        self.selfStudyRoom = try container.decode(Bool.self, forKey: JSONKey("selfStudyRoom"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["ccaCourseTeacher", "classAtten", "classTeacher", "courseManager", "courseTeacher", "deputyHead", "dormitory", "higSchoolCcaTeacher", "houseGroupTeacher", "houseTeacher", "sectionTeacher", "selfStudyRoom"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("ccaCourseTeacher") { try container.encode(self.ccaCourseTeacher, forKey: JSONKey("ccaCourseTeacher")) }
        if presentFields.contains("classAtten") { try container.encode(self.classAtten, forKey: JSONKey("classAtten")) }
        if presentFields.contains("classTeacher") { try container.encode(self.classTeacher, forKey: JSONKey("classTeacher")) }
        if presentFields.contains("courseManager") { try container.encode(self.courseManager, forKey: JSONKey("courseManager")) }
        if presentFields.contains("courseTeacher") { try container.encode(self.courseTeacher, forKey: JSONKey("courseTeacher")) }
        if presentFields.contains("deputyHead") { try container.encode(self.deputyHead, forKey: JSONKey("deputyHead")) }
        if presentFields.contains("dormitory") { try container.encode(self.dormitory, forKey: JSONKey("dormitory")) }
        if presentFields.contains("higSchoolCcaTeacher") { try container.encode(self.higSchoolCcaTeacher, forKey: JSONKey("higSchoolCcaTeacher")) }
        if presentFields.contains("houseGroupTeacher") { try container.encode(self.houseGroupTeacher, forKey: JSONKey("houseGroupTeacher")) }
        if presentFields.contains("houseTeacher") { try container.encode(self.houseTeacher, forKey: JSONKey("houseTeacher")) }
        if presentFields.contains("sectionTeacher") { try container.encode(self.sectionTeacher, forKey: JSONKey("sectionTeacher")) }
        if presentFields.contains("selfStudyRoom") { try container.encode(self.selfStudyRoom, forKey: JSONKey("selfStudyRoom")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherLoginUserInfoGETResponse: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 当前用户的数据权限集合。
    public let dataPermission: TeacherLoginUserInfoGETResponseDataPermission
    /// 英文名称，可能为空。
    public let enName: String
    /// 是否关联教师身份。
    public let isTeacher: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 教师英文显示名称。
    public let teacherEnName: String
    /// 教师标识，来自用户信息或教师列表。
    public let teacherId: Int
    /// 教师显示名称。
    public let teacherName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.dataPermission = try container.decode(TeacherLoginUserInfoGETResponseDataPermission.self, forKey: JSONKey("dataPermission"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.isTeacher = try container.decode(Bool.self, forKey: JSONKey("isTeacher"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.teacherEnName = try container.decode(String.self, forKey: JSONKey("teacherEnName"))
        self.teacherId = try container.decode(Int.self, forKey: JSONKey("teacherId"))
        self.teacherName = try container.decode(String.self, forKey: JSONKey("teacherName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "dataPermission", "enName", "isTeacher", "name", "teacherEnName", "teacherId", "teacherName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("dataPermission") { try container.encode(self.dataPermission, forKey: JSONKey("dataPermission")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("isTeacher") { try container.encode(self.isTeacher, forKey: JSONKey("isTeacher")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("teacherEnName") { try container.encode(self.teacherEnName, forKey: JSONKey("teacherEnName")) }
        if presentFields.contains("teacherId") { try container.encode(self.teacherId, forKey: JSONKey("teacherId")) }
        if presentFields.contains("teacherName") { try container.encode(self.teacherName, forKey: JSONKey("teacherName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
