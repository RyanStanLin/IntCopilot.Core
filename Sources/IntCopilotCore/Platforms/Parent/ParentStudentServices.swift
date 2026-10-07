import Foundation

public struct LeaveOptions: Sendable {
    /// 家长提交界面实际使用的请假申请类别；当前已确认 personal。
    public let kinds: [SemanticOption]
    /// 平台返回的完整具名原因选项，原始英文错误不会被静默改写。
    public let reasons: [SemanticOption]
}

public enum ResourceTag: Sendable {}
public typealias ResourceID = Identifier<ResourceTag>

public struct ParentStudentScope: Sendable {
    /// 当前学生所属的家长平台会话。
    private let session: CoreSession
    /// 用户选择的具名学生与完整上游记录。
    public let student: Student
    init(session: CoreSession, student: Student) { self.session = session; self.student = student }

    private func call<R>(_ endpoint: CapturedEndpoint<R>, query: [String: APIParameter] = [:], body: [String: APIParameter] = [:], path: [String: String] = [:]) async throws -> R {
        try await session.requireSchool(student.schoolID)
        var query = query
        if try endpoint.descriptor.queryParameters.contains("studentId") { query["studentId"] = .id(student.id) }
        return try await session.call(endpoint, input: APIInput(query: query, body: body, path: path), schoolID: student.schoolID)
    }

    public func details() async throws -> ParentStudentDetailGETResponse { try await call(ParentEndpoints.studentDetailGET) }
    public func classInformation() async throws -> ParentStudentClassInfoGETResponse { try await call(ParentEndpoints.studentClassInfoGET) }
    public func parents() async throws -> ParentStudentGetParentsGETResponse { try await call(ParentEndpoints.studentGetParentsGET) }
    public func timetable(in range: SchoolDateRange) async throws -> ParentCurriculumStudentSchoolYearIdGETResponse { try await call(ParentEndpoints.curriculumStudentSchoolYearIdGET, query: range.query()) }
    public func attendance(in range: SchoolDateRange) async throws -> ParentAttendanceStatisticStudentSchoolYearIdGETResponse { try await call(ParentEndpoints.attendanceStatisticStudentSchoolYearIdGET, query: range.query()) }
    public func courseRecords() async throws -> ParentCourseRecordListByStudentGETResponse { try await call(ParentEndpoints.courseRecordListByStudentGET) }
    public func diary(page: PageRequest = PageRequest()) async throws -> ParentDiaryByStudentGETResponse { try await call(ParentEndpoints.diaryByStudentGET, query: page.parameters()) }
    public func gradeBook() async throws -> ParentTaskGradeGradeBookGETResponse { try await call(ParentEndpoints.taskGradeGradeBookGET) }

    public func calendar(monthContaining date: Date, timeZone: TimeZone = TimeZone(identifier: "Asia/Shanghai")!) async throws -> ParentCalendarByMonthGETResponse {
        var calendar = Calendar(identifier: .gregorian); calendar.timeZone = timeZone
        guard let interval = calendar.dateInterval(of: .month, for: date) else { throw APIError.invalidParameter("月份") }
        return try await call(ParentEndpoints.calendarByMonthGET, query: ["date":.date(date),"dateStart":.date(interval.start),"dateEnd":.date(interval.end.addingTimeInterval(-0.001))])
    }

    public func courses() async throws -> [Course] {
        let response = try await call(ParentEndpoints.dropDownRelatedAllCoursesGET)
        let records = try JSONDecoder().decode([JSONValue].self, from: JSONEncoder().encode(response))
        return try records.map { try Course(record: $0, schoolID: student.schoolID) }
    }

    public func tasks(course: Course? = nil, page: PageRequest = PageRequest()) async throws -> ParentTaskMergeListGETResponse {
        var query = try page.parameters()
        if let course { guard course.schoolID == student.schoolID else { throw APIError.invalidParameter("课程所属学校") }; query["courseId"] = .id(course.id) }
        return try await call(ParentEndpoints.taskMergeListGET, query: query)
    }

    public func assignmentDetails(for item: ParentTaskMergeListGETResponseItemsItem) async throws -> ParentTaskDetailGETResponse {
        guard item.type.code == "1001" else { throw APIError.invalidParameter("此条目是教学资源，请使用相应实验资源端点") }
        return try await call(ParentEndpoints.taskDetailGET, query: ["taskStudentId":.integer(item.entityId)])
    }

    public func reportPeriods() async throws -> ParentMonthlyGradeMonthlyGradeByStudentGETResponse { try await call(ParentEndpoints.monthlyGradeMonthlyGradeByStudentGET) }
    public func report(for period: ParentMonthlyGradeMonthlyGradeByStudentGETResponseItem) async throws -> ParentMonthlyGradeReportDetailGETResponse {
        try await call(ParentEndpoints.monthlyGradeReportDetailGET, query: ["gradePeriodId":.integer(period.gradePeriodId)])
    }

    public func leaveOptions() async throws -> LeaveOptions {
        try await session.requireSchool(student.schoolID)
        let reasons = try await session.json(path: "/api/dropDown/leave-reasons", cached: true, schoolID: student.schoolID)
        guard let values = reasons.arrayValue else { throw APIError.invalidResponse("请假原因不是数组") }
        return LeaveOptions(kinds: LeaveKind.allCases.map(\.option), reasons: try values.map { try SemanticOption.from($0, domain: "leaveReason", schoolID: student.schoolID) })
    }

    public func leaveApplications(page: PageRequest = PageRequest()) async throws -> ParentAttendanceLeaveApplicationGETResponse { try await call(ParentEndpoints.attendanceLeaveApplicationGET, query: page.parameters()) }

    public func submitLeave(reason: SemanticOption, during range: SchoolDateRange, explanation: String = "", attachments: [ResourceID] = []) async throws -> MutationAcknowledgement {
        guard reason.domain == "leaveReason", reason.isEnabled else { throw APIError.invalidParameter("请从 leaveOptions 返回值中选择原因") }
        _ = try range.query()
        return try await call(ParentEndpoints.attendanceLeaveApplicationPOST, body: [
            "studentId":.id(student.id), "type":.selection(LeaveKind.personal.option),
            "reasonId":.selection(reason), "reason":.text(explanation),
            "startTime":.date(range.start), "endTime":.date(range.end),
            "resourceIds":.list(attachments.map { .id($0) })
        ])
    }

    public func withdrawLeave(_ application: ParentAttendanceLeaveApplicationGETResponseItemsItem) async throws -> MutationAcknowledgement {
        guard application.status.code != "retrieved" else { throw APIError.invalidParameter("申请已撤回") }
        return try await call(ParentEndpoints.attendanceLeaveApplicationRetrievePUT, query: ["leaveApplicationId":.integer(application.leaveApplicationId)])
    }
}
