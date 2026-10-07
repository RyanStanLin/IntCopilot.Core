# 可编译 SOP 示例

以下函数与测试 target 的源码一致，账号、学生、周期和选项由 App 用户选择后传入。它们不会被 CI 连接到真实平台。写入单独执行，没有隐式提交。

```swift
import Foundation
import IntCopilotCore

func exampleParentPassword(_ client: ParentClient, account: String, password: String) async throws -> LoginResult {
    try await client.login(account: account, password: password)
}

func exampleTeacherPassword(_ client: TeacherClient, account: String, password: String) async throws -> LoginResult {
    try await client.login(account: account, password: password)
}

func exampleSMSRetry(_ client: ParentClient, mobile: String, firstCode: String, correctedCode: String) async throws -> LoginResult {
    let challenge = try await client.requestSMSCode(to: mobile)
    do { return try await challenge.submit(code: firstCode) }
    catch APIError.invalidVerificationCode { return try await challenge.submit(code: correctedCode) }
}

func exampleStudentTimetable(_ client: ParentClient, selected: Student, range: SchoolDateRange) async throws -> ParentCurriculumStudentSchoolYearIdGETResponse {
    try await client.student(selected).timetable(in: range)
}

func exampleSubmitLeave(_ client: ParentClient, selected: Student, reason: SemanticOption, range: SchoolDateRange, explanation: String) async throws -> ParentAttendanceLeaveApplicationGETResponse {
    let scope = client.student(selected)
    _ = try await scope.submitLeave(reason: reason, during: range, explanation: explanation)
    return try await scope.leaveApplications()
}

func exampleWithdrawLeave(_ client: ParentClient, selected: Student, application: ParentAttendanceLeaveApplicationGETResponseItemsItem) async throws -> ParentAttendanceLeaveApplicationGETResponse {
    let scope = client.student(selected)
    _ = try await scope.withdrawLeave(application)
    return try await scope.leaveApplications()
}

func exampleAssignmentDetails(_ client: ParentClient, selected: Student, assignment: ParentTaskMergeListGETResponseItemsItem) async throws -> ParentTaskDetailGETResponse {
    try await client.student(selected).assignmentDetails(for: assignment)
}

func exampleStudentReport(_ client: ParentClient, selected: Student, period: ParentMonthlyGradeMonthlyGradeByStudentGETResponseItem) async throws -> ParentMonthlyGradeReportDetailGETResponse {
    try await client.student(selected).report(for: period)
}

func exampleTeacherAttendance(_ client: TeacherClient, selected: Course, date: Date, period: SemanticOption, row: TeacherAttendanceClassGETResponseAttendancesItemsItem, status: SemanticOption) async throws -> TeacherAttendanceClassGETResponse {
    let scope = client.course(selected)
    _ = try await scope.recordAttendance(row, status: status)
    return try await scope.attendance(on: date, period: period)
}

func exampleTeacherGrade(_ client: TeacherClient, selected: Course, submission: TeacherTaskPerformanceGETResponseItem, score: Int, comment: String) async throws -> TeacherTaskStudentDetailGETResponse {
    let scope = client.course(selected)
    let detail = try await scope.submissionDetails(submission)
    _ = try await scope.recordScore(for: detail, score: score, comment: comment)
    return try await scope.submissionDetails(submission)
}

func exampleDiary(_ client: TeacherClient, selected: Student, primary: SemanticOption, entry: SemanticOption, description: String, date: Date, points: Int) async throws -> MutationAcknowledgement {
    let draft = DiaryDraft(primaryType: primary, entryType: entry, description: description, occurredAt: date, points: points)
    return try await client.recordDiary(draft, for: [selected])
}

func exampleMessage(_ client: TeacherClient, recipients: [ParentMessageRecipient], title: String, content: String) async throws -> TeacherMessageSendPOSTResponse {
    try await client.sendMessage(MessageDraft(title: title, content: content), to: recipients)
}

```
