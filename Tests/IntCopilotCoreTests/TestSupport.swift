import Foundation
import Testing
@testable import IntCopilotCore

func fixtureData(_ filename: String) throws -> Data {
    guard let url = Bundle.module.url(forResource: filename, withExtension: nil) else { throw APIError.invalidResponse("Missing fixture: " + filename) }
    return try Data(contentsOf: url)
}

func decodeFixture<T: Codable>(_ filename: String, as type: T.Type) throws -> T {
    let data = try fixtureData(filename)
    let result = try JSONDecoder().decode(type, from: data)
    let roundTrip = try JSONEncoder().encode(result)
    #expect(try JSONDecoder().decode(JSONValue.self, from: data) == JSONDecoder().decode(JSONValue.self, from: roundTrip), Comment(rawValue: filename))
    return result
}

func jsonResponse(_ text: String, status: Int = 200, headers: [String: String] = [:]) -> HTTPResponse {
    HTTPResponse(statusCode: status, headers: headers, body: Data(text.utf8))
}

let testSchools = "[{\"schoolId\":400008,\"name\":\"Example School\",\"enName\":\"Example School\",\"domain\":\"pcd.intschool.cn\"}]"
let testLogin = "{\"success\":true,\"token\":\"fixture-token\",\"schools\":" + testSchools + "}"

actor MockTransport: HTTPTransport {
    /// 收到的请求，仅用于脱敏 mock 断言。
    private(set) var requests: [HTTPRequest] = []
    /// 当前 mock Cookie，用于验证 SDK 的验证码会话连续性。
    private var jar: [SessionCookie] = []
    /// 注入的本地响应处理器；不会连接真实平台。
    private let handler: @Sendable (HTTPRequest, Int) async throws -> HTTPResponse
    init(_ handler: @escaping @Sendable (HTTPRequest, Int) async throws -> HTTPResponse) { self.handler = handler }
    func send(_ request: HTTPRequest) async throws -> HTTPResponse {
        requests.append(request)
        let result = try await handler(request, requests.count)
        if let value = result.header("Set-Cookie") {
            jar = [SessionCookie(name: "JSESSIONID", value: value, domain: request.url.host!)]
        }
        return result
    }
    func cookies() async -> [SessionCookie] { jar }
    func restoreCookies(_ cookies: [SessionCookie]) async { jar = cookies }
    func clearCookies() async { jar = [] }
}

actor Counter {
    /// 测试中的并发计数。
    private var count = 0
    func next() -> Int { count += 1; return count }
    func value() -> Int { count }
}

func body(_ request: HTTPRequest) throws -> JSONValue { try JSONDecoder().decode(JSONValue.self, from: request.body ?? Data("{}".utf8)) }
func query(_ request: HTTPRequest) -> [String: String] { Dictionary((URLComponents(url: request.url, resolvingAgainstBaseURL: false)?.queryItems ?? []).map { ($0.name, $0.value ?? "") }, uniquingKeysWith: { _, last in last }) }

func fixtureStudentID() -> String? {
    guard let data = try? fixtureData("parent-871.json"), let value = try? JSONDecoder().decode(JSONValue.self, from: data) else { return nil }
    return value.arrayValue?.first?["studentId"]?.stringValue
}
