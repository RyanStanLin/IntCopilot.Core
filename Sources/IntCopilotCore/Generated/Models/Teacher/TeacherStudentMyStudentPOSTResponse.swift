import Foundation

public struct TeacherStudentMyStudentPOSTResponseItemsItem: CapturedResponse {
    /// 头像资源地址。
    public let avatarUrl: String
    /// 出生日期，Unix 毫秒。
    public let birthday: Int
    /// 主班级名称。
    public let className: String
    /// 完整宿舍对象或宿舍名称。
    public let dormitory: Bool
    /// 宿舍显示名称。
    public let dormitoryName: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: Int
    /// 名字或拼音名。
    public let firstName: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 毕业时刻，Unix 毫秒；允许为空或缺失。
    public let graduateTime: JSONValue?
    /// 毕业去向文本。
    public let graduateTo: String
    /// 毕业年份。
    public let graduateYear: String
    /// 是否有兄弟姐妹关联。
    public let haveSiblings: Bool
    /// 学院名称。
    public let house: String
    /// 最后参与课程日期，Unix 毫秒；允许为空或缺失。
    public let lastClassDate: JSONValue?
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 医疗说明，属于敏感资料。
    public let medical: String
    /// 是否有医疗提示。
    public let medicalTag: Bool
    /// 授课语言或相关提示文本。
    public let medium: String
    /// 是否有语言提示标记。
    public let mediumTag: Bool
    /// 常用名称。
    public let moniker: String
    /// 是否属于当前教师负责学生。
    public let myStudent: Bool
    /// 业务实体或选项名称。
    public let name: String
    /// 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失。
    public let outDate: JSONValue?
    /// 家长邮箱显示文本。
    public let parentEmail: String
    /// 家长邮箱列表。
    public let parentsEmail: [String]
    /// 本次行为积分；允许为空或缺失。
    public let points: JSONValue?
    /// 学籍说明。
    public let schoolRollNote: String
    /// 学籍状态，具体字典尚未完整确认。
    public let schoolRollStatus: String
    /// 完整年段对象。
    public let section: String
    /// 自习室显示名称。
    public let selfStudyRoomName: String
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 学生邮箱。
    public let studentEmail: String
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 姓氏。
    public let surname: String
    /// 转学目标学校文本。
    public let toSchool: String
    /// 转学原因名称。
    public let transReasonName: String
    /// 转学说明。
    public let transRemark: String
    /// 中文显示名称。
    public let zhName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.birthday = try container.decode(Int.self, forKey: JSONKey("birthday"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.dormitory = try container.decode(Bool.self, forKey: JSONKey("dormitory"))
        self.dormitoryName = try container.decode(String.self, forKey: JSONKey("dormitoryName"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(Int.self, forKey: JSONKey("enterDate"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.graduateTime = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("graduateTime"))
        self.graduateTo = try container.decode(String.self, forKey: JSONKey("graduateTo"))
        self.graduateYear = try container.decode(String.self, forKey: JSONKey("graduateYear"))
        self.haveSiblings = try container.decode(Bool.self, forKey: JSONKey("haveSiblings"))
        self.house = try container.decode(String.self, forKey: JSONKey("house"))
        self.lastClassDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("lastClassDate"))
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.medical = try container.decode(String.self, forKey: JSONKey("medical"))
        self.medicalTag = try container.decode(Bool.self, forKey: JSONKey("medicalTag"))
        self.medium = try container.decode(String.self, forKey: JSONKey("medium"))
        self.mediumTag = try container.decode(Bool.self, forKey: JSONKey("mediumTag"))
        self.moniker = try container.decode(String.self, forKey: JSONKey("moniker"))
        self.myStudent = try container.decode(Bool.self, forKey: JSONKey("myStudent"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.outDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("outDate"))
        self.parentEmail = try container.decode(String.self, forKey: JSONKey("parentEmail"))
        self.parentsEmail = try container.decode([String].self, forKey: JSONKey("parentsEmail"))
        self.points = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("points"))
        self.schoolRollNote = try container.decode(String.self, forKey: JSONKey("schoolRollNote"))
        self.schoolRollStatus = try container.decode(String.self, forKey: JSONKey("schoolRollStatus"))
        self.section = try container.decode(String.self, forKey: JSONKey("section"))
        self.selfStudyRoomName = try container.decode(String.self, forKey: JSONKey("selfStudyRoomName"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        self.studentEmail = try container.decode(String.self, forKey: JSONKey("studentEmail"))
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        self.surname = try container.decode(String.self, forKey: JSONKey("surname"))
        self.toSchool = try container.decode(String.self, forKey: JSONKey("toSchool"))
        self.transReasonName = try container.decode(String.self, forKey: JSONKey("transReasonName"))
        self.transRemark = try container.decode(String.self, forKey: JSONKey("transRemark"))
        self.zhName = try container.decode(String.self, forKey: JSONKey("zhName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avatarUrl", "birthday", "className", "dormitory", "dormitoryName", "enName", "enterDate", "firstName", "gender", "graduateTime", "graduateTo", "graduateYear", "haveSiblings", "house", "lastClassDate", "lastName", "medical", "medicalTag", "medium", "mediumTag", "moniker", "myStudent", "name", "outDate", "parentEmail", "parentsEmail", "points", "schoolRollNote", "schoolRollStatus", "section", "selfStudyRoomName", "status", "studentEmail", "studentId", "studentNum", "surname", "toSchool", "transReasonName", "transRemark", "zhName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("birthday") { try container.encode(self.birthday, forKey: JSONKey("birthday")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("dormitory") { try container.encode(self.dormitory, forKey: JSONKey("dormitory")) }
        if presentFields.contains("dormitoryName") { try container.encode(self.dormitoryName, forKey: JSONKey("dormitoryName")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("graduateTime") { try container.encode(self.graduateTime, forKey: JSONKey("graduateTime")) }
        if presentFields.contains("graduateTo") { try container.encode(self.graduateTo, forKey: JSONKey("graduateTo")) }
        if presentFields.contains("graduateYear") { try container.encode(self.graduateYear, forKey: JSONKey("graduateYear")) }
        if presentFields.contains("haveSiblings") { try container.encode(self.haveSiblings, forKey: JSONKey("haveSiblings")) }
        if presentFields.contains("house") { try container.encode(self.house, forKey: JSONKey("house")) }
        if presentFields.contains("lastClassDate") { try container.encode(self.lastClassDate, forKey: JSONKey("lastClassDate")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("medical") { try container.encode(self.medical, forKey: JSONKey("medical")) }
        if presentFields.contains("medicalTag") { try container.encode(self.medicalTag, forKey: JSONKey("medicalTag")) }
        if presentFields.contains("medium") { try container.encode(self.medium, forKey: JSONKey("medium")) }
        if presentFields.contains("mediumTag") { try container.encode(self.mediumTag, forKey: JSONKey("mediumTag")) }
        if presentFields.contains("moniker") { try container.encode(self.moniker, forKey: JSONKey("moniker")) }
        if presentFields.contains("myStudent") { try container.encode(self.myStudent, forKey: JSONKey("myStudent")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("outDate") { try container.encode(self.outDate, forKey: JSONKey("outDate")) }
        if presentFields.contains("parentEmail") { try container.encode(self.parentEmail, forKey: JSONKey("parentEmail")) }
        if presentFields.contains("parentsEmail") { try container.encode(self.parentsEmail, forKey: JSONKey("parentsEmail")) }
        if presentFields.contains("points") { try container.encode(self.points, forKey: JSONKey("points")) }
        if presentFields.contains("schoolRollNote") { try container.encode(self.schoolRollNote, forKey: JSONKey("schoolRollNote")) }
        if presentFields.contains("schoolRollStatus") { try container.encode(self.schoolRollStatus, forKey: JSONKey("schoolRollStatus")) }
        if presentFields.contains("section") { try container.encode(self.section, forKey: JSONKey("section")) }
        if presentFields.contains("selfStudyRoomName") { try container.encode(self.selfStudyRoomName, forKey: JSONKey("selfStudyRoomName")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentEmail") { try container.encode(self.studentEmail, forKey: JSONKey("studentEmail")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        if presentFields.contains("surname") { try container.encode(self.surname, forKey: JSONKey("surname")) }
        if presentFields.contains("toSchool") { try container.encode(self.toSchool, forKey: JSONKey("toSchool")) }
        if presentFields.contains("transReasonName") { try container.encode(self.transReasonName, forKey: JSONKey("transReasonName")) }
        if presentFields.contains("transRemark") { try container.encode(self.transRemark, forKey: JSONKey("transRemark")) }
        if presentFields.contains("zhName") { try container.encode(self.zhName, forKey: JSONKey("zhName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherStudentMyStudentPOSTResponse: CapturedResponse {
    /// 当前页的完整记录。
    public let items: [TeacherStudentMyStudentPOSTResponseItemsItem]
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
        self.items = try container.decode([TeacherStudentMyStudentPOSTResponseItemsItem].self, forKey: JSONKey("items"))
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
