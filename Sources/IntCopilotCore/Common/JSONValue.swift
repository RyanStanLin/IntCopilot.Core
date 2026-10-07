import Foundation
import IntCopilotTransport

public typealias HTTPTransport = IntCopilotTransport.HTTPTransport
public typealias HTTPRequest = IntCopilotTransport.HTTPRequest
public typealias HTTPResponse = IntCopilotTransport.HTTPResponse
public typealias HTTPMethod = IntCopilotTransport.HTTPMethod
public typealias SessionCookie = IntCopilotTransport.SessionCookie
public typealias URLSessionTransport = IntCopilotTransport.URLSessionTransport

public enum JSONValue: Codable, Sendable, Hashable {
    case null, bool(Bool), number(Decimal), string(String), array([JSONValue]), object([String: JSONValue])

    public init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        if container.decodeNil() { self = .null }
        else if let value = try? container.decode(Bool.self) { self = .bool(value) }
        else if let value = try? container.decode(Decimal.self) { self = .number(value) }
        else if let value = try? container.decode(String.self) { self = .string(value) }
        else if let value = try? container.decode([JSONValue].self) { self = .array(value) }
        else { self = .object(try container.decode([String: JSONValue].self)) }
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .null: try container.encodeNil()
        case .bool(let value): try container.encode(value)
        case .number(let value): try container.encode(value)
        case .string(let value): try container.encode(value)
        case .array(let value): try container.encode(value)
        case .object(let value): try container.encode(value)
        }
    }

    public subscript(_ key: String) -> JSONValue? {
        guard case .object(let object) = self else { return nil }; return object[key]
    }

    /// 字符串或数字、布尔值的文本表示；null、数组与对象为 nil。
    public var stringValue: String? {
        switch self {
        case .string(let value): value
        case .number(let value): NSDecimalNumber(decimal: value).stringValue
        case .bool(let value): value ? "true" : "false"
        default: nil
        }
    }
    /// 可精确转换为 Int 的数值或十进制字符串；无法转换时为 nil。
    public var integerValue: Int? { stringValue.flatMap(Int.init) }
    /// 原始 JSON 布尔值；其他类型及 null 为 nil。
    public var boolValue: Bool? { if case .bool(let value) = self { value } else { nil } }
    /// 原始 JSON 数组；其他类型及 null 为 nil。
    public var arrayValue: [JSONValue]? { if case .array(let value) = self { value } else { nil } }
    /// 原始 JSON 对象与全部动态键；其他类型及 null 为 nil。
    public var objectValue: [String: JSONValue]? { if case .object(let value) = self { value } else { nil } }
    public static func integer(_ value: Int) -> JSONValue { .number(Decimal(value)) }
    public static func milliseconds(_ date: Date) -> JSONValue {
        let value = (date.timeIntervalSince1970 * 1000).rounded()
        guard value.isFinite, value > Double(Int64.min), value < Double(Int64.max) else { return .null }
        return .number(Decimal(Int64(value)))
    }
    public func decode<T: Decodable>(_ type: T.Type) throws -> T { try JSONDecoder().decode(type, from: JSONEncoder().encode(self)) }
}

struct JSONKey: CodingKey {
    /// 原始 JSON 字段名，包含无法作为 Swift 标识符的动态键。
    let stringValue: String
    /// 动态字段采用字符串索引，此值始终为 nil。
    var intValue: Int? { nil }
    init(_ value: String) { stringValue = value }
    init?(stringValue: String) { self.stringValue = stringValue }
    init?(intValue: Int) { return nil }
}

public protocol CapturedResponse: Codable, Sendable {
    /// 稳定模型之外的新增响应字段，保留原始 JSON 值。
    var additionalFields: [String: JSONValue] { get }
}

public enum Platform: String, Codable, Sendable { case parent, teacher, portal, print }
public enum APILocale: String, Codable, Sendable { case chinese = "zh", english = "en" }
public enum ContractStability: String, Codable, Sendable { case stable, unstable }
public enum OperationSafety: String, Codable, Sendable { case readOnly, authentication, externalEffect, unverified }
public enum EvidenceKind: String, Codable, Sendable { case providedCapture, frontendScript, readOnlyObservation, mock }

public struct Evidence: Codable, Sendable, Hashable {
    /// 证据种类；mock 不能证明真实服务器行为。
    public let kind: EvidenceKind
    /// 抓包编号或公开脚本 URL；不包含原始认证材料。
    public let reference: String
}

public struct EndpointDescriptor: Codable, Sendable, Identifiable, Hashable {
    /// 在目录中唯一的端点标识，包含平台与 HTTP 方法。
    public let id: String
    /// 所属平台；门户端点仅用于认证。
    public let platform: Platform
    /// 业务操作名称，来源于前端服务定义或抓包路径。
    public let name: String
    /// 原始 HTTP 方法；不能由此推定是否安全。
    public let method: HTTPMethod
    /// 相对于平台根地址的路径，可包含具名路径参数。
    public let path: String
    /// 是否具有完整可使用的稳定契约。
    public let stability: ContractStability
    /// 已确认的业务副作用类别；未知时为 unverified。
    public let safety: OperationSafety
    /// 是否已知具有外部业务副作用；无法确认时为 nil。
    public let hasExternalSideEffects: Bool?
    /// 是否已确认安全分类；与外部副作用独立。
    public let safetyConfirmed: Bool
    /// 请求是否采用 JSON 请求体，包括空对象。
    public let expectsJSONBody: Bool
    /// 用户提供的原始抓包是否覆盖该操作。
    public let coveredByProvidedCaptures: Bool
    /// 本接口的证据清单。
    public let evidence: [Evidence]
    /// 已观察到的查询参数名；缓存时间戳由库处理。
    public let queryParameters: [String]
    /// 已观察到的请求体字段。
    public let bodyFields: [String]
    /// 抓包请求体各字段的原始 JSON 类型；避免数字标识被错误编码为字符串。
    public let bodyFieldTypes: [String: String]
    /// 前置参数、接口与用户选择的依赖说明。
    public let dependencies: [String: String]
    /// 验证限制、未知契约及其他风险标记。
    public let warnings: [String]
    /// 前端函数的请求表达式，仅用于研究，不直接执行。
    public let requestExpression: String?
}

public enum APIError: Error, Sendable, Equatable {
    case authenticationRequired, invalidCredentials, invalidVerificationCode
    case backend(status: Int, code: Int?, message: String)
    case permissionDenied, missingParameter(String), invalidParameter(String)
    case schoolSelectionRequired, noAccessibleSchool, staleSession, unsupportedAuthentication
    case unsafeEndpoint(String), unknownEndpoint(String), invalidRedirect, invalidResponse(String)
}

public struct Identifier<Tag: Sendable>: Codable, Sendable, Hashable, CustomStringConvertible {
    /// 服务端标识的十进制或字符串表示；由上游实体返回，不需猜测。
    public let rawValue: String
    public init(_ value: String) { rawValue = value }
    public init(_ value: Int) { rawValue = String(value) }
    /// 上游标识的原始字符串表示，不代表业务名称。
    public var description: String { rawValue }
    public init(from decoder: any Decoder) throws {
        let value = try JSONValue(from: decoder)
        guard let string = value.stringValue else { throw APIError.invalidResponse("标识符不是字符串或数字") }
        rawValue = string
    }
    public func encode(to encoder: any Encoder) throws { var c = encoder.singleValueContainer(); try c.encode(rawValue) }
}

public enum SchoolTag: Sendable {}
public enum SchoolYearTag: Sendable {}
public enum StudentTag: Sendable {}
public enum TeacherTag: Sendable {}
public enum CourseTag: Sendable {}
public enum TaskTag: Sendable {}
public enum TaskStudentTag: Sendable {}
public enum GradePeriodTag: Sendable {}
public typealias SchoolID = Identifier<SchoolTag>
public typealias SchoolYearID = Identifier<SchoolYearTag>
public typealias StudentID = Identifier<StudentTag>
public typealias TeacherID = Identifier<TeacherTag>
public typealias CourseID = Identifier<CourseTag>
public typealias TaskID = Identifier<TaskTag>
public typealias TaskStudentID = Identifier<TaskStudentTag>
public typealias GradePeriodID = Identifier<GradePeriodTag>
