import Foundation
import Testing
@testable import IntCopilotCore

@Test func parentPasswordAndDirectToken() async throws {
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/unify" {
            let value = try body(request)
            #expect(value["account"]?.stringValue == "demo-parent")
            #expect(value["password"]?.stringValue == "demo-password")
            return jsonResponse(testLogin)
        }
        #expect(request.url.path == "/api/login/schools")
        #expect(request.headers["X-Token"] == nil)
        return jsonResponse(testSchools)
    }
    let client = ParentClient(transport: transport)
    #expect(try await client.login(account: "demo-parent", password: "demo-password").selectedSchool?.id.rawValue == "400008")
    _ = try await client.login(token: PlatformToken("direct-token"))
    #expect(try await client.snapshot().token == "direct-token")
}

@Test func smsWrongCodeKeepsCookieAndAllowsRetry() async throws {
    let attempts = Counter()
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/vcodeMobileSend" { return jsonResponse("{\"success\":true}", headers: ["Set-Cookie":"challenge-cookie"]) }
        #expect(request.url.path == "/api/login/unify")
        let value = try body(request)
        #expect(value["account"]?.stringValue == "00000000000")
        if await attempts.next() == 1 { return jsonResponse("{\"success\":false,\"resCode\":1039}") }
        return jsonResponse(testLogin)
    }
    let client = ParentClient(transport: transport, authentication: AuthenticationConfiguration(policy: .automatic(maxAttempts: 0)))
    let sms = try await client.requestSMSCode(to: "00000000000")
    await #expect(throws: APIError.invalidVerificationCode) { try await sms.submit(code: "wrong") }
    #expect(await transport.cookies().first?.value == "challenge-cookie")
    _ = try await sms.submit(code: "correct")
    #expect(await attempts.value() == 2)
    #expect(await transport.requests.filter { $0.url.path == "/api/login/vcodeMobileSend" }.count == 1)
    await #expect(throws: APIError.staleSession) { try await sms.submit(code: "correct") }
}

@Test func smsExpiryRateLimitAndExplicitResend() async throws {
    let transport = MockTransport { request, index in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        if request.url.path == "/api/login/vcodeMobileSend" { return jsonResponse("{\"success\":true}", headers: ["Set-Cookie":"cookie-\(index)"]) }
        if index == 3 { return jsonResponse("{\"success\":false,\"resCode\":9998,\"msg\":\"Expired\"}") }
        if index == 4 { return jsonResponse("{\"msg\":\"Rate limited\"}", status: 429) }
        return jsonResponse(testLogin)
    }
    let client = ParentClient(transport: transport)
    let sms = try await client.requestSMSCode(to: "00000000000")
    await #expect(throws: APIError.backend(status: 200, code: 9998, message: "Expired")) { try await sms.submit(code: "old") }
    await #expect(throws: APIError.backend(status: 429, code: nil, message: "Rate limited")) { try await sms.submit(code: "old") }
    try await sms.resend()
    _ = try await sms.submit(code: "new")
    #expect(await transport.requests.count == 6)
}

@Test func teacherPortalOAuthApprovalAndExchange() async throws {
    let transport = MockTransport { request, _ in
        switch request.url.path {
        case "/login": return HTTPResponse(statusCode: 200)
        case "/api/login":
            #expect(request.headers["X-Token"] == nil)
            #expect(String(data: request.body!, encoding: .utf8)?.contains("password=demo%26password") == true)
            return HTTPResponse(statusCode: 302, headers: ["Location":"/"])
        case "/api/oauth/authorize":
            if request.method == .get {
                #expect(query(request)["redirect_uri"] == "https://teacher.intschool.cn/")
                return HTTPResponse(statusCode: 200, body: Data("<input name=\"user_oauth_approval\">".utf8))
            }
            return HTTPResponse(statusCode: 302, headers: ["Location":"https://teacher.intschool.cn/?access_token=sso-fixture"])
        case "/api/login/switchToken":
            #expect(query(request)["accessToken"] == "sso-fixture")
            #expect(request.headers["X-Token"] == nil)
            return jsonResponse(testLogin)
        case "/api/login/userInfo":
            #expect(request.headers["X-SchoolId"] == "400008")
            return jsonResponse("{\"teacherId\":400017}")
        default: throw APIError.invalidResponse(request.url.path)
        }
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(account: "demo-teacher", password: "demo&password")
    #expect(try await client.snapshot().teacherID?.rawValue == "400017")
    #expect(await transport.requests.count == 6)
}

@Test func teacherDirectTokenAndSSOTokenAreDifferent() async throws {
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/switchToken" { return jsonResponse(testLogin) }
        if request.url.path == "/api/login/userInfo" { return jsonResponse("{\"teacherId\":400017}") }
        return jsonResponse(testSchools)
    }
    let client = TeacherClient(transport: transport)
    _ = try await client.login(token: PlatformToken("platform-fixture"))
    #expect(await transport.requests.filter { $0.url.path == "/api/login/switchToken" }.isEmpty)
    _ = try await client.login(ssoAccessToken: "sso-fixture")
    #expect(await transport.requests.filter { $0.url.path == "/api/login/switchToken" }.count == 1)
}

@Test func concurrentRenewalIsSingleFlight() async throws {
    let callbacks = Counter()
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        return jsonResponse("[]")
    }
    let client = ParentClient(transport: transport, authentication: AuthenticationConfiguration(callback: { _ in
        _ = await callbacks.next()
        try await Task.sleep(for: .milliseconds(20))
        return .platformToken(PlatformToken("renewed-fixture"))
    }))
    _ = try await client.login(token: PlatformToken("expired-fixture", expiresAt: .distantPast))
    try await withThrowingTaskGroup(of: Void.self) { group in
        for _ in 0..<20 { group.addTask { _ = try await client.students() } }
        try await group.waitForAll()
    }
    #expect(await callbacks.value() == 1)
}

@Test func automaticReloginBudgetFallsBackToCallback() async throws {
    let passwords = Counter(); let callbacks = Counter()
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/unify" {
            if await passwords.next() == 1 { return jsonResponse(testLogin) }
            return jsonResponse("{}", status: 503)
        }
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        return request.headers["X-Token"] == "fixture-token" ? jsonResponse("{}", status: 401) : jsonResponse("[]")
    }
    let client = ParentClient(transport: transport, authentication: AuthenticationConfiguration(policy: .automatic(), callback: { context in
        #expect(context.automaticAttempts == 3); _ = await callbacks.next()
        return .platformToken(PlatformToken("recovered-fixture"))
    }))
    _ = try await client.login(account: "demo", password: "demo")
    _ = try await client.students()
    #expect(await passwords.value() == 4)
    #expect(await callbacks.value() == 1)
}

@Test func invalidPasswordImmediatelyUsesCallback() async throws {
    let passwords = Counter()
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/unify" {
            if await passwords.next() == 1 { return jsonResponse(testLogin) }
            return jsonResponse("{\"success\":false,\"resCode\":1010}")
        }
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        return request.headers["X-Token"] == "fixture-token" ? jsonResponse("{}", status: 401) : jsonResponse("[]")
    }
    let client = ParentClient(transport: transport, authentication: AuthenticationConfiguration(policy: .automatic(), callback: { context in
        #expect(context.automaticAttempts == 1)
        return .platformToken(PlatformToken("recovered-fixture"))
    }))
    _ = try await client.login(account: "demo", password: "demo")
    _ = try await client.students()
    #expect(await passwords.value() == 2)
}

@Test func logoutCannotBeUndoneByInFlightLogin() async throws {
    let started = Counter()
    let transport = MockTransport { request, _ in
        if request.url.path == "/api/login/schools" { return jsonResponse(testSchools) }
        _ = await started.next(); try await Task.sleep(for: .milliseconds(40)); return jsonResponse(testLogin)
    }
    let client = ParentClient(transport: transport)
    let task = Task { try await client.login(account: "demo", password: "demo") }
    while await started.value() == 0 { await Task.yield() }
    await client.logout()
    await #expect(throws: APIError.staleSession) { try await task.value }
    await #expect(throws: APIError.authenticationRequired) { try await client.snapshot() }
}

@Test func snapshotsRejectWrongPlatformAndFilterCookies() async throws {
    let transport = MockTransport { _, _ in jsonResponse(testSchools) }
    let client = ParentClient(transport: transport)
    _ = try await client.login(token: PlatformToken("snapshot-fixture"))
    let snapshot = try await client.snapshot()
    let teacher = TeacherClient(transport: transport)
    await #expect(throws: APIError.invalidParameter("快照平台或环境不匹配")) { try await teacher.restore(snapshot) }
    let fresh = MockTransport { _, _ in jsonResponse(testSchools) }
    let restored = ParentClient(transport: fresh)
    _ = try await restored.restore(snapshot)
    #expect(try await restored.snapshot().token == "snapshot-fixture")
}
