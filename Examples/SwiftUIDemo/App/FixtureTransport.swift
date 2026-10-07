import Foundation
import IntCopilotCore

actor FixtureTransport: HTTPTransport {
    private let platform: Platform
    private var jar: [SessionCookie] = []
    private let index: [JSONValue]
    init(platform: Platform) {
        self.platform = platform
        if let url = Bundle.main.url(forResource: "FixtureIndex", withExtension: "json", subdirectory: "Fixtures"), let data = try? Data(contentsOf: url), let value = try? JSONDecoder().decode([JSONValue].self, from: data) { index = value } else { index = [] }
    }
    func send(_ request: HTTPRequest) async throws -> HTTPResponse {
        let path = GuardedTransport.route(request.url)
        let schools = "[{\"schoolId\":400008,\"name\":\"示例学校（离线）\",\"enName\":\"Example School\",\"domain\":\"pcd.intschool.cn\"}]"
        if path == "/api/login/schools" { return json(schools) }
        if path == "/api/login/userInfo" { return json("{\"teacherId\":400017,\"name\":\"示例教师\"}") }
        if path == "/api/semester/currentSchoolYear" { return json("{\"schoolYearId\":400052,\"name\":\"示例学年\",\"startTime\":1735689600000,\"endTime\":1767139200000}") }
        if path == "/login" { return HTTPResponse(statusCode: 200) }
        if path == "/api/login", request.url.host == "kcschengdu.dipont.com" { jar = [SessionCookie(name: "JSESSIONID", value: "fixture-cookie", domain: "kcschengdu.dipont.com")]; return HTTPResponse(statusCode: 302, headers: ["Location":"/"]) }
        if path == "/api/oauth/authorize" { return HTTPResponse(statusCode: 302, headers: ["Location":"https://teacher.intschool.cn/?access_token=fixture-sso"]) }
        if path == "/api/login/switchToken" { return json("{\"success\":true,\"token\":\"fixture-token\",\"schools\":"+schools+"}") }
        if path == "/api/login/vcodeMobileSend" { jar = [SessionCookie(name: "JSESSIONID", value: "fixture-sms", domain: "pcd.intschool.cn")]; return json("{\"success\":true}") }
        if path == "/api/login/unify" {
            let body = try JSONDecoder().decode(JSONValue.self, from: request.body ?? Data("{}".utf8))
            if let code = body["vcode"]?.stringValue, code != "123456" { return json("{\"success\":false,\"resCode\":1039,\"msg\":\"验证码不正确\"}") }
            return json("{\"success\":true,\"token\":\"fixture-token\"}")
        }
        if let entry = index.first(where: { entry in
            guard let id = entry["endpoint"]?.stringValue else { return false }
            let parts = id.split(separator: ":", maxSplits: 2)
            return parts.count == 3 && parts[0] == platform.rawValue && parts[1] == request.method.rawValue && GuardedTransport.matches(String(parts[2]), path)
        }), let file = entry["file"]?.stringValue, let url = Bundle.main.url(forResource: file, withExtension: nil, subdirectory: "Fixtures") {
            return HTTPResponse(statusCode: 200, body: try Data(contentsOf: url))
        }
        if request.method != .get { return HTTPResponse(statusCode: 200) }
        throw APIError.invalidResponse("离线样本未覆盖此接口；不会转为真实网络请求")
    }
    func cookies() async -> [SessionCookie] { jar }
    func restoreCookies(_ values: [SessionCookie]) async { jar = values }
    func clearCookies() async { jar = [] }
    private func json(_ text: String) -> HTTPResponse { HTTPResponse(statusCode: 200, body: Data(text.utf8)) }
}
