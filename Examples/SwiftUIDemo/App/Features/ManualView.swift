import SwiftUI
import IntCopilotCore

struct ManualView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("业务写入由你测试", symbol: "hand.raised.fill") {
            Text("先完成上游查询并选择目标，再解锁。每一次提交都会显示真实操作、目标和数据，并要求你确认。发送消息、邮件或积分通知可能无法撤回。").foregroundStyle(.secondary)
            Toggle("解锁本次会话的手动业务测试", isOn: $store.manualTesting).tint(.orange)
        }
        if store.manualTesting {
            if store.platform == .parent { LeaveMutationView() }
            else { AttendanceMutationView(); GradeMutationView(); DiaryMutationView(); MessageMutationView() }
        }
    }
}
struct LeaveMutationView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var reasonID = ""
    @State private var explanation = ""
    var body: some View {
        LabCard("提交与撤回请假", symbol: "calendar.badge.clock") {
            ActionButton("读取请假原因") { await store.loadLeaveOptions() }
            OptionPicker(title: "原因", options: store.optionSets["leaveReason"] ?? [], selection: $reasonID)
            RangeControls()
            TextField("请假说明", text: $explanation).textFieldStyle(.roundedBorder)
            Button("审查并提交申请") {
                do {
                    let student = try store.requireStudent(), range = store.range
                    guard let reason = store.optionSets["leaveReason"]?.first(where: {$0.id == reasonID}) else { throw APIError.missingParameter("选择请假原因") }
                    let text = explanation
                    store.stageMutation("提交请假申请", path: "/api/attendance/leave-application", method: .post, preview: "学生：\(student.name)\n原因：\(reason.name)\n开始：\(range.start.formatted())\n结束：\(range.end.formatted())\n说明：\(text)") {
                        try store.encoded(await store.parent.student(student).submitLeave(reason: reason, during: range, explanation: text))
                    }
                } catch { store.errorMessage = friendlyError(error) }
            }.buttonStyle(.bordered).tint(.orange)
            ActionButton("刷新申请列表") { await store.loadLeaves() }
            Picker("待撤回记录", selection: $store.selectedLeaveID) {
                Text("选择申请").tag("")
                ForEach(store.leaveRecords.filter {$0.status.code != "retrieved"}, id: \.leaveApplicationId) { Text($0.reasonName + " · " + $0.status.name + " · " + Date(timeIntervalSince1970: Double($0.startTime)/1000).formatted()).tag(String($0.leaveApplicationId)) }
            }
            Button("审查并撤回") {
                do {
                    let student = try store.requireStudent()
                    guard let item = store.leaveRecords.first(where: {String($0.leaveApplicationId) == store.selectedLeaveID}) else { throw APIError.missingParameter("选择请假记录") }
                    store.stageMutation("撤回请假申请", path: "/api/attendance/leave-application/retrieve", method: .put, preview: "学生：\(student.name)\n申请：\(item.leaveApplicationId)\n当前状态：\(item.status.name)\n撤回是否允许由服务端决定。") {
                        try store.encoded(await store.parent.student(student).withdrawLeave(item))
                    }
                } catch { store.errorMessage = friendlyError(error) }
            }.buttonStyle(.bordered).tint(.orange)
        }
    }
}
struct AttendanceMutationView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var statusID = ""
    @State private var comment = ""
    var body: some View {
        LabCard("登记常规课节考勤", symbol: "checkmark.circle") {
            Text("先在考勤页面获取课节与记录。仅提供常规课程登记；CCA 未完整确认写入规则的接口可在目录中审查。").font(.caption).foregroundStyle(.secondary)
            Picker("学生课节记录", selection: $store.selectedAttendanceRowID) {
                Text("选择记录").tag("")
                ForEach(store.attendanceRows.filter {$0.editable && !$0.locked}, id: \.studentId) { Text($0.studentName+" · "+$0.status.name).tag(String($0.classArrangeId)+":"+String($0.studentId)) }
            }
            ActionButton("读取允许的状态") { await store.loadAttendanceStatuses() }
            OptionPicker(title: "登记状态", options: (store.optionSets["attendanceStatus"] ?? []).filter(\.isEnabled), selection: $statusID)
            TextField("考勤备注", text: $comment).textFieldStyle(.roundedBorder)
            Button("审查考勤修改") {
                do {
                    let scope = try store.courseScope()
                    guard let row = store.attendanceRows.first(where: {String($0.classArrangeId)+":"+String($0.studentId) == store.selectedAttendanceRowID}), let status = store.optionSets["attendanceStatus"]?.first(where: {$0.id == statusID}) else { throw APIError.missingParameter("选择记录与考勤状态") }
                    let text = comment
                    store.stageMutation("登记课节考勤", path: "/api/attendance/class", method: .put, preview: "课程：\(scope.course.name)\n学生：\(row.studentName)\n原状态：\(row.status.name)\n新状态：\(status.name)\n备注：\(text)") { try store.encoded(await scope.recordAttendance(row, status: status, comment: text)) }
                } catch { store.errorMessage = friendlyError(error) }
            }.buttonStyle(.bordered).tint(.orange)
        }
    }
}
struct GradeMutationView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var score = ""
    @State private var comment = ""
    var body: some View {
        LabCard("录入学生作业成绩", symbol: "pencil.and.list.clipboard") {
            Text("先在作业页面选择课程、作业和学生记录。审查前会只读获取原成绩及标签；提交不会覆盖未修改的评语。").font(.caption).foregroundStyle(.secondary)
            TextField("成绩（整数）", text: $score).textFieldStyle(.roundedBorder)
            TextField("新评语，留空保留原评语", text: $comment).textFieldStyle(.roundedBorder)
            ActionButton("读取原记录并审查", symbol: "eye") {
                do {
                    let scope = try store.courseScope()
                    guard let submission = store.submissions.first(where: {String($0.taskStudentId) == store.selectedSubmissionID}), let value = Int(score), value >= 0 else { throw APIError.invalidParameter("选择学生记录并输入非负整数成绩") }
                    var detail: TeacherTaskStudentDetailGETResponse?
                    await store.perform("读取录分前状态") { let record = try await scope.submissionDetails(submission); detail = record; return try store.encoded(record) }
                    guard let detail else { return }
                    let text: String? = comment.isEmpty ? nil : comment
                    store.stageMutation("录入作业成绩", path: "/api/task/updateScore", method: .put, preview: "课程：\(scope.course.name)\n学生：\(submission.studentName)\n原成绩与标签：\(QueryPlanning.pretty(try store.encoded(detail)))\n新成绩：\(value)\n新评语：\(text ?? "保留原评语")") { try store.encoded(await scope.recordScore(for: detail, score: value, comment: text)) }
                } catch { store.errorMessage = friendlyError(error) }
            }
        }
    }
}
struct DiaryMutationView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var primaryID = ""
    @State private var entryID = ""
    @State private var description = ""
    @State private var points = ""
    @State private var location = ""
    @State private var shareParents = false
    @State private var shareStudents = false
    var body: some View {
        LabCard("创建行为日记", symbol: "book.closed") {
            ActionButton("获取主类型") { await store.loadOptions(.diaryTypes) }
            OptionPicker(title: "主类型", options: store.optionSets["diaryPrimaryType"] ?? [], selection: $primaryID)
            ActionButton("获取关联子类型") { await store.loadOptions(.diarySubtypes, selected: store.optionSets["diaryPrimaryType"]?.first {$0.id == primaryID}) }
            OptionPicker(title: "子类型", options: store.optionSets["diaryEntryType"] ?? [], selection: $entryID)
            TextField("行为描述", text: $description).textFieldStyle(.roundedBorder)
            TextField("积分（可留空）", text: $points).textFieldStyle(.roundedBorder)
            TextField("地点", text: $location).textFieldStyle(.roundedBorder)
            DatePicker("发生时间", selection: $store.date)
            Toggle("分享给家长", isOn: $shareParents); Toggle("分享给学生", isOn: $shareStudents)
            Button("审查行为记录") {
                do {
                    let student = try store.requireStudent()
                    guard let primary = store.optionSets["diaryPrimaryType"]?.first(where: {$0.id == primaryID}), !description.isEmpty else { throw APIError.missingParameter("选择主类型并填写描述") }
                    if !points.isEmpty, Int(points) == nil { throw APIError.invalidParameter("积分应为整数") }
                    let entry = store.optionSets["diaryEntryType"]?.first {$0.id == entryID}
                    let draft = DiaryDraft(primaryType: primary, entryType: entry, description: description, occurredAt: store.date, points: Int(points), location: location, shareWithParents: shareParents, shareWithStudents: shareStudents)
                    store.stageMutation("创建行为日记", path: "/api/diary", method: .post, preview: "学生：\(student.name)\n类型：\(primary.name) / \(entry?.name ?? "无子类型")\n描述：\(description)\n积分：\(points)\n分享家长：\(shareParents)，分享学生：\(shareStudents)") { try store.encoded(await store.teacher.recordDiary(draft, for: [student])) }
                } catch { store.errorMessage = friendlyError(error) }
            }.buttonStyle(.bordered).tint(.orange)
        }
    }
}
struct MessageMutationView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var search = ""
    @State private var title = ""
    @State private var content = ""
    @State private var sendMail = false
    var body: some View {
        LabCard("选择收件人并发送消息", symbol: "paperplane") {
            TextField("家长或学生名称筛选", text: $search).textFieldStyle(.roundedBorder)
            ActionButton("只读查询家长收件人") { await store.loadRecipients(search) }
            ForEach(store.recipientPage) { recipient in
                Toggle(recipient.name, isOn: Binding(get: { store.selectedRecipientIDs.contains(recipient.id) }, set: { enabled in if enabled { store.selectedRecipientIDs.insert(recipient.id) } else { store.selectedRecipientIDs.remove(recipient.id) } }))
            }
            TextField("标题", text: $title).textFieldStyle(.roundedBorder)
            TextField("正文", text: $content).textFieldStyle(.roundedBorder)
            Toggle("同时发送邮件（不能撤回）", isOn: $sendMail)
            Button("审查发送内容") {
                let recipients = store.recipientPage.filter {store.selectedRecipientIDs.contains($0.id)}
                guard !recipients.isEmpty, !title.isEmpty else { store.errorMessage = "请选择收件人并填写标题。"; return }
                let draft = MessageDraft(title: title, content: content, sendMail: sendMail)
                store.stageMutation("发送家长消息", path: "/api/message/send", method: .post, preview: "收件人：\(recipients.map(\.name).joined(separator: "、"))\n标题：\(title)\n正文：\(content)\n同时发送邮件：\(sendMail)") { try store.encoded(await store.teacher.sendMessage(draft, to: recipients)) }
            }.buttonStyle(.bordered).tint(.orange)
        }
    }
}
