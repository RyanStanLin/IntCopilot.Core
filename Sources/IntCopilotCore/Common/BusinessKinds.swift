import Foundation

public enum ClassKind: String, Codable, Sendable, CaseIterable {
    case homeroom = "1251", advisory = "1253", course = "1255", studyRoom = "1256", dormitory = "1257", cca = "1258"
    /// 有中英文名称的班级种类选项，按前端已确认字典编码。
    public var option: SemanticOption {
        let value = SemanticValue(rawValue: .string(rawValue), domain: "classType")
        return SemanticOption(rawValue: value.rawValue, name: value.name, enName: value.enName, domain: value.domain)
    }
}

public enum GradeKind: String, Codable, Sendable, CaseIterable {
    case ungraded = "1031", percentage = "1032", level = "1033"
    /// 有中英文名称的评分方式选项。
    public var option: SemanticOption {
        let value = SemanticValue(rawValue: .string(rawValue), domain: "gradeType")
        return SemanticOption(rawValue: value.rawValue, name: value.name, enName: value.enName, domain: value.domain)
    }
}
