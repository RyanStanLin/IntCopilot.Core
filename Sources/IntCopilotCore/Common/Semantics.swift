import Foundation

public struct SemanticValue: Codable, Sendable, Hashable {
    /// 服务器原始状态或类型值；不会跨业务域解释。
    public let rawValue: JSONValue
    /// 语义字典所属业务域。
    public let domain: String
    /// 此会话中平台返回的动态语义选项；没有动态证据时为 nil。
    private let resolvedOption: SemanticOption?
    public init(rawValue: JSONValue, domain: String, option: SemanticOption? = nil) { self.rawValue = rawValue; self.domain = domain; resolvedOption = option }
    /// 保留的原始代码文本，只用于诊断及精确匹配。
    public var code: String { rawValue.stringValue ?? "null" }
    /// 中文名称；平台动态名称优先，未知值明确标识。
    public var name: String { resolvedOption?.name ?? SemanticDictionary.label(domain: domain, code: code)?.0 ?? "未识别状态或类型（\(code)）" }
    /// 英文名称；平台缺失英文时使用已确认映射或明确未翻译说明。
    public var enName: String { resolvedOption?.enName ?? SemanticDictionary.label(domain: domain, code: code)?.1 ?? (resolvedOption == nil ? "Unrecognized (\(code))" : "English label unavailable") }
    /// 此业务域是否存在已确认的语义。
    public var isRecognized: Bool { resolvedOption != nil || SemanticDictionary.label(domain: domain, code: code) != nil }
    /// 动态字典是否允许选择；没有当前权限证据时为 nil。
    public var isEnabled: Bool? { resolvedOption?.isEnabled }
    public func label(locale: APILocale) -> String { locale == .chinese ? name : enName }
    static func decoded(rawValue: JSONValue, domain: String, decoder: any Decoder) -> SemanticValue {
        let dictionaries = decoder.userInfo[semanticDictionaryKey] as? [String: [String: SemanticOption]]
        let option = rawValue.stringValue.flatMap { dictionaries?[domain]?[$0] }
        return SemanticValue(rawValue: rawValue, domain: domain, option: option)
    }
}

/// JSON 解码上下文的动态语义字典键，不包含认证材料。
let semanticDictionaryKey = CodingUserInfoKey(rawValue: "IntCopilot.Semantics")!

public struct SemanticOption: Codable, Sendable, Hashable, Identifiable {
    /// 后续请求使用的选项值，来自对应业务字典。
    public let rawValue: JSONValue
    /// 该业务域的中文或服务端显示名称。
    public let name: String
    /// 服务端英文名称，缺失时为 nil；不擅自翻译原始数据。
    public let enName: String?
    /// 选项所属业务字典，防止同码跨域使用。
    public let domain: String
    /// 当前用户是否允许选择；不代表服务器授权结果。
    public let isEnabled: Bool
    /// 完整服务端选项，包括已知与尚未确认的附加字段。
    public let record: JSONValue
    /// 获取选项时的学校；静态枚举选项为 nil。
    public let schoolID: SchoolID?
    /// 此选项依赖的上游标识，例如日记主类型或课程。
    public let dependencies: [String: String]
    /// 在所属业务域内唯一的显示标识。
    public var id: String { domain + ":" + (rawValue.stringValue ?? "null") }

    public init(rawValue: JSONValue, name: String, enName: String? = nil, domain: String, isEnabled: Bool = true, record: JSONValue = .object([:]), schoolID: SchoolID? = nil, dependencies: [String: String] = [:]) {
        self.rawValue = rawValue; self.name = name; self.enName = enName
        self.domain = domain; self.isEnabled = isEnabled; self.record = record
        self.schoolID = schoolID; self.dependencies = dependencies
    }

    public func label(locale: APILocale) -> String {
        if locale == .english, let enName, !enName.isEmpty { return enName }; return name
    }

    public static func from(_ record: JSONValue, domain: String, idField: String = "key", nameField: String = "value", englishField: String = "enValue", schoolID: SchoolID? = nil, dependencies: [String: String] = [:]) throws -> SemanticOption {
        guard let raw = record[idField], let name = record[nameField]?.stringValue, !name.isEmpty else {
            throw APIError.invalidResponse("选项缺少标识或名称")
        }
        return SemanticOption(rawValue: raw, name: name, enName: record[englishField]?.stringValue, domain: domain, isEnabled: record["disable"]?.boolValue != true && record["permissions"]?.boolValue != false, record: record, schoolID: schoolID, dependencies: dependencies)
    }
}

public enum LeaveKind: String, Codable, Sendable, CaseIterable {
    case personal
    public var option: SemanticOption { SemanticOption(rawValue: .string(rawValue), name: "请假申请", enName: "Leave application", domain: "leaveKind") }
}

enum SemanticDictionary {
    /// 按实际业务域组织的已确认语义，禁止使用一张全局代码表。
    static let values: [String: [String: [String]]] = [
        "studentStatus": ["1014":["在校生","Enrolled"],"1015":["已毕业","Graduated"],"1016":["已转学","Transferred"],"1017":["待入学","Pending enrollment"],"1018":["转学中","Transferring"]],
        "classType": ["1251":["主班级","Homeroom"],"1253":["学院","Advisory"],"1255":["课程班级","Section"],"1256":["自习室","Study room"],"1257":["宿舍","Dormitory"],"1258":["延展课程","Life block"]],
        "gender": ["male":["男","Male"],"female":["女","Female"],"":["未提供","Not provided"]],
        "relationship": ["father":["父亲","Father"],"mother":["母亲","Mother"],"other":["其他关系","Other"],"":["未提供","Not provided"]],
        "attendanceStatus": ["intime":["出席","Present"],"late":["迟到","Late"],"excusedLate":["迟到（可谅解）","Excused late"],"absent":["缺席","Absent"],"examAbsent":["缺考","Exam absent"],"personal":["缺席（可谅解）","Excused absence"],"illness":["病假","Sick leave"],"holiday":["假期","Holiday"],"weekendHoliday":["假期","Holiday"],"exams":["考试","Exam"],"others":["其他","Other"],"noRecords":["未考勤","Not recorded"],"online":["在线","Online"],"NotEntered":["待录入","Pending entry"],"normal":["正常","Normal"],"resit":["补考","Resit"]],
        "leaveStatus": ["approved":["已批准","Approved"],"declined":["已拒绝","Declined"],"retrieved":["已撤回","Withdrawn"],"pending":["待审批","Pending"]],
        "semesterType": ["1204":["上学期","Semester 1"],"1205":["下学期","Semester 2"]],
        "semesterStatus": ["1201":["未开始","Not started"],"1202":["进行中","In progress"],"1203":["已结束","Finished"]],
        "taskFeedType": ["1001":["任务","Assignment"],"1002":["教学资源","Teaching resource"]],
        "courseType": ["1001":["课程班级","Course"],"1002":["延展课程","CCA"]],
        "leaveKind": ["personal":["请假申请","Leave application"]],
        "gradeType": ["1031":["不评分","Ungraded"],"1032":["百分制","Percentage"],"1033":["等级制","Grade level"]],
        "attendanceType": ["half_day":["半日考勤","Half-day attendance"],"full_day":["全日考勤","Full-day attendance"]],
        "repetition": ["1011":["每周重复","Weekly"],"1012":["隔周重复","Biweekly"],"1013":["只一次","Once"]],
        "taskCompletion": ["1011":["未完成","Incomplete"],"1012":["按时完成","Completed on time"],"1013":["逾期完成","Completed late"]]
    ]
    static func label(domain: String, code: String) -> (String, String)? {
        guard let labels = values[domain]?[code], labels.count == 2 else { return nil }; return (labels[0], labels[1])
    }
}


enum ParameterSemantics {
    static func domain(path: String, field: String) -> String? {
        switch field {
        case "classType": return "classType"
        case "courseType": return "courseType"
        case "taskTypeId": return "taskType"
        case "reasonId" where path.contains("leave-application"): return "leaveReason"
        case "status" where path.contains("leave-application"): return "leaveStatus"
        case "status" where path.hasPrefix("/api/attendance/"): return "attendanceStatus"
        case "status" where path.hasPrefix("/api/student/"): return "studentStatus"
        case "type" where path.contains("leave-application"): return "leaveKind"
        case "type" where path == "/api/course/cascade/attendance": return "courseType"
        case "type" where path == "/api/task/mergeList": return "taskFeedType"
        default: return nil
        }
    }
}
