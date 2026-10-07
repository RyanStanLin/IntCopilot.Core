import Foundation
import Testing
@testable import IntCopilotCore

@Test func everyCapturedBusinessRequestEncodesOriginalContract() async throws {
    let records = try JSONDecoder().decode([JSONValue].self, from: fixtureData("RequestFixtures.json"))
    #expect(records.count == 157)
    for record in records {
        let descriptor = try APIContractCatalog.endpoint(id: try #require(record["endpoint"]?.stringValue))
        guard descriptor.platform == .parent || descriptor.platform == .teacher, descriptor.safety != .authentication, !descriptor.path.contains("vcodeMobileSend") else { continue }
        var requestQuery: [String: APIParameter] = [:]
        for (key, value) in record["query"]?.objectValue ?? [:] {
            let values = value.arrayValue ?? []
            if values.count == 1 { requestQuery[key] = parameter(values[0], key: key, path: descriptor.path) }
            else { requestQuery[key] = .list(values.map { parameter($0, key: key, path: descriptor.path) }) }
        }
        let requestBody = (record["body"]?.objectValue ?? [:]).mapValues { APIParameter.unverifiedRaw($0) }
        var selectedBody = requestBody
        for key in ["type","status","classType","courseType","taskTypeId","reasonId"] {
            if let value = record["body"]?[key], value != .null { selectedBody[key] = parameter(value, key: key, path: descriptor.path) }
        }
        let bindings = (record["path"]?.objectValue ?? [:]).compactMapValues(\.stringValue)
        let transport = MockTransport { request, _ in
            if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
            if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
            if request.url.path == "/api/semester/currentSchoolYear", descriptor.path != request.url.path { return jsonResponse("{\"schoolYearId\":400052}") }
            if let expected = record["body"], expected.objectValue != nil { let value = try body(request); #expect(value == expected) }
            for (key, values) in record["query"]?.objectValue ?? [:] {
                #expect(query(request)[key] == values.arrayValue?.last?.stringValue)
            }
            #expect(request.method == descriptor.method)
            var path = descriptor.path
            for (key, value) in record["path"]?.objectValue ?? [:] { path = path.replacingOccurrences(of: "{"+key+"}", with: value.stringValue ?? "") }
            #expect(request.url.path == path)
            return HTTPResponse(statusCode: 200)
        }
        let session = CoreSession(platform: descriptor.platform, environment: descriptor.platform == .parent ? .parentChengdu : .teacherChengdu, transport: transport, locale: .chinese, authentication: AuthenticationConfiguration())
        _ = try await session.login(.platformToken(PlatformToken("fixture-token")))
        _ = try await session.execute(descriptor, input: APIInput(query: requestQuery, body: selectedBody, path: bindings))
    }
}

private func parameter(_ value: JSONValue, key: String, path: String) -> APIParameter {
    if ["type","status","classType","courseType","taskTypeId","reasonId"].contains(key) {
        if case .bool(let value) = value { return .boolean(value) }
        return .selection(SemanticOption(rawValue: value, name: "Fixture option", domain: ParameterSemantics.domain(path: path, field: key) ?? "fixture:"+key))
    }
    return .unverifiedRaw(value)
}

@Test func everyDiscoveredRouteRetainsMethodParametersAndRisk() async throws {
    for descriptor in try APIContractCatalog.endpoints() where !descriptor.coveredByProvidedCaptures && descriptor.stability == .unstable && descriptor.safety != .authentication {
        #expect(descriptor.platform == .parent || descriptor.platform == .teacher)
        let transport = MockTransport { request, _ in
            if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
            if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
            if request.url.path == "/api/semester/currentSchoolYear" { return jsonResponse("{\"schoolYearId\":400052}") }
            #expect(request.method == descriptor.method)
            #expect(request.url.host == (descriptor.platform == .parent ? "pcd.intschool.cn" : "teacher.intschool.cn"))
            #expect(query(request)["fixtureQuery"] == "fixture-value")
            return jsonResponse("{}")
        }
        let session = CoreSession(platform: descriptor.platform, environment: descriptor.platform == .parent ? .parentChengdu : .teacherChengdu, transport: transport, locale: .chinese, authentication: AuthenticationConfiguration())
        _ = try await session.login(.platformToken(PlatformToken("fixture-token")))
        let result = try await session.experimental(descriptor, input: APIInput(query: ["fixtureQuery":.text("fixture-value")], path: ["pathSuffix":"400001"]))
        #expect(result.contract.stability == .unstable)
        #expect(!result.contract.coveredByProvidedCaptures)
        #expect(!result.contract.safetyConfirmed)
    }
}

@Test func experimentalPathSegmentsCannotEscapeEndpoint() async throws {
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        return HTTPResponse(statusCode: 200, body: Data("{}".utf8))
    }
    let client = ParentClient(transport: transport)
    _ = try await client.login(token: PlatformToken("fixture-token"))
    let endpoint = try #require(try client.experimental.endpoints().first { $0.path.contains("{pathSuffix}") })
    for suffix in ["../other", "%2e%2e/other", "part//other", "part?token=value", "part\\other"] {
        await #expect(throws: APIError.invalidParameter("pathSuffix")) {
            _ = try await client.experimental.invoke(endpoint, input: APIInput(path: ["pathSuffix":suffix]))
        }
    }
    let count = await transport.requests.count
    _ = try await client.experimental.invoke(endpoint, input: APIInput(path: ["pathSuffix":"part/400001"]))
    #expect(await transport.requests.count == count + 1)
}
