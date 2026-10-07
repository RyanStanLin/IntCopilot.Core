import Foundation

public struct CourseRoster: Sendable {
    /// 当前页的具名学生引用，已绑定学校。
    public let students: [Student]
    /// 完整强类型响应，包括分页信息及学生全部已确认字段。
    public let page: TeacherCourseStudentsGETResponse
}

public struct TeacherCourseScope: Sendable {
    /// 当前课程所属教师会话。
    private let session: CoreSession
    /// 用户选择的课程及完整上游信息。
    public let course: Course
    /// 有语义名称的课程类别，不要求填写 1001 或 1002。
    public let kind: CourseKind
    init(session: CoreSession, course: Course, kind: CourseKind) { self.session = session; self.course = course; self.kind = kind }

    private func call<R>(_ endpoint: CapturedEndpoint<R>, query: [String: APIParameter] = [:], body: [String: APIParameter] = [:], path: [String: String] = [:]) async throws -> R {
        try await session.requireSchool(course.schoolID)
        var query = query
        if try endpoint.descriptor.queryParameters.contains("courseId") { query["courseId"] = .id(course.id) }
        return try await session.call(endpoint, input: APIInput(query: query, body: body, path: path), schoolID: course.schoolID)
    }

    public func students(page: PageRequest = PageRequest()) async throws -> CourseRoster {
        let response = try await call(TeacherEndpoints.courseStudentsGET, query: page.parameters())
        let records = try JSONDecoder().decode([JSONValue].self, from: JSONEncoder().encode(response.items))
        return CourseRoster(students: try records.map { try Student(record: $0, schoolID: course.schoolID) }, page: response)
    }

    public func tasks(page: PageRequest = PageRequest()) async throws -> TeacherTaskMergeListGETResponse { try await call(TeacherEndpoints.taskMergeListGET, query: page.parameters()) }
    public func gradeBook() async throws -> TeacherGradeBookGradeBookGETResponse { try await call(TeacherEndpoints.gradeBookGradeBookGET) }
    public func taskTypes() async throws -> [SemanticOption] {
        try await session.requireSchool(course.schoolID)
        let response = try await session.json(path: "/api/dropDown/taskTypeByCourse", query: ["courseIds":.list([.id(course.id)])], cached: true, schoolID: course.schoolID)
        return try (response.arrayValue ?? []).map { try SemanticOption.from($0, domain: "taskType", idField: "taskTypeId", nameField: "name", englishField: "enName", schoolID: course.schoolID) }
    }

    public func periodOptions(on date: Date) async throws -> [SemanticOption] {
        try await session.requireSchool(course.schoolID)
        let response = try await session.json(path: "/api/course/cascade/attendance", query: ["date":.date(date),"type":.selection(kind.option)], schoolID: course.schoolID)
        func find(_ value: JSONValue) -> JSONValue? {
            if value["key"]?.stringValue == course.id.rawValue { return value }
            for child in value.arrayValue ?? value["subOptions"]?.arrayValue ?? [] { if let found = find(child) { return found } }
            return nil
        }
        guard let selected = find(response) else { return [] }
        return try (selected["subOptions"]?.arrayValue ?? []).map { try SemanticOption.from($0, domain: "classPeriod", schoolID: course.schoolID, dependencies: ["courseId":course.id.rawValue]) }
    }

    public func attendance(on date: Date, period: SemanticOption, page: PageRequest = PageRequest()) async throws -> TeacherAttendanceClassGETResponse {
        guard kind == .regular, period.domain == "classPeriod", period.dependencies["courseId"] == course.id.rawValue else { throw APIError.invalidParameter("常规课程课节；CCA 请使用 ccaAttendance") }
        var query = try page.parameters(); query["date"] = .date(date); query["classPeriodId"] = .selection(period)
        return try await call(TeacherEndpoints.attendanceClassGET, query: query)
    }

    public func ccaAttendance(on date: Date, period: SemanticOption, page: PageRequest = PageRequest()) async throws -> TeacherAttendanceClassCcaGETResponse {
        guard kind == .cca, period.domain == "classPeriod", period.dependencies["courseId"] == course.id.rawValue else { throw APIError.invalidParameter("CCA 课节") }
        var query = try page.parameters(); query["date"] = .date(date); query["classPeriodId"] = .selection(period)
        return try await call(TeacherEndpoints.attendanceClassCcaGET, query: query)
    }

    public func attendanceStatuses() async throws -> [SemanticOption] {
        try await session.requireSchool(course.schoolID)
        let year = try await session.currentSchoolYear()
        let response = try await session.json(path: "/api/attendance/attendance-status", query: ["schoolYearId":.id(year)], cached: true, schoolID: course.schoolID)
        return try (response.arrayValue ?? []).filter { $0["show"]?.boolValue != false }.map { try SemanticOption.from($0, domain: "attendanceStatus", idField: "value", nameField: "name", englishField: "enName", schoolID: course.schoolID) }
    }

    public func recordAttendance(_ row: TeacherAttendanceClassGETResponseAttendancesItemsItem, status: SemanticOption, comment: String = "") async throws -> MutationAcknowledgement {
        guard status.domain == "attendanceStatus", status.isEnabled, row.editable, !row.locked else { throw APIError.permissionDenied }
        return try await call(TeacherEndpoints.attendanceClassPUT, body: ["classArrangeId":.integer(row.classArrangeId),"studentId":.integer(row.studentId),"status":.selection(status),"comment":.text(comment)])
    }

    public func taskDetails(_ taskID: TaskID) async throws -> TeacherTaskDetailGETResponse { try await call(TeacherEndpoints.taskDetailGET, query: ["taskId":.id(taskID)]) }
    public func submissions(for taskID: TaskID) async throws -> TeacherTaskPerformanceGETResponse { try await call(TeacherEndpoints.taskPerformanceGET, query: ["taskId":.id(taskID)]) }
    public func submissionDetails(_ submission: TeacherTaskPerformanceGETResponseItem) async throws -> TeacherTaskStudentDetailGETResponse {
        try await call(TeacherEndpoints.taskStudentDetailGET, query: ["taskStudentId":.integer(submission.taskStudentId)])
    }
    public func recordScore(for detail: TeacherTaskStudentDetailGETResponse, score: Int, comment: String? = nil) async throws -> MutationAcknowledgement {
        guard score >= 0 else { throw APIError.invalidParameter("成绩不能为负") }
        return try await call(TeacherEndpoints.taskUpdateScorePUT, body: ["studentId":.integer(detail.studentId),"taskId":.integer(detail.taskId),"score":.integer(score),"tag":.unverifiedRaw(detail.tag.rawValue),"comment":.text(comment ?? detail.comments)])
    }

    public func reportPeriods() async throws -> [SemanticOption] {
        try await session.requireSchool(course.schoolID)
        let year = try await session.currentSchoolYear()
        let result = try await session.json(path: "/api/monthly-grade/grade-period/"+course.id.rawValue, query: ["schoolYearId":.id(year)], cached: true, schoolID: course.schoolID)
        return try (result.arrayValue ?? []).map { try SemanticOption.from($0, domain: "gradePeriod", schoolID: course.schoolID, dependencies: ["courseId":course.id.rawValue]) }
    }
    public func monthlyGradeTable(period: SemanticOption) async throws -> TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponse {
        guard period.domain == "gradePeriod", period.dependencies["courseId"] == course.id.rawValue else { throw APIError.invalidParameter("成绩周期") }
        return try await call(TeacherEndpoints.monthlyGradeGradeTableGradePeriodIdCourseIdGET, path: ["gradePeriodId":period.rawValue.stringValue ?? "", "courseId":course.id.rawValue])
    }
}

