import Foundation

public struct TeacherDropDownClassRoomCascadeGETResponseItemSubOptionsItem: CapturedResponse {
    /// 选项的英文显示文本。
    public let enValue: String
    /// 选项附加元数据，类型随业务域变化；允许为空或缺失。
    public let extraValue: JSONValue?
    /// 当前教师是否具有此选项的教学权限。
    public let isTeach: Bool
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 下一级完整选项。
    public let subOptions: [JSONValue]
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.enValue = try container.decode(String.self, forKey: JSONKey("enValue"))
        self.extraValue = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("extraValue"))
        self.isTeach = try container.decode(Bool.self, forKey: JSONKey("isTeach"))
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.subOptions = try container.decode([JSONValue].self, forKey: JSONKey("subOptions"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["enValue", "extraValue", "isTeach", "key", "subOptions", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("enValue") { try container.encode(self.enValue, forKey: JSONKey("enValue")) }
        if presentFields.contains("extraValue") { try container.encode(self.extraValue, forKey: JSONKey("extraValue")) }
        if presentFields.contains("isTeach") { try container.encode(self.isTeach, forKey: JSONKey("isTeach")) }
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("subOptions") { try container.encode(self.subOptions, forKey: JSONKey("subOptions")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDropDownClassRoomCascadeGETResponseItem: CapturedResponse {
    /// 选项的英文显示文本。
    public let enValue: String
    /// 选项附加元数据，类型随业务域变化；允许为空或缺失。
    public let extraValue: JSONValue?
    /// 当前教师是否具有此选项的教学权限。
    public let isTeach: Bool
    /// 选项标识，供后续请求使用。
    public let key: Int
    /// 下一级完整选项。
    public let subOptions: [TeacherDropDownClassRoomCascadeGETResponseItemSubOptionsItem]
    /// 选项值或显示文本；具体角色由所属选项字典决定。
    public let value: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.enValue = try container.decode(String.self, forKey: JSONKey("enValue"))
        self.extraValue = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("extraValue"))
        self.isTeach = try container.decode(Bool.self, forKey: JSONKey("isTeach"))
        self.key = try container.decode(Int.self, forKey: JSONKey("key"))
        self.subOptions = try container.decode([TeacherDropDownClassRoomCascadeGETResponseItemSubOptionsItem].self, forKey: JSONKey("subOptions"))
        self.value = try container.decode(String.self, forKey: JSONKey("value"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["enValue", "extraValue", "isTeach", "key", "subOptions", "value"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("enValue") { try container.encode(self.enValue, forKey: JSONKey("enValue")) }
        if presentFields.contains("extraValue") { try container.encode(self.extraValue, forKey: JSONKey("extraValue")) }
        if presentFields.contains("isTeach") { try container.encode(self.isTeach, forKey: JSONKey("isTeach")) }
        if presentFields.contains("key") { try container.encode(self.key, forKey: JSONKey("key")) }
        if presentFields.contains("subOptions") { try container.encode(self.subOptions, forKey: JSONKey("subOptions")) }
        if presentFields.contains("value") { try container.encode(self.value, forKey: JSONKey("value")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownClassRoomCascadeGETResponse = [TeacherDropDownClassRoomCascadeGETResponseItem]
