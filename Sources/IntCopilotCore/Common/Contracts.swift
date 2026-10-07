import Foundation

public enum APIContractCatalog {
    /// 完整的端点清单加载结果，错误会向调用方传播。
    private static let loaded: Result<[EndpointDescriptor], any Error> = Result {
        guard let url = Bundle.module.url(forResource: "EndpointCatalog", withExtension: "json") else { throw APIError.invalidResponse("缺少契约目录") }
        return try JSONDecoder().decode([EndpointDescriptor].self, from: Data(contentsOf: url))
    }
    public static func endpoints(platform: Platform? = nil) throws -> [EndpointDescriptor] {
        try loaded.get().filter { platform == nil || $0.platform == platform }
    }
    public static func endpoint(id: String) throws -> EndpointDescriptor {
        guard let descriptor = try loaded.get().first(where: { $0.id == id }) else { throw APIError.unknownEndpoint(id) }
        return descriptor
    }
}

public struct CapturedEndpoint<Response: Decodable & Sendable>: Sendable {
    /// 已验证的类型化响应对应的目录标识。
    public let id: String
    init(id: String) { self.id = id }
    /// 此端点的目录契约与证据；目录缺失时抛出 unknownEndpoint。
    public var descriptor: EndpointDescriptor { get throws { try APIContractCatalog.endpoint(id: id) } }
}

public indirect enum APIParameter: Sendable {
    case text(String), integer(Int), decimal(Decimal), boolean(Bool), date(Date)
    case identifier(String), selection(SemanticOption), list([APIParameter]), unverifiedRaw(JSONValue)
    public static func id<T>(_ id: Identifier<T>) -> APIParameter { .identifier(id.rawValue) }
    func validate(school: SchoolID?) throws {
        switch self {
        case .date(let date):
            let value = date.timeIntervalSince1970 * 1000
            guard value.isFinite, value > Double(Int64.min), value < Double(Int64.max) else { throw APIError.invalidParameter("日期超出支持范围") }
        case .selection(let option):
            guard option.isEnabled else { throw APIError.permissionDenied }
            if let id = option.schoolID, id != school { throw APIError.invalidParameter("选项属于另一学校") }
        case .list(let values): try values.forEach { try $0.validate(school: school) }
        default: break
        }
    }
    /// 参数的 JSON 编码表示；日期使用 Unix 毫秒，选项使用关联原始值。
    var json: JSONValue {
        switch self {
        case .text(let v), .identifier(let v): .string(v)
        case .integer(let v): .integer(v)
        case .decimal(let v): .number(v)
        case .boolean(let v): .bool(v)
        case .date(let v): .milliseconds(v)
        case .selection(let v): v.rawValue
        case .list(let v): .array(v.map(\.json))
        case .unverifiedRaw(let v): v
        }
    }
}

public struct APIInput: Sendable {
    /// 查询参数，以具名业务字段组织；语义代码应使用 selection。
    public var query: [String: APIParameter]
    /// JSON 请求体字段；原始未确认内容只应通过实验入口使用。
    public var body: [String: APIParameter]
    /// 路径中的具名标识；常用上下文由客户端自动补充。
    public var path: [String: String]
    public init(query: [String: APIParameter] = [:], body: [String: APIParameter] = [:], path: [String: String] = [:]) {
        self.query = query; self.body = body; self.path = path
    }
}

public struct MutationAcknowledgement: Codable, Sendable, Equatable {
    /// 服务器是否接受本次操作；不推断不存在的实体 ID。
    public let accepted: Bool
    /// 操作返回的 HTTP 状态码。
    public let statusCode: Int
    /// 非空响应中的完整原始数据；空响应为 null。
    public let response: JSONValue
    public init(accepted: Bool, statusCode: Int, response: JSONValue = .null) {
        self.accepted = accepted; self.statusCode = statusCode; self.response = response
    }
}

public struct ExperimentalResult: Sendable {
    /// 完整返回数据；不伪造尚未确认的强类型契约。
    public let value: JSONValue
    /// 非 JSON 下载或空响应的完整字节。
    public let data: Data
    /// 显著包含稳定性、外部副作用、证据及验证限制的契约。
    public let contract: EndpointDescriptor
    /// 真实响应的 HTTP 状态码。
    public let statusCode: Int
}

public struct School: Codable, Sendable, Identifiable, Hashable {
    /// 学校标识，来自认证学校列表。
    public let id: SchoolID
    /// 学校显示名称。
    public let name: String
    /// 学校英文名称，缺失时为 nil。
    public let enName: String?
    /// 完整学校元数据，保留其他服务器字段。
    public let record: JSONValue
    init(record: JSONValue) throws {
        guard let id = record["schoolId"]?.stringValue, let name = record["name"]?.stringValue else { throw APIError.invalidResponse("学校缺少标识或名称") }
        self.id = SchoolID(id); self.name = name; enName = record["enName"]?.stringValue; self.record = record
    }
}

public struct Student: Sendable, Identifiable {
    /// 此引用所属学校，防止切换学校后误用旧学生引用。
    public let schoolID: SchoolID
    /// 学生标识，来自关联学生或课程名单。
    public let id: StudentID
    /// 学生显示名称。
    public let name: String
    /// 学生英文或常用名称。
    public let enName: String?
    /// 学生在校状态，附有明确业务语义。
    public let status: SemanticValue?
    /// 完整列表记录；完整资料可通过详情服务获取。
    public let record: JSONValue
    init(record: JSONValue, schoolID: SchoolID) throws {
        guard let id = record["studentId"]?.stringValue else { throw APIError.invalidResponse("学生缺少标识") }
        self.id = StudentID(id); self.schoolID = schoolID; name = record["name"]?.stringValue ?? record["studentName"]?.stringValue ?? "未提供姓名"
        enName = record["enName"]?.stringValue
        status = record["status"].map { SemanticValue(rawValue: $0, domain: "studentStatus") }; self.record = record
    }
}

public struct PageRequest: Sendable {
    /// 页码，从 1 开始。
    public let number: Int
    /// 每页记录数，默认 50。
    public let size: Int
    public init(number: Int = 1, size: Int = 50) { self.number = number; self.size = size }
    func parameters() throws -> [String: APIParameter] {
        guard number >= 1, (1...500).contains(size) else { throw APIError.invalidParameter("分页参数") }
        return ["pageCurrent": .integer(number), "pageSize": .integer(size)]
    }
}
