import Foundation

public struct ParentStudentDetailGETResponse: CapturedResponse {
    /// 联系地址。
    public let address: String
    /// 头像资源地址。
    public let avatarUrl: String
    /// 床位标识，来自宿舍床位配置；允许为空或缺失。
    public let bedId: JSONValue?
    /// 出生日期，Unix 毫秒。
    public let birthday: Int
    /// 是否寄宿。
    public let boarding: Bool
    /// 校车路线英文名称，保留服务端拼写。
    public let busRoutEnName: String
    /// 校车路线中文名称，保留服务端拼写。
    public let busRoutName: String
    /// 完整校车路线信息；允许为空或缺失。
    public let busRoute: JSONValue?
    /// 完整校车站点信息；允许为空或缺失。
    public let busSite: JSONValue?
    /// 校车站点英文名称。
    public let busSiteEnName: String
    /// 校车站点中文名称。
    public let busSiteName: String
    /// 此账号是否允许登录。
    public let canLogin: Bool
    /// 城市选项编码。
    public let cityCode: String
    /// 城市英文名称。
    public let cityEnName: String
    /// 城市中文名称。
    public let cityName: String
    /// 主班级标识，来自学生资料或班级选项。
    public let classId: Int
    /// 主班级名称。
    public let className: String
    /// 国家英文名称。
    public let countryEnName: String
    /// 国家选项标识。
    public let countryId: Int
    /// 国家中文名称。
    public let countryName: String
    /// 地区选项编码。
    public let districtCode: String
    /// 地区英文名称。
    public let districtEnName: String
    /// 地区中文名称。
    public let districtName: String
    /// 户籍地址，敏感资料。
    public let domicileAddress: String
    /// 户籍城市编码。
    public let domicileCity: String
    /// 户籍城市名称。
    public let domicileCityName: String
    /// 户籍地区编码。
    public let domicileDistrict: String
    /// 户籍地区名称。
    public let domicileDistrictName: String
    /// 户籍省份编码。
    public let domicileProvince: String
    /// 户籍省份名称。
    public let domicileProvinceName: String
    /// 宿舍显示名称。
    public let dormitoryName: String
    /// 邮箱地址。
    public let email: String
    /// 英文名称，可能为空。
    public let enName: String
    /// 入学日期，Unix 毫秒。
    public let enterDate: Int
    /// 入学年份或学年文本。
    public let enterYear: String
    /// 名字或拼音名。
    public let firstName: String
    /// 性别语义值。
    public let gender: SemanticValue
    /// 学院小组标识，来自学院小组选项。
    public let houseGroupId: Int
    /// 学院小组名称。
    public let houseGroupName: String
    /// 学院名称。
    public let houseName: String
    /// 身份证件号码，敏感资料。
    public let idNum: String
    /// 身份证件种类，未知代码保持未识别。
    public let idType: SemanticValue
    /// 姓氏或拼音姓。
    public let lastName: String
    /// 常用名称。
    public let moniker: String
    /// 业务实体或选项名称。
    public let name: String
    /// 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失。
    public let outDate: JSONValue?
    /// 省份选项编码。
    public let provinceCode: String
    /// 省份英文名称。
    public let provinceEnName: String
    /// 省份中文名称。
    public let provinceName: String
    /// 是否乘坐校车。
    public let schoolBus: Bool
    /// 学籍说明。
    public let schoolRollNote: String
    /// 学籍状态，具体字典尚未完整确认。
    public let schoolRollStatus: String
    /// 年段英文名称。
    public let sectionEnName: String
    /// 年级或年段标识，来自年段选项。
    public let sectionId: Int
    /// 年段名称。
    public let sectionName: String
    /// 自习室标识，来自自习室配置；允许为空或缺失。
    public let selfStudyRoomId: JSONValue?
    /// 自习室显示名称。
    public let selfStudyRoomName: String
    /// 兄弟姐妹关联信息。
    public let siblings: [JSONValue]
    /// 本业务域状态；不能跨业务域套用代码表。
    public let status: SemanticValue
    /// 学生标识，来自学生列表或课程学生名单。
    public let studentId: Int
    /// 学生学号或统计学生数量，依端点区分。
    public let studentNum: String
    /// 姓氏。
    public let surname: String
    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。
    public let additionalFields: [String: JSONValue]
    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。
    public let presentFields: Set<String>

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: JSONKey.self)
        self.address = try container.decode(String.self, forKey: JSONKey("address"))
        self.avatarUrl = try container.decode(String.self, forKey: JSONKey("avatarUrl"))
        self.bedId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("bedId"))
        self.birthday = try container.decode(Int.self, forKey: JSONKey("birthday"))
        self.boarding = try container.decode(Bool.self, forKey: JSONKey("boarding"))
        self.busRoutEnName = try container.decode(String.self, forKey: JSONKey("busRoutEnName"))
        self.busRoutName = try container.decode(String.self, forKey: JSONKey("busRoutName"))
        self.busRoute = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("busRoute"))
        self.busSite = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("busSite"))
        self.busSiteEnName = try container.decode(String.self, forKey: JSONKey("busSiteEnName"))
        self.busSiteName = try container.decode(String.self, forKey: JSONKey("busSiteName"))
        self.canLogin = try container.decode(Bool.self, forKey: JSONKey("canLogin"))
        self.cityCode = try container.decode(String.self, forKey: JSONKey("cityCode"))
        self.cityEnName = try container.decode(String.self, forKey: JSONKey("cityEnName"))
        self.cityName = try container.decode(String.self, forKey: JSONKey("cityName"))
        self.classId = try container.decode(Int.self, forKey: JSONKey("classId"))
        self.className = try container.decode(String.self, forKey: JSONKey("className"))
        self.countryEnName = try container.decode(String.self, forKey: JSONKey("countryEnName"))
        self.countryId = try container.decode(Int.self, forKey: JSONKey("countryId"))
        self.countryName = try container.decode(String.self, forKey: JSONKey("countryName"))
        self.districtCode = try container.decode(String.self, forKey: JSONKey("districtCode"))
        self.districtEnName = try container.decode(String.self, forKey: JSONKey("districtEnName"))
        self.districtName = try container.decode(String.self, forKey: JSONKey("districtName"))
        self.domicileAddress = try container.decode(String.self, forKey: JSONKey("domicileAddress"))
        self.domicileCity = try container.decode(String.self, forKey: JSONKey("domicileCity"))
        self.domicileCityName = try container.decode(String.self, forKey: JSONKey("domicileCityName"))
        self.domicileDistrict = try container.decode(String.self, forKey: JSONKey("domicileDistrict"))
        self.domicileDistrictName = try container.decode(String.self, forKey: JSONKey("domicileDistrictName"))
        self.domicileProvince = try container.decode(String.self, forKey: JSONKey("domicileProvince"))
        self.domicileProvinceName = try container.decode(String.self, forKey: JSONKey("domicileProvinceName"))
        self.dormitoryName = try container.decode(String.self, forKey: JSONKey("dormitoryName"))
        self.email = try container.decode(String.self, forKey: JSONKey("email"))
        self.enName = try container.decode(String.self, forKey: JSONKey("enName"))
        self.enterDate = try container.decode(Int.self, forKey: JSONKey("enterDate"))
        self.enterYear = try container.decode(String.self, forKey: JSONKey("enterYear"))
        self.firstName = try container.decode(String.self, forKey: JSONKey("firstName"))
        self.gender = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("gender")), domain: "gender", decoder: decoder)
        self.houseGroupId = try container.decode(Int.self, forKey: JSONKey("houseGroupId"))
        self.houseGroupName = try container.decode(String.self, forKey: JSONKey("houseGroupName"))
        self.houseName = try container.decode(String.self, forKey: JSONKey("houseName"))
        self.idNum = try container.decode(String.self, forKey: JSONKey("idNum"))
        self.idType = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("idType")), domain: "identityDocumentType", decoder: decoder)
        self.lastName = try container.decode(String.self, forKey: JSONKey("lastName"))
        self.moniker = try container.decode(String.self, forKey: JSONKey("moniker"))
        self.name = try container.decode(String.self, forKey: JSONKey("name"))
        self.outDate = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("outDate"))
        self.provinceCode = try container.decode(String.self, forKey: JSONKey("provinceCode"))
        self.provinceEnName = try container.decode(String.self, forKey: JSONKey("provinceEnName"))
        self.provinceName = try container.decode(String.self, forKey: JSONKey("provinceName"))
        self.schoolBus = try container.decode(Bool.self, forKey: JSONKey("schoolBus"))
        self.schoolRollNote = try container.decode(String.self, forKey: JSONKey("schoolRollNote"))
        self.schoolRollStatus = try container.decode(String.self, forKey: JSONKey("schoolRollStatus"))
        self.sectionEnName = try container.decode(String.self, forKey: JSONKey("sectionEnName"))
        self.sectionId = try container.decode(Int.self, forKey: JSONKey("sectionId"))
        self.sectionName = try container.decode(String.self, forKey: JSONKey("sectionName"))
        self.selfStudyRoomId = try container.decodeIfPresent(JSONValue.self, forKey: JSONKey("selfStudyRoomId"))
        self.selfStudyRoomName = try container.decode(String.self, forKey: JSONKey("selfStudyRoomName"))
        self.siblings = try container.decode([JSONValue].self, forKey: JSONKey("siblings"))
        self.status = SemanticValue.decoded(rawValue: try container.decode(JSONValue.self, forKey: JSONKey("status")), domain: "studentStatus", decoder: decoder)
        self.studentId = try container.decode(Int.self, forKey: JSONKey("studentId"))
        self.studentNum = try container.decode(String.self, forKey: JSONKey("studentNum"))
        self.surname = try container.decode(String.self, forKey: JSONKey("surname"))
        presentFields = Set(container.allKeys.map(\.stringValue))
        let known = Set<String>(["address", "avatarUrl", "bedId", "birthday", "boarding", "busRoutEnName", "busRoutName", "busRoute", "busSite", "busSiteEnName", "busSiteName", "canLogin", "cityCode", "cityEnName", "cityName", "classId", "className", "countryEnName", "countryId", "countryName", "districtCode", "districtEnName", "districtName", "domicileAddress", "domicileCity", "domicileCityName", "domicileDistrict", "domicileDistrictName", "domicileProvince", "domicileProvinceName", "dormitoryName", "email", "enName", "enterDate", "enterYear", "firstName", "gender", "houseGroupId", "houseGroupName", "houseName", "idNum", "idType", "lastName", "moniker", "name", "outDate", "provinceCode", "provinceEnName", "provinceName", "schoolBus", "schoolRollNote", "schoolRollStatus", "sectionEnName", "sectionId", "sectionName", "selfStudyRoomId", "selfStudyRoomName", "siblings", "status", "studentId", "studentNum", "surname"])
        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: JSONKey.self)
        if presentFields.contains("address") { try container.encode(self.address, forKey: JSONKey("address")) }
        if presentFields.contains("avatarUrl") { try container.encode(self.avatarUrl, forKey: JSONKey("avatarUrl")) }
        if presentFields.contains("bedId") { try container.encode(self.bedId, forKey: JSONKey("bedId")) }
        if presentFields.contains("birthday") { try container.encode(self.birthday, forKey: JSONKey("birthday")) }
        if presentFields.contains("boarding") { try container.encode(self.boarding, forKey: JSONKey("boarding")) }
        if presentFields.contains("busRoutEnName") { try container.encode(self.busRoutEnName, forKey: JSONKey("busRoutEnName")) }
        if presentFields.contains("busRoutName") { try container.encode(self.busRoutName, forKey: JSONKey("busRoutName")) }
        if presentFields.contains("busRoute") { try container.encode(self.busRoute, forKey: JSONKey("busRoute")) }
        if presentFields.contains("busSite") { try container.encode(self.busSite, forKey: JSONKey("busSite")) }
        if presentFields.contains("busSiteEnName") { try container.encode(self.busSiteEnName, forKey: JSONKey("busSiteEnName")) }
        if presentFields.contains("busSiteName") { try container.encode(self.busSiteName, forKey: JSONKey("busSiteName")) }
        if presentFields.contains("canLogin") { try container.encode(self.canLogin, forKey: JSONKey("canLogin")) }
        if presentFields.contains("cityCode") { try container.encode(self.cityCode, forKey: JSONKey("cityCode")) }
        if presentFields.contains("cityEnName") { try container.encode(self.cityEnName, forKey: JSONKey("cityEnName")) }
        if presentFields.contains("cityName") { try container.encode(self.cityName, forKey: JSONKey("cityName")) }
        if presentFields.contains("classId") { try container.encode(self.classId, forKey: JSONKey("classId")) }
        if presentFields.contains("className") { try container.encode(self.className, forKey: JSONKey("className")) }
        if presentFields.contains("countryEnName") { try container.encode(self.countryEnName, forKey: JSONKey("countryEnName")) }
        if presentFields.contains("countryId") { try container.encode(self.countryId, forKey: JSONKey("countryId")) }
        if presentFields.contains("countryName") { try container.encode(self.countryName, forKey: JSONKey("countryName")) }
        if presentFields.contains("districtCode") { try container.encode(self.districtCode, forKey: JSONKey("districtCode")) }
        if presentFields.contains("districtEnName") { try container.encode(self.districtEnName, forKey: JSONKey("districtEnName")) }
        if presentFields.contains("districtName") { try container.encode(self.districtName, forKey: JSONKey("districtName")) }
        if presentFields.contains("domicileAddress") { try container.encode(self.domicileAddress, forKey: JSONKey("domicileAddress")) }
        if presentFields.contains("domicileCity") { try container.encode(self.domicileCity, forKey: JSONKey("domicileCity")) }
        if presentFields.contains("domicileCityName") { try container.encode(self.domicileCityName, forKey: JSONKey("domicileCityName")) }
        if presentFields.contains("domicileDistrict") { try container.encode(self.domicileDistrict, forKey: JSONKey("domicileDistrict")) }
        if presentFields.contains("domicileDistrictName") { try container.encode(self.domicileDistrictName, forKey: JSONKey("domicileDistrictName")) }
        if presentFields.contains("domicileProvince") { try container.encode(self.domicileProvince, forKey: JSONKey("domicileProvince")) }
        if presentFields.contains("domicileProvinceName") { try container.encode(self.domicileProvinceName, forKey: JSONKey("domicileProvinceName")) }
        if presentFields.contains("dormitoryName") { try container.encode(self.dormitoryName, forKey: JSONKey("dormitoryName")) }
        if presentFields.contains("email") { try container.encode(self.email, forKey: JSONKey("email")) }
        if presentFields.contains("enName") { try container.encode(self.enName, forKey: JSONKey("enName")) }
        if presentFields.contains("enterDate") { try container.encode(self.enterDate, forKey: JSONKey("enterDate")) }
        if presentFields.contains("enterYear") { try container.encode(self.enterYear, forKey: JSONKey("enterYear")) }
        if presentFields.contains("firstName") { try container.encode(self.firstName, forKey: JSONKey("firstName")) }
        if presentFields.contains("gender") { try container.encode(self.gender.rawValue, forKey: JSONKey("gender")) }
        if presentFields.contains("houseGroupId") { try container.encode(self.houseGroupId, forKey: JSONKey("houseGroupId")) }
        if presentFields.contains("houseGroupName") { try container.encode(self.houseGroupName, forKey: JSONKey("houseGroupName")) }
        if presentFields.contains("houseName") { try container.encode(self.houseName, forKey: JSONKey("houseName")) }
        if presentFields.contains("idNum") { try container.encode(self.idNum, forKey: JSONKey("idNum")) }
        if presentFields.contains("idType") { try container.encode(self.idType.rawValue, forKey: JSONKey("idType")) }
        if presentFields.contains("lastName") { try container.encode(self.lastName, forKey: JSONKey("lastName")) }
        if presentFields.contains("moniker") { try container.encode(self.moniker, forKey: JSONKey("moniker")) }
        if presentFields.contains("name") { try container.encode(self.name, forKey: JSONKey("name")) }
        if presentFields.contains("outDate") { try container.encode(self.outDate, forKey: JSONKey("outDate")) }
        if presentFields.contains("provinceCode") { try container.encode(self.provinceCode, forKey: JSONKey("provinceCode")) }
        if presentFields.contains("provinceEnName") { try container.encode(self.provinceEnName, forKey: JSONKey("provinceEnName")) }
        if presentFields.contains("provinceName") { try container.encode(self.provinceName, forKey: JSONKey("provinceName")) }
        if presentFields.contains("schoolBus") { try container.encode(self.schoolBus, forKey: JSONKey("schoolBus")) }
        if presentFields.contains("schoolRollNote") { try container.encode(self.schoolRollNote, forKey: JSONKey("schoolRollNote")) }
        if presentFields.contains("schoolRollStatus") { try container.encode(self.schoolRollStatus, forKey: JSONKey("schoolRollStatus")) }
        if presentFields.contains("sectionEnName") { try container.encode(self.sectionEnName, forKey: JSONKey("sectionEnName")) }
        if presentFields.contains("sectionId") { try container.encode(self.sectionId, forKey: JSONKey("sectionId")) }
        if presentFields.contains("sectionName") { try container.encode(self.sectionName, forKey: JSONKey("sectionName")) }
        if presentFields.contains("selfStudyRoomId") { try container.encode(self.selfStudyRoomId, forKey: JSONKey("selfStudyRoomId")) }
        if presentFields.contains("selfStudyRoomName") { try container.encode(self.selfStudyRoomName, forKey: JSONKey("selfStudyRoomName")) }
        if presentFields.contains("siblings") { try container.encode(self.siblings, forKey: JSONKey("siblings")) }
        if presentFields.contains("status") { try container.encode(self.status.rawValue, forKey: JSONKey("status")) }
        if presentFields.contains("studentId") { try container.encode(self.studentId, forKey: JSONKey("studentId")) }
        if presentFields.contains("studentNum") { try container.encode(self.studentNum, forKey: JSONKey("studentNum")) }
        if presentFields.contains("surname") { try container.encode(self.surname, forKey: JSONKey("surname")) }
        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }
    }
}
