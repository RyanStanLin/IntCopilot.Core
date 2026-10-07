import Foundation
import Testing
@testable import IntCopilotCore

@Test func groupedTeacherOptionsUseTeacherIDsAndPreserveMemberships() async throws {
    let grouped = "[{\"groupLabel\":\"A2\",\"list\":[{\"teacherId\":101,\"teacherName\":\"Example Teacher\",\"relationId\":201,\"relationName\":\"Group A\",\"extra\":true}]},{\"groupLabel\":\"A1\",\"list\":[{\"teacherId\":101,\"teacherName\":\"Example Teacher\",\"relationId\":202,\"relationName\":\"Group B\"},{\"teacherId\":102,\"teacherName\":\"Second Teacher\",\"relationId\":203,\"relationName\":\"Group C\"}]}]"
    let transport = MockTransport { request, _ in
        switch request.url.path {
        case "/api/login/schools": return jsonResponse(testSchools)
        case "/api/login/userInfo": return jsonResponse("{\"teacherId\":400017}")
        case "/api/dropDown/tutors", "/api/dropDown/head-teachers": return jsonResponse(grouped)
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    for options in [try await client.options.tutors(), try await client.options.headTeachers()] {
        #expect(options.count == 2)
        #expect(Set(options.map(\.id)).count == 2)
        #expect(options[0].rawValue == .integer(101))
        #expect(options[0].name == "Example Teacher（Group A、Group B）")
        #expect(options[0].schoolID == SchoolID("400008"))
        let records = try #require(options[0].record["memberships"]?.arrayValue)
        #expect(records.count == 2)
        #expect(records[0]["relationId"] == .integer(201))
        #expect(records[0]["groupLabel"] == .string("A2"))
        #expect(records[0]["extra"] == .bool(true))
    }
}

@Test func capturedGroupedTeacherDictionariesDecodeThroughService() async throws {
    let transport = MockTransport { request, _ in
        switch request.url.path {
        case "/api/login/schools": return jsonResponse(testSchools)
        case "/api/login/userInfo": return jsonResponse("{\"teacherId\":400017}")
        case "/api/dropDown/tutors": return HTTPResponse(statusCode: 200, body: try fixtureData("teacher-1623.json"))
        case "/api/dropDown/head-teachers": return HTTPResponse(statusCode: 200, body: try fixtureData("teacher-1621.json"))
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let tutors = try await client.options.tutors(), heads = try await client.options.headTeachers()
    #expect(!tutors.isEmpty && !heads.isEmpty)
    #expect(tutors.allSatisfy { !$0.name.isEmpty && $0.record["memberships"]?.arrayValue?.isEmpty == false })
    #expect(heads.allSatisfy { $0.record["teacherId"] == $0.rawValue })
}
