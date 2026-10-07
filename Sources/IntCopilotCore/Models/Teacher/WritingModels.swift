import Foundation

public struct DiaryDraft: Sendable {
    /// 用户从 diaryTypes 选择的具名主类型。
    public let primaryType: SemanticOption
    /// 用户从相应 diaryEntryTypes 选择的具名子类型；类型不要求子类型时为 nil。
    public let entryType: SemanticOption?
    /// 完整行为描述或富文本正文。
    public let description: String
    /// 行为发生时刻；编码为 Unix 毫秒与 ISO 8601 文本。
    public let occurredAt: Date
    /// 行为积分，受主类型返回的 lowPoints 与 highPoints 约束。
    public let points: Int?
    /// 行为地点说明，允许空文本。
    public let location: String
    /// 后续跟进时刻，未安排时为 nil。
    public let followUpAt: Date?
    /// 后续跟进行动说明。
    public let followUpAction: String
    /// 后续跟进建议。
    public let followUpAdvice: String
    /// 是否向关联家长共享；真实写入可能触发通知。
    public let shareWithParents: Bool
    /// 是否向目标学生共享；真实写入可能触发通知。
    public let shareWithStudents: Bool
    /// 是否向主班教师共享。
    public let shareWithHeadTeachers: Bool
    /// 是否向辅导师共享。
    public let shareWithTutors: Bool
    public init(primaryType: SemanticOption, entryType: SemanticOption? = nil, description: String, occurredAt: Date, points: Int? = nil, location: String = "", followUpAt: Date? = nil, followUpAction: String = "", followUpAdvice: String = "", shareWithParents: Bool = false, shareWithStudents: Bool = false, shareWithHeadTeachers: Bool = false, shareWithTutors: Bool = false) {
        self.primaryType = primaryType; self.entryType = entryType; self.description = description; self.occurredAt = occurredAt
        self.points = points; self.location = location; self.followUpAt = followUpAt; self.followUpAction = followUpAction; self.followUpAdvice = followUpAdvice
        self.shareWithParents = shareWithParents; self.shareWithStudents = shareWithStudents; self.shareWithHeadTeachers = shareWithHeadTeachers; self.shareWithTutors = shareWithTutors
    }
}

public struct ParentMessageRecipient: Sendable, Identifiable {
    /// 收件人所属学校，防止跨学校误发送。
    public let schoolID: SchoolID
    /// 家长与学生关联标识组成的收件人显示标识。
    public var id: String { parentID + "-" + studentID.rawValue }
    /// 家长标识，来自消息收件人查询。
    public let parentID: String
    /// 家长对应的学生标识，来自同一收件人记录。
    public let studentID: StudentID
    /// 具名收件人，包含学生名称及关系。
    public let name: String
    /// 完整收件人记录，保留状态及联系信息。
    public let record: JSONValue
    init(record: JSONValue, schoolID: SchoolID) throws {
        guard let parent = record["parentId"]?.stringValue, let student = record["studentId"]?.stringValue, let name = record["name"]?.stringValue else { throw APIError.invalidResponse("收件人缺少关联标识或姓名") }
        self.schoolID = schoolID; parentID = parent; studentID = StudentID(student)
        self.name = name + (record["relationShip"]?.stringValue.map { " (" + $0 + ")" } ?? ""); self.record = record
    }
}

public struct ParentRecipientPage: Sendable {
    /// 当前页的具名家长收件人及其学生关联。
    public let recipients: [ParentMessageRecipient]
    /// 完整分页响应，包含所有已确认字段。
    public let page: TeacherDropDownMessageReceiverGETResponse
}

public struct MessageDraft: Sendable {
    /// 消息标题。
    public let title: String
    /// 消息正文或富文本内容。
    public let content: String
    /// 是否标记为重要消息。
    public let important: Bool
    /// 是否同时发送邮件；邮件无法可靠撤回。
    public let sendMail: Bool
    /// 是否同时发送给关联主班教师。
    public let sendHeadTeacher: Bool
    /// 是否同时发送给关联辅导师。
    public let sendTutor: Bool
    public init(title: String, content: String, important: Bool = false, sendMail: Bool = false, sendHeadTeacher: Bool = false, sendTutor: Bool = false) {
        self.title = title; self.content = content; self.important = important; self.sendMail = sendMail
        self.sendHeadTeacher = sendHeadTeacher; self.sendTutor = sendTutor
    }
}

