# teacher-student 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherStudentClassAndHouseGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `ccaList` | `[TeacherStudentClassAndHouseGETResponseCcaListItem]` | 延展课程列表 | — |
| `classList` | `[JSONValue]` | 班级列表 | — |
| `courseList` | `[TeacherStudentClassAndHouseGETResponseCourseListItem]` | 常规课程列表 | — |
| `floorList` | `[JSONValue]` | 楼层列表 | — |
| `houseList` | `[TeacherStudentClassAndHouseGETResponseHouseListItem]` | 学院列表 | — |
| `selfStudyRoomList` | `[TeacherStudentClassAndHouseGETResponseSelfStudyRoomListItem]` | 自习室列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentClassAndHouseGETResponseCcaListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `JSONValue?` | 课节定义标识，来自课节列表；允许为空或缺失 | — |
| `classPeriodName` | `String` | 课节显示名称 | — |
| `classRoomName` | `String` | 教室显示名称 | — |
| `courseFlag` | `Bool` | 课程筛选或课程功能标记，按所属接口解释 | — |
| `end` | `JSONValue?` | 区间结束值；日期查询使用 Unix 毫秒；允许为空或缺失 | — |
| `id` | `Int` | 当前业务实体标识 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `start` | `JSONValue?` | 区间开始值；日期查询使用 Unix 毫秒；允许为空或缺失 | — |
| `studentNum` | `Int` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentClassAndHouseGETResponseCourseListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `JSONValue?` | 课节定义标识，来自课节列表；允许为空或缺失 | — |
| `classPeriodName` | `String` | 课节显示名称 | — |
| `classRoomName` | `String` | 教室显示名称 | — |
| `courseFlag` | `Bool` | 课程筛选或课程功能标记，按所属接口解释 | — |
| `end` | `JSONValue?` | 区间结束值；日期查询使用 Unix 毫秒；允许为空或缺失 | — |
| `id` | `Int` | 当前业务实体标识 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `start` | `JSONValue?` | 区间开始值；日期查询使用 Unix 毫秒；允许为空或缺失 | — |
| `studentNum` | `Int` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentClassAndHouseGETResponseHouseListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `id` | `Int` | 当前业务实体标识 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `studentNum` | `Int` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentClassAndHouseGETResponseSelfStudyRoomListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `id` | `Int` | 当前业务实体标识 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `studentNum` | `Int` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentClassInfoGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classType` | `SemanticValue` | 服务端 classType 字段；完整业务含义尚未确认，保留其完整结构 | classType |
| `classTypeName` | `String` | 班级种类名称 | — |
| `teachers` | `[TeacherStudentClassInfoGETResponseItemTeachersItem]` | 关联教师列表 | — |
| `tutorTeachers` | `[JSONValue]` | 辅导师集合 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentClassInfoGETResponseItemTeachersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `displayName` | `String` | 前端使用的显示名称 | — |
| `email` | `String` | 邮箱地址 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentDetailGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `address` | `String` | 联系地址 | — |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `bedId` | `JSONValue?` | 床位标识，来自宿舍床位配置；允许为空或缺失 | — |
| `birthday` | `Int` | 出生日期，Unix 毫秒 | — |
| `boarding` | `Bool` | 是否寄宿 | — |
| `busRoutEnName` | `String` | 校车路线英文名称，保留服务端拼写 | — |
| `busRoutName` | `String` | 校车路线中文名称，保留服务端拼写 | — |
| `busRoute` | `JSONValue?` | 完整校车路线信息；允许为空或缺失 | — |
| `busSite` | `JSONValue?` | 完整校车站点信息；允许为空或缺失 | — |
| `busSiteEnName` | `String` | 校车站点英文名称 | — |
| `busSiteName` | `String` | 校车站点中文名称 | — |
| `canLogin` | `Bool` | 此账号是否允许登录 | — |
| `cityCode` | `String` | 城市选项编码 | — |
| `cityEnName` | `String` | 城市英文名称 | — |
| `cityName` | `String` | 城市中文名称 | — |
| `classId` | `Int` | 主班级标识，来自学生资料或班级选项 | — |
| `className` | `String` | 主班级名称 | — |
| `countryEnName` | `String` | 国家英文名称 | — |
| `countryId` | `Int` | 国家选项标识 | — |
| `countryName` | `String` | 国家中文名称 | — |
| `districtCode` | `String` | 地区选项编码 | — |
| `districtEnName` | `String` | 地区英文名称 | — |
| `districtName` | `String` | 地区中文名称 | — |
| `domicileAddress` | `String` | 户籍地址，敏感资料 | — |
| `domicileCity` | `String` | 户籍城市编码 | — |
| `domicileCityName` | `String` | 户籍城市名称 | — |
| `domicileDistrict` | `String` | 户籍地区编码 | — |
| `domicileDistrictName` | `String` | 户籍地区名称 | — |
| `domicileProvince` | `String` | 户籍省份编码 | — |
| `domicileProvinceName` | `String` | 户籍省份名称 | — |
| `dormitoryName` | `String` | 宿舍显示名称 | — |
| `email` | `String` | 邮箱地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `Int` | 入学日期，Unix 毫秒 | — |
| `enterYear` | `String` | 入学年份或学年文本 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `houseGroupId` | `Int` | 学院小组标识，来自学院小组选项 | — |
| `houseGroupName` | `String` | 学院小组名称 | — |
| `houseName` | `String` | 学院名称 | — |
| `idNum` | `String` | 身份证件号码，敏感资料 | — |
| `idType` | `SemanticValue` | 身份证件种类，未知代码保持未识别 | identityDocumentType |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `moniker` | `String` | 常用名称 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `outDate` | `JSONValue?` | 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失 | — |
| `provinceCode` | `String` | 省份选项编码 | — |
| `provinceEnName` | `String` | 省份英文名称 | — |
| `provinceName` | `String` | 省份中文名称 | — |
| `schoolBus` | `Bool` | 是否乘坐校车 | — |
| `schoolRollNote` | `String` | 学籍说明 | — |
| `schoolRollStatus` | `String` | 学籍状态，具体字典尚未完整确认 | — |
| `sectionEnName` | `String` | 年段英文名称 | — |
| `sectionId` | `Int` | 年级或年段标识，来自年段选项 | — |
| `sectionName` | `String` | 年段名称 | — |
| `selfStudyRoomId` | `JSONValue?` | 自习室标识，来自自习室配置；允许为空或缺失 | — |
| `selfStudyRoomName` | `String` | 自习室显示名称 | — |
| `siblings` | `[JSONValue]` | 兄弟姐妹关联信息 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |
| `surname` | `String` | 姓氏 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentMyStudentPOSTResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherStudentMyStudentPOSTResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentMyStudentPOSTResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `birthday` | `Int` | 出生日期，Unix 毫秒 | — |
| `className` | `String` | 主班级名称 | — |
| `dormitory` | `Bool` | 完整宿舍对象或宿舍名称 | — |
| `dormitoryName` | `String` | 宿舍显示名称 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `Int` | 入学日期，Unix 毫秒 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `graduateTime` | `JSONValue?` | 毕业时刻，Unix 毫秒；允许为空或缺失 | — |
| `graduateTo` | `String` | 毕业去向文本 | — |
| `graduateYear` | `String` | 毕业年份 | — |
| `haveSiblings` | `Bool` | 是否有兄弟姐妹关联 | — |
| `house` | `String` | 学院名称 | — |
| `lastClassDate` | `JSONValue?` | 最后参与课程日期，Unix 毫秒；允许为空或缺失 | — |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `medical` | `String` | 医疗说明，属于敏感资料 | — |
| `medicalTag` | `Bool` | 是否有医疗提示 | — |
| `medium` | `String` | 授课语言或相关提示文本 | — |
| `mediumTag` | `Bool` | 是否有语言提示标记 | — |
| `moniker` | `String` | 常用名称 | — |
| `myStudent` | `Bool` | 是否属于当前教师负责学生 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `outDate` | `JSONValue?` | 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失 | — |
| `parentEmail` | `String` | 家长邮箱显示文本 | — |
| `parentsEmail` | `[String]` | 家长邮箱列表 | — |
| `points` | `JSONValue?` | 本次行为积分；允许为空或缺失 | — |
| `schoolRollNote` | `String` | 学籍说明 | — |
| `schoolRollStatus` | `String` | 学籍状态，具体字典尚未完整确认 | — |
| `section` | `String` | 完整年段对象 | — |
| `selfStudyRoomName` | `String` | 自习室显示名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |
| `studentEmail` | `String` | 学生邮箱 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |
| `surname` | `String` | 姓氏 | — |
| `toSchool` | `String` | 转学目标学校文本 | — |
| `transReasonName` | `String` | 转学原因名称 | — |
| `transRemark` | `String` | 转学说明 | — |
| `zhName` | `String` | 中文显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentStudentBriefInfoGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceType` | `SemanticValue` | 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构 | attendanceType |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `campusType` | `SemanticValue` | 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构 | campusType |
| `className` | `String` | 主班级名称 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `Int` | 入学日期，Unix 毫秒 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `graduateTime` | `JSONValue?` | 毕业时刻，Unix 毫秒；允许为空或缺失 | — |
| `house` | `String` | 学院名称 | — |
| `lastClassDate` | `JSONValue?` | 最后参与课程日期，Unix 毫秒；允许为空或缺失 | — |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `medical` | `String` | 医疗说明，属于敏感资料 | — |
| `medicalTag` | `Bool` | 是否有医疗提示 | — |
| `medium` | `String` | 授课语言或相关提示文本 | — |
| `mediumTag` | `Bool` | 是否有语言提示标记 | — |
| `myStudent` | `Bool` | 是否属于当前教师负责学生 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `outDate` | `JSONValue?` | 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失 | — |
| `points` | `Int` | 本次行为积分 | — |
| `realStatus` | `String` | 上游实际状态，须按所属业务解释 | — |
| `sectionName` | `String` | 年段名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |
| `studentId` | `JSONValue?` | 学生标识，来自学生列表或课程学生名单；允许为空或缺失 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherStudentStudentIdPOSTResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `myStudent` | `Bool` | 是否属于当前教师负责学生 | — |
| `parentsEmail` | `[String]` | 家长邮箱列表 | — |
| `studentEmail` | `String` | 学生邮箱 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

