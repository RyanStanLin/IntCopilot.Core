import Foundation

public enum HTTPMethod: String, Codable, Sendable, CaseIterable {
    case get = "GET", post = "POST", put = "PUT", patch = "PATCH", delete = "DELETE"
}

public struct HTTPRequest: Sendable {
    /// 请求的完整目标地址；认证信息不得附加至不受信任的目标。
    public var url: URL
    /// 传输方法；实际业务副作用由上层端点契约决定。
    public var method: HTTPMethod
    /// 本次请求的头部，作用域仅限当前目标地址。
    public var headers: [String: String]
    /// 已编码的请求体；没有请求体时为 nil。
    public var body: Data?

    public init(url: URL, method: HTTPMethod = .get, headers: [String: String] = [:], body: Data? = nil) {
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
    }
}

public struct HTTPResponse: Sendable {
    /// HTTP 状态码；业务状态仍需根据响应内容判断。
    public var statusCode: Int
    /// HTTP 响应头；访问器对名称大小写不敏感。
    public var headers: [String: String]
    /// 完整响应字节，支持 JSON、空响应及下载内容。
    public var body: Data

    public init(statusCode: Int, headers: [String: String] = [:], body: Data = Data()) {
        self.statusCode = statusCode
        self.headers = headers
        self.body = body
    }

    public func header(_ name: String) -> String? {
        headers.first { $0.key.caseInsensitiveCompare(name) == .orderedSame }?.value
    }
}

public struct SessionCookie: Codable, Sendable, Equatable {
    /// Cookie 名称，例 SESSION 或 JSESSIONID。
    public let name: String
    /// Cookie 值；属于认证材料，不应写入日志。
    public let value: String
    /// Cookie 生效域名，遵守服务端的域限制。
    public let domain: String
    /// Cookie 生效路径。
    public let path: String
    /// 过期时刻；会话 Cookie 为 nil。
    public let expiresAt: Date?
    /// 是否仅允许通过 HTTPS 传输。
    public let secure: Bool
    /// 服务端是否将该 Cookie 标记为 HttpOnly。
    public let httpOnly: Bool

    public init(name: String, value: String, domain: String, path: String = "/", expiresAt: Date? = nil, secure: Bool = true, httpOnly: Bool = true) {
        self.name = name; self.value = value; self.domain = domain; self.path = path
        self.expiresAt = expiresAt; self.secure = secure; self.httpOnly = httpOnly
    }
}

public protocol HTTPTransport: Sendable {
    func send(_ request: HTTPRequest) async throws -> HTTPResponse
    func cookies() async -> [SessionCookie]
    func restoreCookies(_ cookies: [SessionCookie]) async
    func clearCookies() async
}

extension HTTPTransport {
    public func cookies() async -> [SessionCookie] { [] }
    public func restoreCookies(_ cookies: [SessionCookie]) async {}
    public func clearCookies() async {}
}

public enum TransportError: Error, Sendable {
    case insecureURL, invalidResponse
}

private final class RedirectBlocker: NSObject, URLSessionTaskDelegate, @unchecked Sendable {
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping @Sendable (URLRequest?) -> Void) {
        completionHandler(nil)
    }
}

public actor URLSessionTransport: HTTPTransport {
    /// 此实例独立持有的内存 Cookie，不使用全局共享 Cookie 存储。
    private var storedCookies: [SessionCookie] = []
    /// 用于使登出前的在途响应无法重新写入 Cookie。
    private var generation = 0
    /// 临时 URLSession，关闭磁盘缓存与系统 Cookie 持久化。
    private let session: URLSession
    /// 拒绝自动跳转，避免认证材料被转发到其他目标。
    private let redirectBlocker = RedirectBlocker()

    public init(timeout: TimeInterval = 30) {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.httpShouldSetCookies = false
        configuration.httpCookieStorage = nil
        configuration.urlCache = nil
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = timeout * 2
        session = URLSession(configuration: configuration)
    }

    public func send(_ request: HTTPRequest) async throws -> HTTPResponse {
        guard request.url.scheme == "https" || (request.url.scheme == "http" && ["localhost", "127.0.0.1", "::1", "[::1]"].contains(request.url.host ?? "")) else {
            throw TransportError.insecureURL
        }
        let currentGeneration = generation
        var native = URLRequest(url: request.url)
        native.httpMethod = request.method.rawValue
        native.httpBody = request.body
        for (name, value) in request.headers { native.setValue(value, forHTTPHeaderField: name) }
        let matching = storedCookies.filter { Self.matches($0, url: request.url) }
        if !matching.isEmpty && native.value(forHTTPHeaderField: "Cookie") == nil {
            native.setValue(matching.map { "\($0.name)=\($0.value)" }.joined(separator: "; "), forHTTPHeaderField: "Cookie")
        }
        let (body, response) = try await session.data(for: native, delegate: redirectBlocker)
        guard let response = response as? HTTPURLResponse else { throw TransportError.invalidResponse }
        let headers = Dictionary(response.allHeaderFields.map { (String(describing: $0.key), String(describing: $0.value)) }, uniquingKeysWith: { _, new in new })
        if currentGeneration == generation {
            for cookie in HTTPCookie.cookies(withResponseHeaderFields: headers, for: request.url) {
                let candidate = SessionCookie(name: cookie.name, value: cookie.value, domain: cookie.domain, path: cookie.path, expiresAt: cookie.expiresDate, secure: cookie.isSecure, httpOnly: cookie.isHTTPOnly)
                guard Self.domainMatches(candidate.domain, host: request.url.host ?? "") else { continue }
                storedCookies.removeAll { $0.name == candidate.name && $0.domain == candidate.domain && $0.path == candidate.path }
                if candidate.expiresAt.map({ $0 > Date() }) ?? true { storedCookies.append(candidate) }
            }
        }
        return HTTPResponse(statusCode: response.statusCode, headers: headers, body: body)
    }

    public func cookies() async -> [SessionCookie] { storedCookies.filter { $0.expiresAt.map { $0 > Date() } ?? true } }
    public func restoreCookies(_ cookies: [SessionCookie]) async { generation += 1; storedCookies = cookies }
    public func clearCookies() async { generation += 1; storedCookies = [] }

    private static func domainMatches(_ domain: String, host: String) -> Bool {
        let normalized = domain.lowercased()
        if normalized.hasPrefix(".") {
            let suffix = String(normalized.dropFirst())
            return host.lowercased() == suffix || host.lowercased().hasSuffix("." + suffix)
        }
        return host.lowercased() == normalized
    }

    private static func matches(_ cookie: SessionCookie, url: URL) -> Bool {
        guard domainMatches(cookie.domain, host: url.host ?? ""), !cookie.secure || url.scheme == "https", cookie.expiresAt.map({ $0 > Date() }) ?? true else { return false }
        let path = url.path.isEmpty ? "/" : url.path
        return path == cookie.path || (path.hasPrefix(cookie.path) && (cookie.path.hasSuffix("/") || path.dropFirst(cookie.path.count).first == "/"))
    }
}
