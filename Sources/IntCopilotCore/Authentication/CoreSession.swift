import Foundation

actor CoreSession {
    /// 所属业务平台，防止跨平台调用端点。
    let platform: Platform
    /// 平台与门户受信任地址配置。
    let environment: ClientEnvironment
    /// 注入式传输，不与其他客户端共享会话。
    let transport: any HTTPTransport
    /// 自动重登与 App 回调策略。
    private let authentication: AuthenticationConfiguration
    /// 当前请求使用的语言。
    private var locale: APILocale
    /// 已登录 Token；为空表示未登录。
    private var token: String?
    /// Token 过期提示；不会将未验证的 JWT 声明作为授权依据。
    private var expiresAt: Date?
    /// 学校上下文；教师来自认证账号，家长来自公开入口域名配置。
    private var schools: [School] = []
    /// 当前学校，多个学校时需要调用方选择。
    private var selectedSchool: School?
    /// 当前学校的教师标识。
    private var teacherID: TeacherID?
    /// 完整用户信息。
    private var userInfo: JSONValue?
    /// 仅当启用自动重登时保留的密码凭据。
    private var retainedCredentials: PasswordCredentials?
    /// 登出、账号切换和显式登录时递增的会话版本。
    private var generation = 0
    /// 学校上下文版本，防止切回原学校后旧请求再次生效。
    private var schoolRevision = 0
    /// 当前短信挑战；密码登录、登出或挑战完成会使旧句柄失效。
    private var pendingSMS: (id: UUID, mobile: String, areaCode: String, revision: Int)?
    /// 当前提交操作标识，防止并发验证码请求互相覆盖。
    private var smsSubmission: UUID?
    /// 并发请求共同等待的唯一认证恢复任务。
    private var renewal: Task<Void, any Error>?
    /// 按会话和学校隔离的选项与学年缓存。
    private var cache: [String: (Date, JSONValue)] = [:]
    /// 家长入口域名对应的公开学校配置；不含账号权限或认证材料。
    private var parentSchool: School?
    /// 按当前学校和语言获得的动态语义字典。
    private var semanticOptions: [String: [String: SemanticOption]] = [:]

    init(platform: Platform, environment: ClientEnvironment, transport: any HTTPTransport, locale: APILocale, authentication: AuthenticationConfiguration) {
        self.platform = platform; self.environment = environment; self.transport = transport
        self.locale = locale; self.authentication = authentication
    }

    func login(_ material: AuthenticationMaterial) async throws -> LoginResult {
        generation += 1
        let expected = generation
        renewal?.cancel(); renewal = nil
        resetState()
        await transport.clearCookies()
        guard generation == expected else { throw APIError.staleSession }
        let candidate = try await authenticate(material)
        try await commit(candidate, material: material, expected: expected)
        return LoginResult(schools: schools, selectedSchool: selectedSchool, expiresAt: expiresAt)
    }

    func logout() async {
        generation += 1; renewal?.cancel(); renewal = nil
        resetState()
        await transport.clearCookies()
    }

    private func resetState() {
        token = nil; expiresAt = nil; schools = []; selectedSchool = nil
        teacherID = nil; userInfo = nil; retainedCredentials = nil; cache = [:]
        pendingSMS = nil; smsSubmission = nil; semanticOptions = [:]; schoolRevision += 1
    }

    func setLocale(_ value: APILocale) { locale = value; cache = [:]; semanticOptions = [:] }
    func availableSchools() -> [School] { schools }
    func schoolID() throws -> SchoolID {
        guard let selectedSchool else { throw APIError.schoolSelectionRequired }; return selectedSchool.id
    }
    func requireSchool(_ id: SchoolID) throws {
        guard selectedSchool?.id == id else { throw APIError.invalidParameter("此业务引用属于另一学校，请重新选择上下文") }
    }

    func selectSchool(_ school: School) async throws {
        guard schools.contains(where: { $0.id == school.id }) else { throw APIError.permissionDenied }
        schoolRevision += 1
        selectedSchool = school; cache = [:]; semanticOptions = [:]; teacherID = nil; userInfo = nil
        if platform == .teacher {
            let expected = generation
            let info = try await json(path: "/api/login/userInfo", safety: .readOnly)
            guard generation == expected, selectedSchool?.id == school.id else { throw APIError.staleSession }
            userInfo = info; teacherID = info["teacherId"]?.stringValue.map(TeacherID.init)
        }
    }

    func snapshot() async throws -> SessionSnapshot {
        guard let token else { throw APIError.authenticationRequired }
        let expected = generation
        let cookies = await transport.cookies()
        guard generation == expected else { throw APIError.staleSession }
        return SessionSnapshot(version: 1, platform: platform, environment: environment, token: token, expiresAt: expiresAt, schools: schools, selectedSchoolID: selectedSchool?.id, teacherID: teacherID, userInfo: userInfo, cookies: cookies)
    }

    func restore(_ snapshot: SessionSnapshot) async throws -> LoginResult {
        guard snapshot.version == 1, snapshot.platform == platform, snapshot.environment == environment else { throw APIError.invalidParameter("快照平台或环境不匹配") }
        generation += 1; let expected = generation
        renewal?.cancel(); renewal = nil; resetState()
        let hosts = [environment.baseURL.host, environment.portalURL?.host].compactMap { $0 }
        let cookies = snapshot.cookies.filter { cookie in
            hosts.contains { host in host == cookie.domain || (cookie.domain.hasPrefix(".") && (host == String(cookie.domain.dropFirst()) || host.hasSuffix(cookie.domain))) }
        }
        await transport.restoreCookies(cookies)
        let material = AuthenticationMaterial.platformToken(PlatformToken(snapshot.token, expiresAt: snapshot.expiresAt))
        let candidate = try await authenticate(material)
        try await commit(candidate, material: material, expected: expected)
        if let id = snapshot.selectedSchoolID, let school = schools.first(where: { $0.id == id }) { try await selectSchool(school) }
        return LoginResult(schools: schools, selectedSchool: selectedSchool, expiresAt: expiresAt)
    }

    func currentSchoolYear() async throws -> SchoolYearID {
        let result = try await json(path: "/api/semester/currentSchoolYear", safety: .readOnly, cached: true)
        guard let id = result["schoolYearId"]?.stringValue else { throw APIError.invalidResponse("当前学年缺少标识") }
        return SchoolYearID(id)
    }

    func refreshOptions() { cache = [:]; semanticOptions = [:] }

    func call<Response>(_ endpoint: CapturedEndpoint<Response>, input: APIInput, schoolID: SchoolID? = nil) async throws -> Response {
        let descriptor = try endpoint.descriptor
        guard descriptor.platform == platform, descriptor.stability == .stable else { throw APIError.unsafeEndpoint(descriptor.id) }
        if let schoolID { try requireSchool(schoolID) }
        let revision = schoolRevision
        if descriptor.path.hasPrefix("/api/attendance/"), !descriptor.path.contains("leave-application"), descriptor.path != "/api/attendance/attendance-status" {
            let year = try await currentSchoolYear()
            _ = try await json(path: "/api/attendance/attendance-status", query: ["schoolYearId":.id(year)], cached: true, schoolID: schoolID)
        }
        guard revision == schoolRevision else { throw APIError.staleSession }
        let response = try await execute(descriptor, input: input, schoolID: schoolID)
        if Response.self == MutationAcknowledgement.self {
            let value = (try? JSONDecoder().decode(JSONValue.self, from: response.body)) ?? .null
            return MutationAcknowledgement(accepted: true, statusCode: response.statusCode, response: value) as! Response
        }
        guard !response.body.isEmpty else { throw APIError.invalidResponse("预期 JSON 响应，实际为空") }
        if let raw = try? JSONDecoder().decode(JSONValue.self, from: response.body) { registerSemantics(raw, path: descriptor.path) }
        let decoder = JSONDecoder(); decoder.userInfo[semanticDictionaryKey] = semanticOptions
        return try decoder.decode(Response.self, from: response.body)
    }

    func experimental(_ descriptor: EndpointDescriptor, input: APIInput) async throws -> ExperimentalResult {
        guard descriptor.platform == platform else { throw APIError.permissionDenied }
        guard try APIContractCatalog.endpoint(id: descriptor.id) == descriptor else { throw APIError.unsafeEndpoint("端点元数据与目录不一致") }
        guard descriptor.safety != .authentication else { throw APIError.unsafeEndpoint("认证端点请使用专用登录流程") }
        let response = try await execute(descriptor, input: input)
        return ExperimentalResult(value: (try? JSONDecoder().decode(JSONValue.self, from: response.body)) ?? .null, data: response.body, contract: descriptor, statusCode: response.statusCode)
    }

    func execute(_ descriptor: EndpointDescriptor, input: APIInput, schoolID: SchoolID? = nil) async throws -> HTTPResponse {
        if let schoolID { try requireSchool(schoolID) }
        let expectedSchoolRevision = schoolRevision
        var query = input.query; var path = descriptor.path
        if (descriptor.queryParameters.contains("schoolYearId") && query["schoolYearId"] == nil) || (path.contains("{schoolYearId}") && input.path["schoolYearId"] == nil) {
            let year = try await currentSchoolYear()
            if descriptor.queryParameters.contains("schoolYearId") && query["schoolYearId"] == nil { query["schoolYearId"] = .id(year) }
            path = path.replacingOccurrences(of: "{schoolYearId}", with: year.rawValue)
        }
        for (key, value) in input.path {
            let segments = value.split(separator: "/", omittingEmptySubsequences: false)
            guard !value.isEmpty, (key == "pathSuffix" || segments.count == 1), segments.allSatisfy({ !$0.isEmpty && $0 != "." && $0 != ".." }), !value.contains("%"), !value.contains("\\"), !value.contains("?"), !value.contains("#"), !value.unicodeScalars.contains(where: { CharacterSet.controlCharacters.contains($0) }) else { throw APIError.invalidParameter(key) }
            path = path.replacingOccurrences(of: "{"+key+"}", with: value)
        }
        guard !path.contains("{") else { throw APIError.missingParameter("路径参数："+path) }
        if descriptor.stability == .stable {
            for (key, value) in query.merging(input.body, uniquingKeysWith: { _, body in body }) where ["type","status","classType","courseType","taskTypeId","reasonId"].contains(key) {
                switch value {
                case .selection(let option):
                    guard option.isEnabled else { throw APIError.permissionDenied }
                    if let domain = ParameterSemantics.domain(path: descriptor.path, field: key), option.domain != domain { throw APIError.invalidParameter(key + " 的语义选项属于另一业务域") }
                case .boolean: break
                default: throw APIError.invalidParameter(key+" 必须使用带语义名称的 selection")
                }
            }
        }
        guard expectedSchoolRevision == schoolRevision else { throw APIError.staleSession }
        try query.values.forEach { try $0.validate(school: selectedSchool?.id) }
        try input.body.values.forEach { try $0.validate(school: selectedSchool?.id) }
        var body: [String: JSONValue] = [:]
        for (key, parameter) in input.body {
            var value = parameter.json
            if descriptor.bodyFieldTypes[key] == "int", let integer = value.integerValue { value = .integer(integer) }
            if descriptor.bodyFieldTypes[key] == "string", let string = value.stringValue { value = .string(string) }
            body[key] = value
        }
        return try await send(path: path, method: descriptor.method, query: query, body: input.body.isEmpty && !descriptor.expectsJSONBody ? nil : .object(body), safety: descriptor.safety)
    }

    func json(path: String, method: HTTPMethod = .get, query: [String: APIParameter] = [:], body: JSONValue? = nil, safety: OperationSafety = .readOnly, cached: Bool = false, schoolID: SchoolID? = nil) async throws -> JSONValue {
        if let schoolID { try requireSchool(schoolID) }
        let expected = schoolRevision
        let key = (selectedSchool?.id.rawValue ?? "none")+":"+locale.rawValue+":"+path+":"+query.sorted(by: {$0.key < $1.key}).map { $0.key+"="+($0.value.json.stringValue ?? "") }.joined(separator: "&")
        if cached, let value = cache[key], Date().timeIntervalSince(value.0) < 300 { return value.1 }
        let response = try await send(path: path, method: method, query: query, body: body, safety: safety)
        let result = response.body.isEmpty ? JSONValue.null : try JSONDecoder().decode(JSONValue.self, from: response.body)
        guard schoolRevision == expected else { throw APIError.staleSession }
        registerSemantics(result, path: path)
        if cached { cache[key] = (Date(), result) }
        return result
    }

    private func registerSemantics(_ value: JSONValue, path: String) {
        let records = path == "/api/attendance/attendance-status" ? value.arrayValue : value["kinds"]?.arrayValue
        guard let records else { return }
        for record in records {
            if let option = try? SemanticOption.from(record, domain: "attendanceStatus", idField: "value", nameField: "name", englishField: "enName", schoolID: selectedSchool?.id), let key = option.rawValue.stringValue {
                semanticOptions["attendanceStatus", default: [:]][key] = option
            }
        }
    }

    func send(path: String, method: HTTPMethod, query: [String: APIParameter], body: JSONValue?, safety: OperationSafety) async throws -> HTTPResponse {
        guard token != nil else { throw APIError.authenticationRequired }
        if let expiry = expiresAt, expiry.timeIntervalSinceNow <= authentication.expiryLeeway { try await renew(reason: .expired) }
        guard let firstToken = token else { throw APIError.authenticationRequired }
        guard let school = selectedSchool else { throw APIError.schoolSelectionRequired }
        let expected = generation
        let expectedSchoolRevision = schoolRevision
        let schoolID = school.id
        let request = try makeRequest(base: environment.baseURL, path: path, method: method, query: query, body: body, token: firstToken, school: schoolID)
        var response = try await transport.send(request)
        guard generation == expected, schoolRevision == expectedSchoolRevision, selectedSchool?.id == schoolID else { throw APIError.staleSession }
        if response.statusCode == 401 && safety == .readOnly {
            if token == firstToken { try await renew(reason: .unauthorized) }
            guard let token, selectedSchool?.id == schoolID else { throw APIError.staleSession }
            response = try await transport.send(makeRequest(base: environment.baseURL, path: path, method: method, query: query, body: body, token: token, school: schoolID))
            guard generation == expected, schoolRevision == expectedSchoolRevision, selectedSchool?.id == schoolID else { throw APIError.staleSession }
        }
        try Self.validate(response)
        if safety == .externalEffect { cache = [:]; semanticOptions = [:] }
        return response
    }

    private func renew(reason: ReauthenticationReason) async throws {
        if let renewal { return try await renewal.value }
        let expected = generation
        let task = Task { try await self.performRenewal(reason: reason, expected: expected) }
        renewal = task
        do { try await task.value; if generation == expected { renewal = nil } }
        catch { if generation == expected { renewal = nil }; throw error }
    }

    private func performRenewal(reason: ReauthenticationReason, expected: Int) async throws {
        var attempts = 0; var lastError: (any Error)?
        let previousSchool = selectedSchool?.id
        let expectedSchoolRevision = schoolRevision
        if case .automatic(let maxAttempts) = authentication.policy, let credentials = retainedCredentials {
            guard maxAttempts >= 0 else { throw APIError.invalidParameter("maxAttempts") }
            for _ in 0..<maxAttempts {
                attempts += 1
                do {
                    let material = AuthenticationMaterial.password(credentials)
                    let candidate = try await authenticate(material)
                    try await commit(candidate, material: material, expected: expected, preferredSchool: previousSchool, expectedSchoolRevision: expectedSchoolRevision)
                    return
                } catch {
                    try Task.checkCancellation()
                    guard generation == expected else { throw APIError.staleSession }
                    lastError = error
                    if !Self.isTransient(error) { break }
                }
            }
        }
        guard let callback = authentication.callback else { throw APIError.authenticationRequired }
        let material = try await callback(ReauthenticationContext(platform: platform, reason: reason, automaticAttempts: attempts, lastError: lastError))
        guard generation == expected else { throw APIError.staleSession }
        let candidate = try await authenticate(material)
        try await commit(candidate, material: material, expected: expected, preferredSchool: previousSchool, expectedSchoolRevision: expectedSchoolRevision)
    }

    private static func isTransient(_ error: any Error) -> Bool {
        if let error = error as? URLError { return [.timedOut, .networkConnectionLost, .notConnectedToInternet, .cannotConnectToHost, .cannotFindHost].contains(error.code) }
        if case APIError.backend(let status, _, _) = error { return status >= 500 && status <= 599 }
        return false
    }

    private struct Candidate {
        /// 已成功认证的候选 Token，尚未提交到当前会话。
        let token: String
        /// 候选 Token 过期时刻。
        let expiresAt: Date?
        /// 认证响应附带的学校列表，可避免额外查询。
        let schools: JSONValue?
    }

    private func authenticate(_ material: AuthenticationMaterial) async throws -> Candidate {
        switch material {
        case .platformToken(let token):
            guard !token.value.isEmpty else { throw APIError.invalidParameter("Token 为空") }
            return Candidate(token: token.value, expiresAt: token.expiresAt ?? Self.jwtExpiry(token.value), schools: nil)
        case .teacherSSOToken(let value):
            guard platform == .teacher else { throw APIError.unsupportedAuthentication }
            return try await exchangeSSO(value)
        case .password(let credentials):
            guard !credentials.account.isEmpty, !credentials.password.isEmpty else { throw APIError.invalidCredentials }
            if platform == .teacher { return try await portalLogin(credentials) }
            let school = try await parentSchoolConfiguration()
            let request = try makeRequest(base: environment.baseURL, path: "/api/login/unify", method: .post, body: .object(["account":.string(credentials.account),"password":.string(credentials.password)]), school: school.id)
            let response = try await transport.send(request)
            return try Self.candidate(response)
        }
    }

    private func exchangeSSO(_ value: String) async throws -> Candidate {
        guard !value.isEmpty else { throw APIError.invalidParameter("SSO Token 为空") }
        return try Self.candidate(await transport.send(makeRequest(base: environment.baseURL, path: "/api/login/switchToken", query: ["accessToken":.text(value)])))
    }

    private func portalLogin(_ credentials: PasswordCredentials) async throws -> Candidate {
        guard let portal = environment.portalURL, let tenant = environment.tenantID, let client = environment.oauthClientID else { throw APIError.unsupportedAuthentication }
        _ = try await transport.send(makeRequest(base: portal, path: "/login"))
        let form = ["loginType":environment.portalLoginType,"username":credentials.account,"tenant":tenant,"password":credentials.password]
        let login = try await transport.send(formRequest(base: portal, path: "/api/login", fields: form))
        guard [302,303].contains(login.statusCode), let location = login.header("Location"), let redirect = URL(string: location, relativeTo: portal)?.absoluteURL, Self.sameOrigin(redirect, portal) else {
            if login.statusCode == 200 { throw APIError.unsupportedAuthentication }; try Self.validate(login); throw APIError.invalidRedirect
        }
        if URLComponents(url: redirect, resolvingAgainstBaseURL: false)?.queryItems?.contains(where: {$0.name == "error"}) == true { throw APIError.invalidCredentials }
        var authorize = try await transport.send(makeRequest(base: portal, path: "/api/oauth/authorize", query: ["response_type":.text("token"),"client_id":.text(client),"scope":.text("all"),"redirect_uri":.text(environment.baseURL.appendingPathComponent("/").absoluteString)]))
        if authorize.statusCode == 200 {
            guard String(data: authorize.body, encoding: .utf8)?.contains("user_oauth_approval") == true else { throw APIError.unsupportedAuthentication }
            authorize = try await transport.send(formRequest(base: portal, path: "/api/oauth/authorize", fields: ["user_oauth_approval":"true"]))
        }
        guard [302,303].contains(authorize.statusCode), let location = authorize.header("Location"), let target = URL(string: location, relativeTo: portal)?.absoluteURL, Self.sameOrigin(target, environment.baseURL) else { throw APIError.invalidRedirect }
        let components = URLComponents(url: target, resolvingAgainstBaseURL: false)
        var values = components?.queryItems ?? []
        if let fragment = components?.fragment { values += URLComponents(string: "https://example.invalid/?"+fragment)?.queryItems ?? [] }
        guard let accessToken = values.first(where: {$0.name == "access_token"})?.value else { throw APIError.invalidRedirect }
        return try await exchangeSSO(accessToken)
    }

    private func commit(_ candidate: Candidate, material: AuthenticationMaterial, expected: Int, preferredSchool: SchoolID? = nil, expectedSchoolRevision: Int? = nil) async throws {
        let schoolsValue: JSONValue
        if platform == .parent { schoolsValue = .array([try await parentSchoolConfiguration().record]) }
        else if let value = candidate.schools, let array = value.arrayValue, !array.isEmpty { schoolsValue = value }
        else {
            let response = try await transport.send(makeRequest(base: environment.baseURL, path: "/api/login/schools", token: candidate.token))
            try Self.validate(response); schoolsValue = try JSONDecoder().decode(JSONValue.self, from: response.body)
        }
        guard let array = schoolsValue.arrayValue else { throw APIError.invalidResponse("学校列表不是数组") }
        let candidateSchools = try array.map(School.init)
        guard !candidateSchools.isEmpty else { throw APIError.noAccessibleSchool }
        let selected = preferredSchool.flatMap { id in candidateSchools.first { $0.id == id } } ?? (candidateSchools.count == 1 ? candidateSchools[0] : nil)
        var candidateUser: JSONValue?
        if platform == .teacher, let selected {
            let response = try await transport.send(makeRequest(base: environment.baseURL, path: "/api/login/userInfo", token: candidate.token, school: selected.id))
            try Self.validate(response); candidateUser = try JSONDecoder().decode(JSONValue.self, from: response.body)
        }
        guard generation == expected, expectedSchoolRevision == nil || expectedSchoolRevision == schoolRevision else { throw APIError.staleSession }
        token = candidate.token; expiresAt = candidate.expiresAt; schools = candidateSchools; selectedSchool = selected
        userInfo = candidateUser; teacherID = candidateUser?["teacherId"]?.stringValue.map(TeacherID.init); cache = [:]; semanticOptions = [:]
        if case .automatic(let attempts) = authentication.policy, attempts > 0, case .password(let credentials) = material { retainedCredentials = credentials }
        else { retainedCredentials = nil }
    }

    private func parentSchoolConfiguration() async throws -> School {
        if let parentSchool { return parentSchool }
        let response = try await transport.send(makeRequest(base: environment.baseURL, path: "/api/login/schools"))
        try Self.validate(response)
        let value = try JSONDecoder().decode(JSONValue.self, from: response.body)
        guard let records = value.arrayValue else { throw APIError.invalidResponse("家长学校配置不是数组") }
        let matching = records.filter { $0["domain"]?.stringValue == environment.baseURL.host }
        guard matching.count == 1 else { throw APIError.invalidResponse("没有唯一匹配家长入口域名的学校配置") }
        let school = try School(record: matching[0]); parentSchool = school
        return school
    }

    func startSMS(to mobile: String, areaCode: String) async throws -> UUID {
        generation += 1; renewal?.cancel(); renewal = nil; resetState()
        let expected = generation
        await transport.clearCookies()
        guard generation == expected else { throw APIError.staleSession }
        let id = UUID()
        pendingSMS = (id, mobile, areaCode, 0)
        try await smsCode(to: mobile, areaCode: areaCode, challenge: id)
        return id
    }

    func smsCode(to mobile: String, areaCode: String, challenge: UUID) async throws {
        guard platform == .parent, !mobile.isEmpty, !areaCode.isEmpty else { throw APIError.invalidParameter("手机号或地区区号") }
        guard var pending = pendingSMS, pending.id == challenge, pending.mobile == mobile, pending.areaCode == areaCode else { throw APIError.staleSession }
        pending.revision += 1; pendingSMS = pending
        let expected = generation
        let school = try await parentSchoolConfiguration()
        guard generation == expected else { throw APIError.staleSession }
        let response = try await transport.send(makeRequest(base: environment.baseURL, path: "/api/login/vcodeMobileSend", query: ["areaCode":.text(areaCode),"mobile":.text(mobile)], school: school.id))
        guard generation == expected, pendingSMS?.id == challenge else { throw APIError.staleSession }
        try Self.validate(response)
    }

    func smsLogin(mobile: String, areaCode: String, code: String, challenge: UUID) async throws -> LoginResult {
        guard platform == .parent, !code.isEmpty else { throw APIError.invalidVerificationCode }
        guard let pending = pendingSMS, pending.id == challenge, pending.mobile == mobile, pending.areaCode == areaCode else { throw APIError.staleSession }
        guard smsSubmission == nil else { throw APIError.invalidParameter("验证码正在提交，请等待结果") }
        let operation = UUID(); smsSubmission = operation
        defer { if smsSubmission == operation { smsSubmission = nil } }
        let expected = generation
        let school = try await parentSchoolConfiguration()
        guard generation == expected else { throw APIError.staleSession }
        let response = try await transport.send(makeRequest(base: environment.baseURL, path: "/api/login/unify", method: .post, body: .object(["account":.string(mobile),"areaCode":.string(areaCode),"vcode":.string(code)]), school: school.id))
        guard generation == expected, pendingSMS?.id == challenge, pendingSMS?.revision == pending.revision else { throw APIError.staleSession }
        let candidate = try Self.candidate(response)
        generation += 1; pendingSMS = nil
        try await commit(candidate, material: .platformToken(PlatformToken(candidate.token, expiresAt: candidate.expiresAt)), expected: generation)
        return LoginResult(schools: schools, selectedSchool: selectedSchool, expiresAt: expiresAt)
    }

    private static func candidate(_ response: HTTPResponse) throws -> Candidate {
        try validate(response)
        let value = try JSONDecoder().decode(JSONValue.self, from: response.body)
        if value["extraMsg"]?.boolValue == true { throw APIError.unsupportedAuthentication }
        guard value["success"]?.boolValue == true, let token = value["token"]?.stringValue, !token.isEmpty else { throw APIError.invalidResponse("认证成功响应缺少 Token") }
        return Candidate(token: token, expiresAt: jwtExpiry(token), schools: value["schools"])
    }

    static func validate(_ response: HTTPResponse) throws {
        if response.statusCode == 401 { throw APIError.authenticationRequired }
        if response.statusCode == 403 { throw APIError.permissionDenied }
        let value = try? JSONDecoder().decode(JSONValue.self, from: response.body)
        let code = value?["resCode"]?.integerValue
        if value?["success"]?.boolValue == false {
            if code == 1010 { throw APIError.invalidCredentials }
            if code == 1039 { throw APIError.invalidVerificationCode }
            throw APIError.backend(status: response.statusCode, code: code, message: value?["msg"]?.stringValue ?? value?["resMsg"]?.stringValue ?? "业务操作被拒绝")
        }
        guard (200...299).contains(response.statusCode) else {
            throw APIError.backend(status: response.statusCode, code: code, message: value?["msg"]?.stringValue ?? value?["message"]?.stringValue ?? "HTTP 请求失败")
        }
    }

    private static func jwtExpiry(_ token: String) -> Date? {
        let parts = token.split(separator: ".")
        guard parts.count == 3 else { return nil }
        var payload = String(parts[1]).replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
        payload += String(repeating: "=", count: (4-payload.count%4)%4)
        guard let data = Data(base64Encoded: payload), let value = try? JSONDecoder().decode(JSONValue.self, from: data), let seconds = value["exp"]?.integerValue else { return nil }
        return Date(timeIntervalSince1970: Double(seconds))
    }

    private static func sameOrigin(_ a: URL, _ b: URL) -> Bool { a.scheme == b.scheme && a.host == b.host && (a.port ?? 443) == (b.port ?? 443) }

    private func makeRequest(base: URL, path: String, method: HTTPMethod = .get, query: [String: APIParameter] = [:], body: JSONValue? = nil, token: String? = nil, school: SchoolID? = nil) throws -> HTTPRequest {
        guard path.hasPrefix("/"), !path.hasPrefix("//"), !path.contains(".."), !path.contains("?"), !path.contains("#"), var components = URLComponents(url: base, resolvingAgainstBaseURL: false) else { throw APIError.invalidParameter("请求路径") }
        components.path = path
        var items: [URLQueryItem] = []
        try query.values.forEach { try $0.validate(school: school ?? selectedSchool?.id) }
        for (key, value) in query.sorted(by: {$0.key < $1.key}) {
            if case .array(let values) = value.json {
                items += values.compactMap { $0.stringValue }.map { URLQueryItem(name: key, value: $0) }
            } else { items.append(URLQueryItem(name: key, value: value.json.stringValue)) }
        }
        components.queryItems = items.isEmpty ? nil : items
        guard let url = components.url else { throw APIError.invalidParameter("请求 URL") }
        var headers = ["Accept":"application/json","X-Locale":locale.rawValue]
        if let token { headers["X-Token"] = token }; if let school { headers["X-SchoolId"] = school.rawValue }
        let data = try body.map { try JSONEncoder().encode($0) }
        if data != nil { headers["Content-Type"] = "application/json;charset=UTF-8" }
        return HTTPRequest(url: url, method: method, headers: headers, body: data)
    }

    private func formRequest(base: URL, path: String, fields: [String: String]) throws -> HTTPRequest {
        var request = try makeRequest(base: base, path: path, method: .post)
        let allowed = CharacterSet.alphanumerics.union(CharacterSet(charactersIn: "-._~"))
        request.body = fields.sorted(by: {$0.key < $1.key}).map { ($0.key.addingPercentEncoding(withAllowedCharacters: allowed) ?? "")+"="+($0.value.addingPercentEncoding(withAllowedCharacters: allowed) ?? "") }.joined(separator: "&").data(using: .utf8)
        request.headers["Content-Type"] = "application/x-www-form-urlencoded"
        return request
    }
}
