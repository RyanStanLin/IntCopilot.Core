import Foundation

public struct TeacherDiaryPrimaryTypeGETResponseItem: CapturedResponse {
    /// 是否禁用该选项。
    public let disable: Bool
    /// 选项的英文显示文本。
    public let enValue: String
    /// 选项附加元数据，类型随业务域变化。
    public let extraValue: Bool
    /// 此日记主类型的积分上限；允许为空或缺失。
    public let highPoints: Int?
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 此日记主类型的积分下限；允许为空或缺失。
    public let lowPoints: Int?
    /// 是否需要特殊日记字段。
    public let special: Bool
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.disable = try container.decode(Bool.self, forKey: JSONKey("disable"))
        self.enValue = try container.decode(String.self, forKey: JSONKey("enValue"))
        self.extraValue = try container.decode(Bool.self, forKey: JSONKey("extraValue"))
        self.highPoints = try container.decodeIfPresent(Int.self, forKey: JSONKey("highPoints"))
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.lowPoints = try container.decodeIfPresent(Int.self, forKey: JSONKey("lowPoints"))
        self.special = try container.decode(Bool.self, forKey: JSONKey("special"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["disable", "enValue", "extraValue", "highPoints", "key", "lowPoints", "special", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("disable") { try container.encode(self.disable, forKey: JSONKey("disable")) }
        if presentFields.contains("enValue") { try container.encode(self.enValue, forKey: JSONKey("enValue")) }
        if presentFields.contains("extraValue") { try container.encode(self.extraValue, forKey: JSONKey("extraValue")) }
        if presentFields.contains("highPoints") { try container.encode(self.highPoints, forKey: JSONKey("highPoints")) }
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("lowPoints") { try container.encode(self.lowPoints, forKey: JSONKey("lowPoints")) }
        if presentFields.contains("special") { try container.encode(self.special, forKey: JSONKey("special")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDiaryPrimaryTypeGETResponse = [TeacherDiaryPrimaryTypeGETResponseItem]
