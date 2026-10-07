import Foundation

public struct TeacherStudentClassAndHouseGETResponseCcaListItem: CapturedResponse {
    /// 课节定义标识，来自课节列表；允许为空或缺失。
    public let classPeriodId: JSONValue?
    /// 课节显示名称。
    public let classPeriodName: String
    /// 教室显示名称。
    public let classRoomName: String
    /// 课程筛选或课程功能标记，按所属接口解释。
    public let courseFlag: Bool
    /// 区间结束值；日期查询使用 Unix 毫秒；允许为空或缺失。
    public let end: JSONValue?
    /// 当前业务实体标识。
    public let id: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 区间开始值；日期查询使用 Unix 毫秒；允许为空或缺失。
    public let start: JSONValue?
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classPeriodId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classPeriodId"))
        self.classPeriodName = try container.decode(String.self, forKey: JSONKey("classPeriodName"))
        self.classRoomName = try container.decode(String.self, forKey: JSONKey("classRoomName"))
        self.courseFlag = try container.decode(Bool.self, forKey: JSONKey("courseFlag"))
        self.end = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("end"))
        self.id = try container.decode(Int.self, forKey: JSONKey("id"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.start = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("start"))
        self.studentNum = try container.decode(Int.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classPeriodId", "classPeriodName", "classRoomName", "courseFlag", "end", "id", "name", "start", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classPeriodId") { try container.encode(self.classPeriodId, forKey: JSONKey("classPeriodId")) }
        if presentFields.contains("classPeriodName") { try container.encode(self.classPeriodName, forKey: JSONKey("classPeriodName")) }
        if presentFields.contains("classRoomName") { try container.encode(self.classRoomName, forKey: JSONKey("classRoomName")) }
        if presentFields.contains("courseFlag") { try container.encode(self.courseFlag, forKey: JSONKey("courseFlag")) }
        if presentFields.contains("end") { try container.encode(self.end, forKey: JSONKey("end")) }
        if presentFields.contains("id") { try container.encode(self.id, forKey: JSONKey("id")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("start") { try container.encode(self.start, forKey: JSONKey("start")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherStudentClassAndHouseGETResponseCourseListItem: CapturedResponse {
    /// 课节定义标识，来自课节列表；允许为空或缺失。
    public let classPeriodId: JSONValue?
    /// 课节显示名称。
    public let classPeriodName: String
    /// 教室显示名称。
    public let classRoomName: String
    /// 课程筛选或课程功能标记，按所属接口解释。
    public let courseFlag: Bool
    /// 区间结束值；日期查询使用 Unix 毫秒；允许为空或缺失。
    public let end: JSONValue?
    /// 当前业务实体标识。
    public let id: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 区间开始值；日期查询使用 Unix 毫秒；允许为空或缺失。
    public let start: JSONValue?
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.classPeriodId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("classPeriodId"))
        self.classPeriodName = try container.decode(String.self, forKey: JSONKey("classPeriodName"))
        self.classRoomName = try container.decode(String.self, forKey: JSONKey("classRoomName"))
        self.courseFlag = try container.decode(Bool.self, forKey: JSONKey("courseFlag"))
        self.end = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("end"))
        self.id = try container.decode(Int.self, forKey: JSONKey("id"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.start = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("start"))
        self.studentNum = try container.decode(Int.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["classPeriodId", "classPeriodName", "classRoomName", "courseFlag", "end", "id", "name", "start", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("classPeriodId") { try container.encode(self.classPeriodId, forKey: JSONKey("classPeriodId")) }
        if presentFields.contains("classPeriodName") { try container.encode(self.classPeriodName, forKey: JSONKey("classPeriodName")) }
        if presentFields.contains("classRoomName") { try container.encode(self.classRoomName, forKey: JSONKey("classRoomName")) }
        if presentFields.contains("courseFlag") { try container.encode(self.courseFlag, forKey: JSONKey("courseFlag")) }
        if presentFields.contains("end") { try container.encode(self.end, forKey: JSONKey("end")) }
        if presentFields.contains("id") { try container.encode(self.id, forKey: JSONKey("id")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("start") { try container.encode(self.start, forKey: JSONKey("start")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherStudentClassAndHouseGETResponseHouseListItem: CapturedResponse {
    /// 当前业务实体标识。
    public let id: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.id = try container.decode(Int.self, forKey: JSONKey("id"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.studentNum = try container.decode(Int.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["id", "name", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("id") { try container.encode(self.id, forKey: JSONKey("id")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherStudentClassAndHouseGETResponseSelfStudyRoomListItem: CapturedResponse {
    /// 当前业务实体标识。
    public let id: Int
    /// 业务实体或选项名称。
    public let name: String
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: Int
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.id = try container.decode(Int.self, forKey: JSONKey("id"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.studentNum = try container.decode(Int.self, forKey: JSONKey("studentNum"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["id", "name", "studentNum"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("id") { try container.encode(self.id, forKey: JSONKey("id")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}

public struct TeacherStudentClassAndHouseGETResponse: CapturedResponse {
    /// 延展课程列表。
    public let ccaList: [TeacherStudentClassAndHouseGETResponseCcaListItem]
    /// 班级列表。
    public let classList: [JSONValue]
    /// 常规课程列表。
    public let courseList: [TeacherStudentClassAndHouseGETResponseCourseListItem]
    /// 楼层列表。
    public let floorList: [JSONValue]
    /// 学院列表。
    public let houseList: [TeacherStudentClassAndHouseGETResponseHouseListItem]
    /// 自习室列表。
    public let selfStudyRoomList: [TeacherStudentClassAndHouseGETResponseSelfStudyRoomListItem]
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.ccaList = try container.decode([TeacherStudentClassAndHouseGETResponseCcaListItem].self, forKey: JSONKey("ccaList"))
        self.classList = try container.decode([JSONValue].self, forKey: JSONKey("classList"))
        self.courseList = try container.decode([TeacherStudentClassAndHouseGETResponseCourseListItem].self, forKey: JSONKey("courseList"))
        self.floorList = try container.decode([JSONValue].self, forKey: JSONKey("floorList"))
        self.houseList = try container.decode([TeacherStudentClassAndHouseGETResponseHouseListItem].self, forKey: JSONKey("houseList"))
        self.selfStudyRoomList = try container.decode([TeacherStudentClassAndHouseGETResponseSelfStudyRoomListItem].self, forKey: JSONKey("selfStudyRoomList"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["ccaList", "classList", "courseList", "floorList", "houseList", "selfStudyRoomList"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("ccaList") { try container.encode(self.ccaList, forKey: JSONKey("ccaList")) }
        if presentFields.contains("classList") { try container.encode(self.classList, forKey: JSONKey("classList")) }
        if presentFields.contains("courseList") { try container.encode(self.courseList, forKey: JSONKey("courseList")) }
        if presentFields.contains("floorList") { try container.encode(self.floorList, forKey: JSONKey("floorList")) }
        if presentFields.contains("houseList") { try container.encode(self.houseList, forKey: JSONKey("houseList")) }
        if presentFields.contains("selfStudyRoomList") { try container.encode(self.selfStudyRoomList, forKey: JSONKey("selfStudyRoomList")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
