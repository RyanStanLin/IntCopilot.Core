import Foundation

public struct TeacherDropDownHouseGroupListAllGETResponseItemHouseGroupsItem: CapturedResponse {
    /// 学院小组标识，来自学院小组选项。
    public let houseGroupId: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.houseGroupId = try container.decode(Int.self, forKey: JSONKey("houseGroupId"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["houseGroupId", "name"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("houseGroupId") { try container.encode(self.houseGroupId, forKey: JSONKey("houseGroupId")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherDropDownHouseGroupListAllGETResponseItem: CapturedResponse {
    /// 学院小组集合。
    public let houseGroups: [TeacherDropDownHouseGroupListAllGETResponseItemHouseGroupsItem]
    /// 学院标识，来自学院选项。
    public let houseId: Int
    /// 学院名称。
    public let houseName: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.houseGroups = try container.decode([TeacherDropDownHouseGroupListAllGETResponseItemHouseGroupsItem].self, forKey: JSONKey("houseGroups"))
        self.houseId = try container.decode(Int.self, forKey: JSONKey("houseId"))
        self.houseName = try container.decode(String.self, forKey: JSONKey("houseName"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["houseGroups", "houseId", "houseName"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("houseGroups") { try container.encode(self.houseGroups, forKey: JSONKey("houseGroups")) }
        if presentFields.contains("houseId") { try container.encode(self.houseId, forKey: JSONKey("houseId")) }
        if presentFields.contains("houseName") { try container.encode(self.houseName, forKey: JSONKey("houseName")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public typealias TeacherDropDownHouseGroupListAllGETResponse = [TeacherDropDownHouseGroupListAllGETResponseItem]
