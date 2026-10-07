import Foundation
import Testing
@testable import IntCopilotCore

@Test func teacherGradeExampleUsesStudentTaskLinkAndPreservesTag() async throws {
    let index = try JSONDecoder().decode([JSONValue].self, from: fixtureData("FixtureIndex.json"))
    let detailFile = try #require(index.first { $0["endpoint"]?.stringValue == "teacher:GET:/api/task/student/detail" }?["file"]?.stringValue)
    let performanceFile = try #require(index.first { $0["endpoint"]?.stringValue == "teacher:GET:/api/task/performance" }?["file"]?.stringValue)
    let detail = try decodeFixture(detailFile, as: TeacherTaskStudentDetailGETResponse.self)
    let requests = try JSONDecoder().decode([JSONValue].self, from: fixtureData("RequestFixtures.json"))
    let detailRequest = try #require(requests.first { $0["capture"]?.stringValue == String(detailFile.dropFirst("teacher-".count).dropLast(".json".count)) })
    let linkedID = Int(try #require(detailRequest["query"]?["taskStudentId"]?.arrayValue?.first?.stringValue))
    let performance = try JSONDecoder().decode(JSONValue.self, from: fixtureData(performanceFile))
    var record = try #require(performance.arrayValue?.first?.objectValue)
    record["taskStudentId"] = .integer(try #require(linkedID))
    record["studentName"] = .string(detail.studentName)
    let submission = try JSONDecoder().decode(TeacherTaskPerformanceGETResponseItem.self, from: JSONEncoder().encode(JSONValue.object(record)))
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
        if request.url.path == "/api/task/student/detail" {
            #expect(query(request)["taskStudentId"] == String(submission.taskStudentId))
            return HTTPResponse(statusCode: 200, body: try fixtureData(detailFile))
        }
        if request.url.path == "/api/task/updateScore" {
            let value = try body(request)
            #expect(value["studentId"] == .integer(detail.studentId))
            #expect(value["taskId"] == .integer(detail.taskId))
            #expect(value["tag"] == detail.tag.rawValue)
            #expect(value["score"] == .integer(12))
            return HTTPResponse(statusCode: 200)
        }
        throw APIError.invalidResponse(request.url.path)
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let course = try Course(record: .object(["key":.integer(400200),"value":.string("Example course")]), schoolID: SchoolID("400008"))
    _ = try await exampleTeacherGrade(client, selected: course, submission: submission, score: 12, comment: "Example comment")
    #expect(await transport.requests.suffix(3).map(\.url.path) == ["/api/task/student/detail", "/api/task/updateScore", "/api/task/student/detail"])
}

@Test func diaryExampleEncodesSelectedHierarchyAndExplicitSharing() async throws {
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
        if request.url.path == "/api/diary/primary-type" { return jsonResponse("[{\"key\":400001,\"value\":\"Example type\",\"enValue\":\"Example type\",\"lowPoints\":1,\"highPoints\":5,\"special\":false}]") }
        if request.url.path == "/api/diary/entry-type" {
            #expect(query(request)["primaryTypeId"] == "400001")
            return jsonResponse("[{\"key\":400101,\"value\":\"Example subtype\",\"enValue\":\"Example subtype\"}]")
        }
        let value = try body(request)
        #expect(value["primaryTypeId"] == .integer(400001)); #expect(value["diaryEntryTypeId"] == .integer(400101))
        #expect(value["students"] == .array([.integer(407344)])); #expect(value["recordTime"] == .integer(1_000_000))
        #expect(value["shareWithParents"] == .bool(false)); #expect(value["shareWithStudents"] == .bool(false))
        return HTTPResponse(statusCode: 200)
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let primary = try #require(try await client.diaryTypes().first)
    let entry = try #require(try await client.diaryEntryTypes(for: primary).first)
    let student = try Student(record: .object(["studentId":.integer(407344),"name":.string("Example student")]), schoolID: SchoolID("400008"))
    _ = try await exampleDiary(client, selected: student, primary: primary, entry: entry, description: "Example", date: Date(timeIntervalSince1970: 1000), points: 3)
    #expect(await transport.requests.suffix(3).map(\.url.path) == ["/api/diary/primary-type", "/api/diary/entry-type", "/api/diary"])
    let wrong = SemanticOption(rawValue: .integer(400102), name: "Other subtype", domain: "diaryEntryType", dependencies: ["primaryTypeId":"400002"])
    await #expect(throws: APIError.invalidParameter("日记子类型属于其他主类型")) { try await exampleDiary(client, selected: student, primary: primary, entry: wrong, description: "Example", date: Date(), points: 3) }
}

@Test func messageExampleKeepsParentStudentAssociationAndNoAutomaticMail() async throws {
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
        if request.url.path == "/api/dropDown/message/receiver" {
            #expect(query(request)["queryType"] == "parent")
            return HTTPResponse(statusCode: 200, body: try fixtureData("teacher-1645.json"))
        }
        let value = try body(request)
        let target = try #require(value["toParents"]?.arrayValue?.first)
        #expect(target["parentId"]?.integerValue != nil); #expect(target["studentId"]?.integerValue != nil)
        #expect(value["sendMail"] == .bool(false)); #expect(value["sendTutor"] == .bool(false))
        return HTTPResponse(statusCode: 200)
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let page = try await client.parentRecipients()
    _ = try await exampleMessage(client, recipients: [try #require(page.recipients.first)], title: "Example", content: "Example")
    #expect(await transport.requests.suffix(2).map(\.url.path) == ["/api/dropDown/message/receiver", "/api/message/send"])
}

@Test func platformDynamicAttendanceLabelsOverrideStaticAndExposeAvailability() async throws {
    let index = try JSONDecoder().decode([JSONValue].self, from: fixtureData("FixtureIndex.json"))
    let file = try #require(index.first { $0["endpoint"]?.stringValue == "teacher:GET:/api/attendance/class" }?["file"]?.stringValue)
    var fixture = try JSONDecoder().decode(JSONValue.self, from: fixtureData(file)).objectValue ?? [:]
    var attendances = fixture["attendances"]?.objectValue ?? [:]
    var items = attendances["items"]?.arrayValue ?? []
    var first = try #require(items.first?.objectValue)
    first["status"] = .string("intime")
    items[0] = .object(first); attendances["items"] = .array(items); fixture["attendances"] = .object(attendances)
    let attendanceData = try JSONEncoder().encode(JSONValue.object(fixture))
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
        if request.url.path == "/api/semester/currentSchoolYear" { return jsonResponse("{\"schoolYearId\":400052}") }
        if request.url.path == "/api/attendance/attendance-status" { return jsonResponse("[{\"value\":\"intime\",\"name\":\"平台自定义出席\",\"enName\":\"Custom present\",\"permissions\":false}]") }
        return HTTPResponse(statusCode: 200, body: attendanceData)
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let value = try await client.call(TeacherEndpoints.attendanceClassGET)
    let present = value.attendances.items.first { $0.status.code == "intime" }
    let record = try #require(present)
    #expect(record.status.name == "平台自定义出席")
    #expect(record.status.enName == "Custom present")
    #expect(record.status.isEnabled == false)
}
