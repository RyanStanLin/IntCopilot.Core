# teacher-dropDown 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherDropDownAuthTeachersForMessageGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `dataPermission` | `JSONValue?` | 当前用户的数据权限集合；允许为空或缺失 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isTeacher` | `Bool` | 是否关联教师身份 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownAuthTeachersForMyClassGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `dataPermission` | `JSONValue?` | 当前用户的数据权限集合；允许为空或缺失 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isTeacher` | `Bool` | 是否关联教师身份 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownCampusListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `Bool` | 选项附加元数据，类型随业务域变化 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownClassListAllGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherDropDownClassListAllGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownClassListAllGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownClassRoomCascadeGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherDropDownClassRoomCascadeGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownClassRoomCascadeGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownCourseTeacherGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `groupLabel` | `String` | 选项分组显示名称 | — |
| `list` | `[TeacherDropDownCourseTeacherGETResponseItemListItem]` | 该分组的完整选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownCourseTeacherGETResponseItemListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `relationId` | `Int` | 关系选项标识 | — |
| `relationName` | `String` | 关系显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownDormitoryListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownFloorAndDormitoryListAllGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherDropDownFloorAndDormitoryListAllGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownFloorAndDormitoryListAllGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownFloorAndDormitoryListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherDropDownFloorAndDormitoryListGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownFloorAndDormitoryListGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownFloorListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownHeadTeachersGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `groupLabel` | `String` | 选项分组显示名称 | — |
| `list` | `[TeacherDropDownHeadTeachersGETResponseItemListItem]` | 该分组的完整选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownHeadTeachersGETResponseItemListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `relationId` | `Int` | 关系选项标识 | — |
| `relationName` | `String` | 关系显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownHouseGroupListAllGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `houseGroups` | `[TeacherDropDownHouseGroupListAllGETResponseItemHouseGroupsItem]` | 学院小组集合 | — |
| `houseId` | `Int` | 学院标识，来自学院选项 | — |
| `houseName` | `String` | 学院名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownHouseGroupListAllGETResponseItemHouseGroupsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `houseGroupId` | `Int` | 学院小组标识，来自学院小组选项 | — |
| `name` | `String` | 业务实体或选项名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownMessageReceiverGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherDropDownMessageReceiverGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownMessageReceiverGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `academy` | `String` | 所属学院显示名称 | — |
| `boarding` | `Bool` | 是否寄宿 | — |
| `className` | `String` | 主班级名称 | — |
| `dormitoryName` | `String` | 宿舍显示名称 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `Int` | 入学日期，Unix 毫秒 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `parentId` | `Int` | 家长标识 | — |
| `relationShip` | `SemanticValue` | 家长与学生的关系，保留服务端拼写 | relationship |
| `schoolBus` | `Bool` | 是否乘坐校车 | — |
| `selfStudyRoomName` | `String` | 自习室显示名称 | — |
| `seqNum` | `Int` | 当前列表显示序号 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSchoolYearListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `Int` | 选项附加元数据，类型随业务域变化 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSchoolYearRuleListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `extraValue` | `String` | 选项附加元数据，类型随业务域变化 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSectionCascadeGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `String` | 选项附加元数据，类型随业务域变化 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherDropDownSectionCascadeGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSectionCascadeGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSectionListCpAttendanceGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSemesterGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `schoolYearId` | `Int` | 学年标识，来自当前学年或学年选项 | — |
| `schoolYearName` | `String` | 学年显示名称 | — |
| `semesterId` | `Int` | 学期标识，来自学期选项 | — |
| `semesterType` | `SemanticValue` | 服务端 semesterType 字段；完整业务含义尚未确认，保留其完整结构 | semesterType |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | semesterStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSsRoomListAllGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSsRoomListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSubjectListForAttendanceGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownSubjectListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownTaskTypeByCourseGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `colour` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isExam` | `Bool` | 是否考试类型 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `taskTypeId` | `Int` | 任务类型标识，来自任务类型选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownTaskTypeGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `colour` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isExam` | `Bool` | 是否考试类型 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `taskTypeId` | `Int` | 任务类型标识，来自任务类型选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownTutorsGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `groupLabel` | `String` | 选项分组显示名称 | — |
| `list` | `[TeacherDropDownTutorsGETResponseItemListItem]` | 该分组的完整选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDropDownTutorsGETResponseItemListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `relationId` | `Int` | 关系选项标识 | — |
| `relationName` | `String` | 关系显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

