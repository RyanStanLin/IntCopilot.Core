import Foundation
import IntCopilotCore

public enum DemoSafetyError: Error, Sendable, LocalizedError, Equatable {
    case blocked(String), wrongOrigin, invalidPermit
    public var errorDescription: String? {
        switch self {
        case .blocked(let route): "只读保护阻止了 \(route)。有副作用或安全性未确认的请求，需要你在手动测试页面逐次确认。"
        case .wrongOrigin: "目标域名不在此客户端的认证边界内。"
        case .invalidPermit: "一次性操作授权无效。"
        }
    }
}

public struct RequestTrace: Identifiable, Sendable {
    public let id: UUID
    public let date: Date
    public let method: String
    public let path: String
    public let status: Int?
    public let elapsed: TimeInterval
    public let bytes: Int
    public let outcome: String
}

public actor GuardedTransport: HTTPTransport {
    private let base: any HTTPTransport
    private let platform: Platform
    private var permits: [String: Int] = [:]
    private var traces: [RequestTrace] = []
    private let descriptors: [EndpointDescriptor]

    public init(platform: Platform, base: (any HTTPTransport)? = nil) throws {
        self.platform = platform; self.base = base ?? URLSessionTransport()
        descriptors = try APIContractCatalog.endpoints(platform: platform)
    }
    public func approveOnce(method: HTTPMethod, path: String) throws {
        guard path.hasPrefix("/api/"), !path.contains("?"), !path.contains("#") else { throw DemoSafetyError.invalidPermit }
        permits[method.rawValue+":"+path] = 1
    }
    public func revokePermits() { permits = [:] }
    public func history() -> [RequestTrace] { traces }
    public func clearHistory() { traces = [] }
    public func send(_ request: HTTPRequest) async throws -> HTTPResponse {
        let allowedHosts: Set<String> = platform == .parent ? ["pcd.intschool.cn"] : ["teacher.intschool.cn", "kcschengdu.dipont.com"]
        guard request.url.scheme == "https", allowedHosts.contains(request.url.host ?? "") else { throw DemoSafetyError.wrongOrigin }
        let start = Date()
        let route = Self.route(request.url)
        let permitKey = request.method.rawValue+":"+route
        let portal = request.url.host == "kcschengdu.dipont.com"
        let portalAuth = portal && ((request.method == .get && ["/login", "/api/oauth/authorize"].contains(route)) || (request.method == .post && ["/api/login", "/api/oauth/authorize"].contains(route)))
        let auth = !portal && ((request.method == .post && route == "/api/login/unify" && platform == .parent) || (request.method == .get && route == "/api/login/switchToken" && platform == .teacher))
        let contract = descriptors.first { $0.method == request.method && Self.matches($0.path, route) }
        let bootstrap = !portal && contract.map { $0.safety == .authentication && $0.safetyConfirmed && $0.hasExternalSideEffects == false } == true
        let readOnly = !portal && contract.map { $0.safety == .readOnly && $0.safetyConfirmed && $0.hasExternalSideEffects == false } == true
        if !(portalAuth || auth || bootstrap || readOnly) {
            guard permits[permitKey] == 1 else {
                record(request, start: start, response: nil, outcome: "保护已拦截")
                throw DemoSafetyError.blocked(request.method.rawValue+" "+maskedPath(request))
            }
            permits.removeValue(forKey: permitKey)
        }
        do {
            let response = try await base.send(request)
            record(request, start: start, response: response, outcome: "已响应")
            return response
        } catch {
            record(request, start: start, response: nil, outcome: "传输失败")
            throw error
        }
    }
    public func cookies() async -> [SessionCookie] { await base.cookies() }
    public func restoreCookies(_ values: [SessionCookie]) async { await base.restoreCookies(values) }
    public func clearCookies() async { await base.clearCookies() }
    private func record(_ request: HTTPRequest, start: Date, response: HTTPResponse?, outcome: String) {
        traces.insert(RequestTrace(id: UUID(), date: start, method: request.method.rawValue, path: maskedPath(request), status: response?.statusCode, elapsed: Date().timeIntervalSince(start), bytes: response?.body.count ?? 0, outcome: outcome), at: 0)
        if traces.count > 200 { traces.removeLast(traces.count-200) }
    }
    private func maskedPath(_ request: HTTPRequest) -> String {
        let route = Self.route(request.url)
        if let contract = descriptors.first(where: { $0.method == request.method && Self.matches($0.path, route) }) { return contract.path }
        if ["/login", "/api/login", "/api/oauth/authorize"].contains(route) { return route }
        return "/（未收录路由，已隐藏路径）"
    }
    public static func route(_ url: URL) -> String { URLComponents(url: url, resolvingAgainstBaseURL: false)?.path ?? url.path }
    public static func matches(_ pattern: String, _ path: String) -> Bool {
        guard pattern.hasSuffix("/") == path.hasSuffix("/") else { return false }
        let expected = pattern.split(separator: "/"), actual = path.split(separator: "/")
        guard expected.count == actual.count else { return false }
        return zip(expected, actual).allSatisfy { $0.hasPrefix("{") ? !$1.isEmpty : $0 == $1 }
    }
    public static func redactedPath(_ path: String) -> String {
        path.split(separator: "/").map { Int($0) == nil ? String($0) : "{id}" }.joined(separator: "/").appendingPrefix("/")
    }
}

private extension String {
    func appendingPrefix(_ value: String) -> String { value + self }
}
