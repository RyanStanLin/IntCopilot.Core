import Foundation

public struct TeacherStudentScope: Sendable {
    /// 当前学生所属教师会话。
    private let session: CoreSession
    /// 已绑定学校的学生引用。
    public let student: Student
    init(session: CoreSession, student: Student) { self.session = session; self.student = student }
    private func call<R>(_ endpoint: CapturedEndpoint<R>, query: [String: APIParameter] = [:]) async throws -> R {
        try await session.requireSchool(student.schoolID)
        var query = query; if try endpoint.descriptor.queryParameters.contains("studentId") { query["studentId"] = .id(student.id) }
        return try await session.call(endpoint, input: APIInput(query: query), schoolID: student.schoolID)
    }
    public func details() async throws -> TeacherStudentDetailGETResponse { try await call(TeacherEndpoints.studentDetailGET) }
    public func timetable(in range: SchoolDateRange) async throws -> TeacherCurriculumStudentSchoolYearIdGETResponse { try await call(TeacherEndpoints.curriculumStudentSchoolYearIdGET, query: range.query()) }
    public func attendance(in range: SchoolDateRange) async throws -> TeacherAttendanceStatisticStudentSchoolYearIdGETResponse { try await call(TeacherEndpoints.attendanceStatisticStudentSchoolYearIdGET, query: range.query()) }
    public func classInformation() async throws -> TeacherStudentClassInfoGETResponse { try await call(TeacherEndpoints.studentClassInfoGET) }
    public func diary(page: PageRequest = PageRequest()) async throws -> TeacherDiaryByStudentGETResponse { try await call(TeacherEndpoints.diaryByStudentGET, query: page.parameters()) }
}
