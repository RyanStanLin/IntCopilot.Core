import Foundation

public struct ContextOptions: Sendable {
    /// 拥有学校上下文的当前会话。
    private let session: CoreSession
    /// 选项服务对应的平台。
    public let platform: Platform
    init(session: CoreSession, platform: Platform) { self.session = session; self.platform = platform }

    public func currentSchoolYear() async throws -> SchoolYearID { try await session.currentSchoolYear() }
    public func schoolYears() async throws -> [SemanticOption] { try await values("/api/dropDown/schoolYearRuleList", domain: "schoolYear") }
    public func campuses() async throws -> [SemanticOption] { try teacherOnly(); return try await values("/api/dropDown/campusList", domain: "campus") }
    public func subjects() async throws -> [SemanticOption] { try teacherOnly(); return try await values("/api/dropDown/subjectList", domain: "subject") }
    public func tutors() async throws -> [SemanticOption] { try teacherOnly(); return try await groupedTeachers("/api/dropDown/tutors", domain: "tutor") }
    public func headTeachers() async throws -> [SemanticOption] { try teacherOnly(); return try await groupedTeachers("/api/dropDown/head-teachers", domain: "headTeacher") }
    public func classes() async throws -> [SemanticOption] { try teacherOnly(); return try await values("/api/dropDown/classListAll", domain: "homeroom") }
    public func sections(schoolYear: SemanticOption? = nil) async throws -> [SemanticOption] {
        try teacherOnly()
        let year = try schoolYear.map { option in
            guard option.domain == "schoolYear" else { throw APIError.invalidParameter("学年选项") }; return option
        }
        let query: [String: APIParameter]
        if let year { query = ["schoolYearId":.selection(year)] } else { query = ["schoolYearId":.id(try await session.currentSchoolYear())] }
        return try await values("/api/dropDown/sectionCascade", domain: "section", query: query)
    }
    public func effortLevels(campus: SemanticOption) async throws -> [SemanticOption] { try teacherOnly(); return try await gradeLevels("effort", campus: campus) }
    public func attainmentLevels(campus: SemanticOption) async throws -> [SemanticOption] { try teacherOnly(); return try await gradeLevels("attainment", campus: campus) }
    private func gradeLevels(_ type: String, campus: SemanticOption) async throws -> [SemanticOption] {
        guard campus.domain == "campus" else { throw APIError.invalidParameter("学部选项") }
        return try await values("/api/monthly-grade/level/"+type, domain: type, query: ["campusId":.selection(campus)])
    }
    private func teacherOnly() throws { guard platform == .teacher else { throw APIError.unsupportedAuthentication } }
    private func groupedTeachers(_ path: String, domain: String) async throws -> [SemanticOption] {
        let school = try await session.schoolID()
        let value = try await session.json(path: path, cached: true, schoolID: school)
        guard let groups = value.arrayValue else { throw APIError.invalidResponse("教师分组不是数组") }
        var order: [String] = [], records: [String: [JSONValue]] = [:]
        for group in groups {
            guard let members = group["list"]?.arrayValue else { throw APIError.invalidResponse("教师分组缺少名单") }
            for member in members {
                guard let key = member["teacherId"]?.stringValue, let name = member["teacherName"]?.stringValue, !name.isEmpty, var object = member.objectValue else { throw APIError.invalidResponse("教师选项缺少标识或名称") }
                object["groupLabel"] = group["groupLabel"] ?? .null
                if records[key] == nil { order.append(key) }
                records[key, default: []].append(.object(object))
            }
        }
        return order.map { key in
            let memberships = records[key] ?? [], first = memberships[0]
            let relations = memberships.compactMap { $0["relationName"]?.stringValue }.filter { !$0.isEmpty }
            let unique = relations.reduce(into: [String]()) { if !$0.contains($1) { $0.append($1) } }
            let teacherName = first["teacherName"]?.stringValue ?? "未提供姓名"
            let name = teacherName + (unique.isEmpty ? "" : "（"+unique.joined(separator: "、")+"）")
            let record: JSONValue = .object(["teacherId":first["teacherId"] ?? .string(key),"teacherName":.string(teacherName),"memberships":.array(memberships)])
            return SemanticOption(rawValue: first["teacherId"] ?? .string(key), name: name, domain: domain, record: record, schoolID: school)
        }
    }
    private func values(_ path: String, domain: String, query: [String: APIParameter] = [:]) async throws -> [SemanticOption] {
        let school = try await session.schoolID()
        let value = try await session.json(path: path, query: query, cached: true, schoolID: school)
        return try flattenOptions(value).map { try SemanticOption.from($0, domain: domain, schoolID: school) }
    }
}
