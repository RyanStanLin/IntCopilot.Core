import Foundation
import IntCopilotCore

public struct QueryContext: Sendable {
    public var studentID: String?
    public var courseID: String?
    public var schoolYearID: String?
    public var start: Date
    public var end: Date
    public var date: Date
    public var page: Int
    public var pageSize: Int
    public init(studentID: String? = nil, courseID: String? = nil, schoolYearID: String? = nil, start: Date = SchoolDateRange.schoolWeek(containing: Date()).start, end: Date = SchoolDateRange.schoolWeek(containing: Date()).end, date: Date = Date(), page: Int = 1, pageSize: Int = 50) {
        self.studentID = studentID; self.courseID = courseID; self.schoolYearID = schoolYearID
        self.start = start; self.end = end; self.date = date; self.page = page; self.pageSize = pageSize
    }
    public func defaultValue(for key: String) -> JSONValue? {
        switch key {
        case "studentId": studentID.map(JSONValue.string)
        case "courseId": courseID.map(JSONValue.string)
        case "schoolYearId": schoolYearID.map(JSONValue.string)
        case "start", "startTime", "dateStart": .milliseconds(start)
        case "end", "endTime", "dateEnd": .milliseconds(end)
        case "date": .milliseconds(date)
        case "pageCurrent": .integer(page)
        case "pageSize": .integer(pageSize)
        default: nil
        }
    }
}

public enum QueryPlanning {
    public static func makeInput(query: JSONValue, body: JSONValue, path: JSONValue, endpoint: EndpointDescriptor) throws -> APIInput {
        guard let q = query.objectValue, let b = body.objectValue, let p = path.objectValue else { throw APIError.invalidParameter("查询、请求体和路径必须为 JSON 对象") }
        let query = try q.mapValues { try parameter($0) }, body = try b.mapValues { try parameter($0) }
        let bindings = try p.mapValues { value in
            guard let text = value.stringValue else { throw APIError.invalidParameter("路径标识必须是文本或整数") }; return text
        }
        for field in endpoint.path.components(separatedBy: "{").dropFirst().compactMap({ $0.components(separatedBy: "}").first }) {
            guard bindings[field] != nil || field == "schoolYearId" else { throw APIError.missingParameter(field) }
        }
        return APIInput(query: query, body: body, path: bindings)
    }
    public static func parameter(_ value: JSONValue) throws -> APIParameter {
        if let object = value.objectValue, let raw = object["rawValue"], let name = object["name"]?.stringValue, let domain = object["domain"]?.stringValue {
            let school = object["schoolID"]?.stringValue.map(SchoolID.init)
            let dependencies = object["dependencies"]?.objectValue?.compactMapValues(\.stringValue) ?? [:]
            return .selection(SemanticOption(rawValue: raw, name: name, enName: object["enName"]?.stringValue, domain: domain, isEnabled: object["isEnabled"]?.boolValue ?? true, record: object["record"] ?? .object([:]), schoolID: school, dependencies: dependencies))
        }
        return .unverifiedRaw(value)
    }
    public static func pretty(_ value: JSONValue) -> String {
        let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        return (try? String(data: encoder.encode(value), encoding: .utf8)) ?? "null"
    }
    public static func decode(_ text: String) throws -> JSONValue { try JSONDecoder().decode(JSONValue.self, from: Data(text.utf8)) }
}
