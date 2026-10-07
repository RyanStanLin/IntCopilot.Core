import Foundation

public struct TeacherPerformanceTaskPOSTResponseDataItemMalesItem: CapturedResponse {
    /// 是否寄宿。
    public let boarding: Bool
    /// 成绩列标识，来自列配置；允许为空或缺失。
    public let columnId: JSONValue?
    /// 课程标识或课程引用，来自课程选择或课表；允许为空或缺失。
    public let courseId: JSONValue?
    /// 性别语义值。
    public let gender: SemanticValue
    /// 业务实体或选项名称。
    public let name: String
    /// 分数；单位及评分方式由任务或成绩规则决定。
    public let score: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.boarding = try container.decode(Bool.self, forKey: JSONKey("boarding"))
        self.columnId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("columnId"))
        self.courseId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("courseId"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.score = try container.decode(Double.self, forKey: JSONKey("score"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["boarding", "columnId", "courseId", "gender", "name", "score"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("boarding") { try container.encode(self.boarding, forKey: JSONKey("boarding")) }
        if presentFields.contains("columnId") { try container.encode(self.columnId, forKey: JSONKey("columnId")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherPerformanceTaskPOSTResponseDataItemUnBordersItem: CapturedResponse {
    /// 是否寄宿。
    public let boarding: Bool
    /// 成绩列标识，来自列配置；允许为空或缺失。
    public let columnId: JSONValue?
    /// 课程标识或课程引用，来自课程选择或课表；允许为空或缺失。
    public let courseId: JSONValue?
    /// 性别语义值。
    public let gender: SemanticValue
    /// 业务实体或选项名称。
    public let name: String
    /// 分数；单位及评分方式由任务或成绩规则决定。
    public let score: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.boarding = try container.decode(Bool.self, forKey: JSONKey("boarding"))
        self.columnId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("columnId"))
        self.courseId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("courseId"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.score = try container.decode(Double.self, forKey: JSONKey("score"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["boarding", "columnId", "courseId", "gender", "name", "score"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("boarding") { try container.encode(self.boarding, forKey: JSONKey("boarding")) }
        if presentFields.contains("columnId") { try container.encode(self.columnId, forKey: JSONKey("columnId")) }
        if presentFields.contains("courseId") { try container.encode(self.courseId, forKey: JSONKey("courseId")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("score") { try container.encode(self.score, forKey: JSONKey("score")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherPerformanceTaskPOSTResponseDataItem: CapturedResponse {
    /// 寄宿学生数量，保留服务端拼写。
    public let borders: [JSONValue]
    /// 女生数量。
    public let females: [JSONValue]
    /// 统计区间上限。
    public let higher: Int
    /// 显示标签。
    public let label: String
    /// 统计区间下限。
    public let lower: Int
    /// 男生数量。
    public let males: [TeacherPerformanceTaskPOSTResponseDataItemMalesItem]
    /// 当前节点数量。
    public let num: Int
    /// 非寄宿学生数量，保留服务端拼写。
    public let unBorders: [TeacherPerformanceTaskPOSTResponseDataItemUnBordersItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.borders = try container.decode([JSONValue].self, forKey: JSONKey("borders"))
        self.females = try container.decode([JSONValue].self, forKey: JSONKey("females"))
        self.higher = try container.decode(Int.self, forKey: JSONKey("higher"))
        self.label = try container.decode(String.self, forKey: JSONKey("label"))
        self.lower = try container.decode(Int.self, forKey: JSONKey("lower"))
        self.males = try container.decode([TeacherPerformanceTaskPOSTResponseDataItemMalesItem].self, forKey: JSONKey("males"))
        self.num = try container.decode(Int.self, forKey: JSONKey("num"))
        self.unBorders = try container.decode([TeacherPerformanceTaskPOSTResponseDataItemUnBordersItem].self, forKey: JSONKey("unBorders"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["borders", "females", "higher", "label", "lower", "males", "num", "unBorders"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("borders") { try container.encode(self.borders, forKey: JSONKey("borders")) }
        if presentFields.contains("females") { try container.encode(self.females, forKey: JSONKey("females")) }
        if presentFields.contains("higher") { try container.encode(self.higher, forKey: JSONKey("higher")) }
        if presentFields.contains("label") { try container.encode(self.label, forKey: JSONKey("label")) }
        if presentFields.contains("lower") { try container.encode(self.lower, forKey: JSONKey("lower")) }
        if presentFields.contains("males") { try container.encode(self.males, forKey: JSONKey("males")) }
        if presentFields.contains("num") { try container.encode(self.num, forKey: JSONKey("num")) }
        if presentFields.contains("unBorders") { try container.encode(self.unBorders, forKey: JSONKey("unBorders")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherPerformanceTaskPOSTResponse: CapturedResponse {
    /// 平均分。
    public let avgScore: Double
    /// 完整业务数据；结构由当前端点决定。
    public let data: [TeacherPerformanceTaskPOSTResponseDataItem]
    /// 已评分学生数量。
    public let gradedNum: Int
    /// 最低分。
    public let lowestScore: Double
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: Int
    /// 评分上限或统计最高分，依端点业务区分。
    public let topScore: Double
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.avgScore = try container.decode(Double.self, forKey: JSONKey("avgScore"))
        self.data = try container.decode([TeacherPerformanceTaskPOSTResponseDataItem].self, forKey: JSONKey("data"))
        self.gradedNum = try container.decode(Int.self, forKey: JSONKey("gradedNum"))
        self.lowestScore = try container.decode(Double.self, forKey: JSONKey("lowestScore"))
        self.studentNum = try container.decode(Int.self, forKey: JSONKey("studentNum"))
        self.topScore = try container.decode(Double.self, forKey: JSONKey("topScore"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["avgScore", "data", "gradedNum", "lowestScore", "studentNum", "topScore"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("avgScore") { try container.encode(self.avgScore, forKey: JSONKey("avgScore")) }
        if presentFields.contains("data") { try container.encode(self.data, forKey: JSONKey("data")) }
        if presentFields.contains("gradedNum") { try container.encode(self.gradedNum, forKey: JSONKey("gradedNum")) }
        if presentFields.contains("lowestScore") { try container.encode(self.lowestScore, forKey: JSONKey("lowestScore")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        if presentFields.contains("topScore") { try container.encode(self.topScore, forKey: JSONKey("topScore")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
