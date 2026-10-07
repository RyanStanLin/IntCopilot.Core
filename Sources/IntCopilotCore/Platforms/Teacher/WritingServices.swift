import Foundation

extension TeacherClient {
    public func recordDiary(_ draft: DiaryDraft, for students: [Student]) async throws -> MutationAcknowledgement {
        let school = try await session.schoolID()
        guard !students.isEmpty, students.allSatisfy({ $0.schoolID == school }), draft.primaryType.domain == "diaryPrimaryType", draft.primaryType.isEnabled else { throw APIError.invalidParameter("学生与日记类型") }
        if draft.primaryType.record["special"]?.boolValue == true { throw APIError.unsafeEndpoint("特殊护理日记字段未完整确认，请使用实验入口") }
        if let entry = draft.entryType {
            guard entry.domain == "diaryEntryType", entry.dependencies["primaryTypeId"] == draft.primaryType.rawValue.stringValue else { throw APIError.invalidParameter("日记子类型属于其他主类型") }
        }
        if let points = draft.points {
            if let minimum = draft.primaryType.record["lowPoints"]?.integerValue, points < minimum { throw APIError.invalidParameter("积分低于所选类型的下限") }
            if let maximum = draft.primaryType.record["highPoints"]?.integerValue, points > maximum { throw APIError.invalidParameter("积分超过所选类型的上限") }
        }
        let formatter = ISO8601DateFormatter(); formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        var fields: [String: APIParameter] = [
            "primaryTypeId":.selection(draft.primaryType), "students":.list(try students.map { student in
                guard let id = Int(student.id.rawValue) else { throw APIError.invalidParameter("学生标识必须为数字") }; return .integer(id)
            }), "description":.text(draft.description), "date":.text(formatter.string(from: draft.occurredAt)), "time":.text(formatter.string(from: draft.occurredAt)), "recordTime":.date(draft.occurredAt),
            "points":draft.points.map(APIParameter.integer) ?? .unverifiedRaw(.null), "location":.text(draft.location), "confidential":.boolean(false),
            "followUpDate":draft.followUpAt.map(APIParameter.date) ?? .unverifiedRaw(.null), "followUpAction":.text(draft.followUpAction), "followUpAdvice":.text(draft.followUpAdvice),
            "attachments":.list([]), "enclosures":.list([]), "injureParts":.list([]), "addressee":.list([]), "notice":.boolean(true),
            "shareWithParents":.boolean(draft.shareWithParents), "shareWithStudents":.boolean(draft.shareWithStudents), "shareWithHeadTeachers":.boolean(draft.shareWithHeadTeachers), "shareWithTutors":.boolean(draft.shareWithTutors)
        ]
        if let entry = draft.entryType { fields["diaryEntryTypeId"] = .selection(entry) }
        return try await session.call(TeacherEndpoints.diaryPOST, input: APIInput(body: fields), schoolID: school)
    }

    public func parentRecipients(search: String = "", page: PageRequest = PageRequest()) async throws -> ParentRecipientPage {
        let school = try await session.schoolID()
        var query = try page.parameters(); query["name"] = .text(search); query["queryType"] = .text("parent")
        let response = try await session.call(TeacherEndpoints.dropDownMessageReceiverGET, input: APIInput(query: query), schoolID: school)
        let value = try JSONEncoder().encode(response.items)
        return ParentRecipientPage(recipients: try JSONDecoder().decode([JSONValue].self, from: value).map { try ParentMessageRecipient(record: $0, schoolID: school) }, page: response)
    }

    public func sendMessage(_ draft: MessageDraft, to recipients: [ParentMessageRecipient]) async throws -> TeacherMessageSendPOSTResponse {
        let school = try await session.schoolID()
        guard !recipients.isEmpty, recipients.allSatisfy({ $0.schoolID == school }), !draft.title.isEmpty else { throw APIError.invalidParameter("消息标题及收件人") }
        let targets: [APIParameter] = try recipients.map { recipient in
            guard let parent = Int(recipient.parentID), let student = Int(recipient.studentID.rawValue) else { throw APIError.invalidParameter("收件人关联标识") }
            return .unverifiedRaw(.object(["parentId":.integer(parent),"studentId":.integer(student)]))
        }
        let display: [APIParameter] = recipients.map { .unverifiedRaw(.object(["id":.string($0.id),"title":.string($0.name),"isPre":.bool($0.record["status"]?.stringValue == "1017")])) }
        return try await session.call(TeacherEndpoints.messageSendPOST, input: APIInput(body: [
            "title":.text(draft.title),"content":.text(draft.content),"important":.boolean(draft.important),"sendMail":.boolean(draft.sendMail),
            "sendHeadTeacher":.boolean(draft.sendHeadTeacher),"sendTutor":.boolean(draft.sendTutor),"sendParent":.boolean(false),
            "attachments":.list([]),"resourceIds":.list([]),"parents":.list(display),"toParents":.list(targets)
        ]), schoolID: school)
    }
}
