import Foundation
import Testing
@testable import IntCopilotCore

@Test func parentAssignmentAndReportExamplesCarrySelectedIdentifiers() async throws {
    let tasks = try decodeFixture("parent-277.json", as: ParentTaskMergeListGETResponse.self)
    let assignment = try #require(tasks.items.first { $0.type.code == "1001" })
    let periods = try decodeFixture("parent-333.json", as: ParentMonthlyGradeMonthlyGradeByStudentGETResponse.self)
    let period = try #require(periods.first)
    let studentID = try #require(fixtureStudentID())
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/semester/currentSchoolYear" { return jsonResponse("{\"schoolYearId\":400052}") }
        #expect(query(request)["studentId"] == studentID)
        switch request.url.path {
        case "/api/task/mergeList": return HTTPResponse(statusCode: 200, body: try fixtureData("parent-277.json"))
        case "/api/task/detail":
            #expect(query(request)["taskStudentId"] == String(assignment.entityId))
            return HTTPResponse(statusCode: 200, body: try fixtureData("parent-286.json"))
        case "/api/monthly-grade/monthly-grade/by-student": return HTTPResponse(statusCode: 200, body: try fixtureData("parent-333.json"))
        case "/api/monthly-grade/report/detail":
            #expect(query(request)["gradePeriodId"] == String(period.gradePeriodId))
            return HTTPResponse(statusCode: 200, body: try fixtureData("parent-334.json"))
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = ParentClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let student = try Student(record: .object(["studentId":.string(studentID),"name":.string("Example student")]), schoolID: SchoolID("400008"))
    let scope = client.student(student)
    let page = try await scope.tasks()
    _ = try await exampleAssignmentDetails(client, selected: student, assignment: try #require(page.items.first { $0.type.code == "1001" }))
    let reports = try await scope.reportPeriods()
    _ = try await exampleStudentReport(client, selected: student, period: try #require(reports.first))
    let relevant = await transport.requests.map(\.url.path).filter { $0.hasPrefix("/api/task/") || $0.hasPrefix("/api/monthly-grade/") }
    #expect(relevant == ["/api/task/mergeList", "/api/task/detail", "/api/monthly-grade/monthly-grade/by-student", "/api/monthly-grade/report/detail"])
}

@Test func teacherAttendanceExampleUsesCoursePeriodRowAndSelectedStatus() async throws {
    var fixture = try JSONDecoder().decode(JSONValue.self, from: fixtureData("teacher-1245.json")).objectValue ?? [:]
    var attendances = fixture["attendances"]?.objectValue ?? [:]
    var items = attendances["items"]?.arrayValue ?? []
    var first = try #require(items.first?.objectValue)
    first["editable"] = .bool(true); first["locked"] = .bool(false)
    items[0] = .object(first); attendances["items"] = .array(items); fixture["attendances"] = .object(attendances)
    let data = try JSONEncoder().encode(JSONValue.object(fixture))
    let row = try JSONDecoder().decode(TeacherAttendanceClassGETResponse.self, from: data).attendances.items[0]
    let date = Date(timeIntervalSince1970: 1000)
    let transport = MockTransport { request, _ in
        switch request.url.path {
        case "/api/login/schools": return jsonResponse(testSchools)
        case "/api/login/userInfo": return jsonResponse("{\"teacherId\":400017}")
        case "/api/semester/currentSchoolYear": return jsonResponse("{\"schoolYearId\":400052}")
        case "/api/course/cascade/attendance":
            #expect(query(request)["type"] == "1001")
            return jsonResponse("[{\"key\":400200,\"value\":\"Example course\",\"subOptions\":[{\"key\":400300,\"value\":\"Example period\"}]}]")
        case "/api/attendance/attendance-status": return jsonResponse("[{\"value\":\"intime\",\"name\":\"出席\",\"enName\":\"Present\",\"permissions\":true}]")
        case "/api/attendance/class":
            if request.method == .put {
                let input = try body(request)
                #expect(input["studentId"] == .integer(row.studentId)); #expect(input["classArrangeId"] == .integer(row.classArrangeId))
                #expect(input["status"] == .string("intime"))
                return HTTPResponse(statusCode: 200)
            }
            #expect(query(request)["courseId"] == "400200"); #expect(query(request)["classPeriodId"] == "400300")
            #expect(query(request)["date"] == "1000000")
            return HTTPResponse(statusCode: 200, body: data)
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let course = try Course(record: .object(["key":.integer(400200),"value":.string("Example course")]), schoolID: SchoolID("400008"))
    let scope = client.course(course)
    let period = try #require(try await scope.periodOptions(on: date).first)
    let page = try await scope.attendance(on: date, period: period)
    let status = try #require(try await scope.attendanceStatuses().first)
    _ = try await exampleTeacherAttendance(client, selected: course, date: date, period: period, row: page.attendances.items[0], status: status)
    #expect(await transport.requests.filter { $0.url.path == "/api/attendance/class" }.map(\.method) == [.get, .put, .get])
}
