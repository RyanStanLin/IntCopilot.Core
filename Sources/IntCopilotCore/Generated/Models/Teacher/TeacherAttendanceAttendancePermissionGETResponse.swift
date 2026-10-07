import Foundation

public struct TeacherAttendanceAttendancePermissionGETResponse: CapturedResponse {
    /// 是否具备课节考勤权限。
    public let classAttendance: Bool
    /// 是否具备日常考勤权限。
    public let dailyAttendance: Bool
    /// 是否具备宿舍考勤权限。
    public let dormitoryAttendance: Bool
    /// 是否具备延展课程考勤权限。
    public let lbAttendance: Bool
    /// 是否具备自习室考勤权限。
    public let ssrAttendance: Bool
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classAttendance = try container.decode(Bool.self, forKey: JSONKey("classAttendance"))
        self.dailyAttendance = try container.decode(Bool.self, forKey: JSONKey("dailyAttendance"))
        self.dormitoryAttendance = try container.decode(Bool.self, forKey: JSONKey("dormitoryAttendance"))
        self.lbAttendance = try container.decode(Bool.self, forKey: JSONKey("lbAttendance"))
        self.ssrAttendance = try container.decode(Bool.self, forKey: JSONKey("ssrAttendance"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classAttendance", "dailyAttendance", "dormitoryAttendance", "lbAttendance", "ssrAttendance"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classAttendance") { try container.encode(self.classAttendance, forKey: JSONKey("classAttendance")) }
        if presentFields.contains("dailyAttendance") { try container.encode(self.dailyAttendance, forKey: JSONKey("dailyAttendance")) }
        if presentFields.contains("dormitoryAttendance") { try container.encode(self.dormitoryAttendance, forKey: JSONKey("dormitoryAttendance")) }
        if presentFields.contains("lbAttendance") { try container.encode(self.lbAttendance, forKey: JSONKey("lbAttendance")) }
        if presentFields.contains("ssrAttendance") { try container.encode(self.ssrAttendance, forKey: JSONKey("ssrAttendance")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
