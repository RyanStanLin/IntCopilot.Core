# teacher-attendance 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherAttendanceAttendancePermissionGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classAttendance` | `Bool` | 是否具备课节考勤权限 | — |
| `dailyAttendance` | `Bool` | 是否具备日常考勤权限 | — |
| `dormitoryAttendance` | `Bool` | 是否具备宿舍考勤权限 | — |
| `lbAttendance` | `Bool` | 是否具备延展课程考勤权限 | — |
| `ssrAttendance` | `Bool` | 是否具备自习室考勤权限 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceAttendanceStatusGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassCcaGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherAttendanceClassCcaGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassCcaGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `String` | 上午考勤 | — |
| `attendanceType` | `SemanticValue` | 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构 | attendanceType |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `campusType` | `SemanticValue` | 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构 | campusType |
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `className` | `String` | 主班级名称 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `editable` | `Bool` | 当前记录是否可编辑 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `lastComment` | `String` | 上次考勤备注 | — |
| `lastStatus` | `SemanticValue` | 上次考勤状态 | attendanceStatus |
| `leaveInfo` | `JSONValue?` | 关联请假信息；允许为空或缺失 | — |
| `locked` | `Bool` | 当前记录是否已锁定 | — |
| `pm` | `String` | 下午考勤 | — |
| `sectionEnName` | `String` | 年段英文名称 | — |
| `sectionName` | `String` | 年段名称 | — |
| `seqNum` | `Int` | 当前列表显示序号 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | attendanceStatus |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNo` | `String` | 学生学号 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendances` | `TeacherAttendanceClassGETResponseAttendances` | 考勤记录或统计映射 | — |
| `currentPeriod` | `String` | 当前课节显示名称 | — |
| `lastPeriod` | `String` | 上一课节显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassGETResponseAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherAttendanceClassGETResponseAttendancesItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassGETResponseAttendancesItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `String` | 上午考勤 | — |
| `attendanceType` | `SemanticValue` | 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构 | attendanceType |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `campusType` | `SemanticValue` | 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构 | campusType |
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `className` | `String` | 主班级名称 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `editable` | `Bool` | 当前记录是否可编辑 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `lastComment` | `String` | 上次考勤备注 | — |
| `lastStatus` | `SemanticValue` | 上次考勤状态 | attendanceStatus |
| `leaveInfo` | `JSONValue?` | 关联请假信息；允许为空或缺失 | — |
| `locked` | `Bool` | 当前记录是否已锁定 | — |
| `pm` | `String` | 下午考勤 | — |
| `sectionEnName` | `String` | 年段英文名称 | — |
| `sectionName` | `String` | 年段名称 | — |
| `seqNum` | `Int` | 当前列表显示序号 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | attendanceStatus |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNo` | `String` | 学生学号 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `Int` | 选项附加元数据，类型随业务域变化 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherAttendanceClassListGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceClassListGETResponseItemSubOptionsItem`

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

## `TeacherAttendanceDailyGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceTypes` | `[String]` | 允许的考勤时段或模式 | — |
| `attendances` | `TeacherAttendanceDailyGETResponseAttendances` | 考勤记录或统计映射 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDailyGETResponseAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherAttendanceDailyGETResponseAttendancesItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDailyGETResponseAttendancesItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `String` | 上午考勤 | — |
| `attendanceType` | `SemanticValue` | 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构 | attendanceType |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `campusType` | `SemanticValue` | 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构 | campusType |
| `className` | `String` | 主班级名称 | — |
| `commentAM` | `String` | 上午考勤备注 | — |
| `commentEVE` | `String` | 晚间考勤备注 | — |
| `commentPM` | `String` | 下午考勤备注 | — |
| `editFlagAM` | `Bool` | 上午是否可编辑 | — |
| `editFlagEVE` | `Bool` | 晚间是否可编辑 | — |
| `editFlagPM` | `Bool` | 下午是否可编辑 | — |
| `eve` | `String` | 晚间考勤 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `leaveInfo` | `[TeacherAttendanceDailyGETResponseAttendancesItemsItemLeaveInfoItem]` | 关联请假信息 | — |
| `lockedAM` | `Bool` | 上午是否已锁定 | — |
| `lockedEVE` | `Bool` | 晚间是否已锁定 | — |
| `lockedPM` | `Bool` | 下午是否已锁定 | — |
| `pm` | `String` | 下午考勤 | — |
| `seqNum` | `JSONValue?` | 当前列表显示序号；允许为空或缺失 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNo` | `String` | 学生学号 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDailyGETResponseAttendancesItemsItemLeaveInfoItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `reason` | `String` | 请假原因说明或课程离班说明 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDormitoryDailyGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceTypes` | `[String]` | 允许的考勤时段或模式 | — |
| `items` | `TeacherAttendanceDormitoryDailyGETResponseItems` | 当前页的完整记录 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDormitoryDailyGETResponseItems`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherAttendanceDormitoryDailyGETResponseItemsItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDormitoryDailyGETResponseItemsItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `String` | 上午考勤 | — |
| `attendanceType` | `SemanticValue` | 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构 | attendanceType |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `bedName` | `String` | 床位显示名称 | — |
| `className` | `String` | 主班级名称 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `editableAM` | `Bool` | 上午是否可编辑 | — |
| `editableEVE` | `Bool` | 晚间是否可编辑 | — |
| `editablePM` | `Bool` | 下午是否可编辑 | — |
| `eve` | `String` | 晚间考勤 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `leaveInfo` | `[TeacherAttendanceDormitoryDailyGETResponseItemsItemsItemLeaveInfoItem]` | 关联请假信息 | — |
| `lockedAM` | `Bool` | 上午是否已锁定 | — |
| `lockedEVE` | `Bool` | 晚间是否已锁定 | — |
| `lockedPM` | `Bool` | 下午是否已锁定 | — |
| `pm` | `String` | 下午考勤 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceDormitoryDailyGETResponseItemsItemsItemLeaveInfoItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `reason` | `String` | 请假原因说明或课程离班说明 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceLeaveApplicationPendingGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[JSONValue]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceSsRoomDailyGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherAttendanceSsRoomDailyGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceSsRoomDailyGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceType` | `SemanticValue` | 服务端 attendanceType 字段；完整业务含义尚未确认，保留其完整结构 | attendanceType |
| `avatarUrl` | `String` | 头像资源地址 | — |
| `className` | `String` | 主班级名称 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `editable` | `Bool` | 当前记录是否可编辑 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `houseName` | `String` | 学院名称 | — |
| `leaveInfo` | `TeacherAttendanceSsRoomDailyGETResponseItemsItemLeaveInfo?` | 关联请假信息；允许为空或缺失 | — |
| `locked` | `Bool` | 当前记录是否已锁定 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | attendanceStatus |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceSsRoomDailyGETResponseItemsItemLeaveInfo`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `reason` | `String` | 请假原因说明或课程离班说明 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticClassGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticClassGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticClassGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassPeriodGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticClassPeriodGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticClassPeriodGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassPeriodGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassPeriodGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticClassPeriodGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticClassPeriodGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticCourseStudentGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticCourseStudentGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticCourseStudentGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticCourseStudentGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticCourseStudentGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticCourseStudentGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticCourseStudentGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticDormitoryGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticDormitoryGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticDormitoryGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticDormitoryGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticDormitoryGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticDormitoryGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticDormitoryGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticHouseGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticHouseGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticHouseGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticHouseGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticHouseGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticHouseGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticHouseGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSectionGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticSectionGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticSectionGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSectionGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSectionGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticSectionGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSectionGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSsrGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `kinds` | `[TeacherAttendanceStatisticSsrGETResponseKindsItem]` | 统计使用的考勤状态字典 | — |
| `statistics` | `[TeacherAttendanceStatisticSsrGETResponseStatisticsItem]` | 按业务维度聚合的统计 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSsrGETResponseKindsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `attend` | `Bool` | 是否计为出席 | — |
| `attendanceKindId` | `Int` | 考勤状态所属种类标识 | — |
| `attendanceStatusId` | `Int` | 考勤状态字典记录标识 | — |
| `color` | `String` | 显示颜色 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `permissions` | `Bool` | 此状态或操作的权限标记 | — |
| `show` | `Bool` | 是否允许前端显示该选项 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSsrGETResponseStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `allNums` | `Int` | 统计范围内总记录数量 | — |
| `attendantNums` | `Int` | 统计范围内出勤记录数量 | — |
| `attendantRate` | `Double` | 出勤比率，按服务器统计规则解释 | — |
| `dimension` | `String` | 统计维度中文名称 | — |
| `enDimension` | `String` | 统计维度英文名称 | — |
| `id` | `Int?` | 当前业务实体标识；允许为空或缺失 | — |
| `statisticDetail` | `[String: TeacherAttendanceStatisticSsrGETResponseStatisticsItemStatisticDetailItem]` | 此维度的完整统计明细 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticSsrGETResponseStatisticsItemStatisticDetailItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `count` | `Int` | 当前状态或维度的记录数量 | — |
| `rate` | `Double` | 服务器返回的统计比率；刻度由业务规则决定，不自动换算 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceTypes` | `[String]` | 允许的考勤时段或模式 | — |
| `attendances` | `[String: TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseAttendancesItem]` | 考勤记录或统计映射 | — |
| `classPeriods` | `[TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseClassPeriodsItem]` | 课节定义列表 | — |
| `dailySession` | `[String]` | 日常考勤时段 | — |
| `dormitoryAttendanceFlag` | `Bool` | 是否启用宿舍考勤 | — |
| `dormitoryAttendances` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendances` | 完整宿舍考勤数据 | — |
| `dormitorySession` | `[String]` | 宿舍考勤时段 | — |
| `full_day` | `Bool` | 全日考勤记录或统计节点 | — |
| `sessionAttendances` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendances` | 按考勤时段组织的完整记录 | — |
| `studyRoomAttendanceFlag` | `Bool` | 是否启用自习室考勤 | — |
| `studyRoomAttendances` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendances` | 完整自习室考勤数据 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseAttendancesItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `absent` | `Int?` | 缺席记录或数量；允许为空或缺失 | — |
| `illness` | `Int?` | 病假记录或数量；允许为空或缺失 | — |
| `intime` | `Int` | 出席记录或出席数量 | — |
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |
| `personal` | `Int?` | 可谅解缺席记录或数量；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseClassPeriodsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `end` | `Int` | 区间结束值；日期查询使用 Unix 毫秒 | — |
| `isCCA` | `Bool` | 是否延展课程 | — |
| `isFullPeriodArranged` | `Bool` | 是否安排完整课节 | — |
| `sevenFive` | `Bool` | 未确认语义的课节配置标记，保留上游值 | — |
| `start` | `Int` | 区间开始值；日期查询使用 Unix 毫秒 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesAm` | 上午考勤 | — |
| `eve` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesEve` | 晚间考勤 | — |
| `pm` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesPm` | 下午考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesAm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseDormitoryAttendancesPm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesAm` | 上午考勤 | — |
| `eve` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesEve` | 晚间考勤 | — |
| `pm` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesPm` | 下午考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesAm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `illness` | `Int` | 病假记录或数量 | — |
| `intime` | `Int` | 出席记录或出席数量 | — |
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |
| `weekendHoliday` | `Int` | 假期记录或数量 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |
| `weekendHoliday` | `Int` | 假期记录或数量 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseSessionAttendancesPm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |
| `weekendHoliday` | `Int` | 假期记录或数量 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `eve` | `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendancesEve` | 晚间考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponseStudyRoomAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `noRecords` | `Int` | 未考勤记录或未考勤数量，依所在统计节点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceTypes` | `[String]` | 允许的考勤时段或模式 | — |
| `dailySession` | `[String]` | 日常考勤时段 | — |
| `dailyStatistics` | `[TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem]` | 按日期组织的考勤记录 | — |
| `dormitorySession` | `[String]` | 宿舍考勤时段 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `String` | 上午考勤 | — |
| `amcomment` | `String` | 上午考勤备注 | — |
| `attendances` | `[String: TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem]` | 考勤记录或统计映射 | — |
| `classPeriods` | `[TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem]` | 课节定义列表 | — |
| `date` | `Int` | 业务日期，日期型端点使用 Unix 毫秒 | — |
| `dormitoryAttendanceFlag` | `Bool` | 是否启用宿舍考勤 | — |
| `dormitoryAttendances` | `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances` | 完整宿舍考勤数据 | — |
| `editAbleAM` | `Bool` | 上午是否可编辑 | — |
| `editAbleEVE` | `Bool` | 晚间是否可编辑 | — |
| `editAblePM` | `Bool` | 下午是否可编辑 | — |
| `eve` | `String` | 晚间考勤 | — |
| `evecomment` | `String` | 晚间考勤备注 | — |
| `leaveInfo` | `[JSONValue]` | 关联请假信息 | — |
| `pm` | `String` | 下午考勤 | — |
| `pmcomment` | `String` | 下午考勤备注 | — |
| `studyRoomAttendanceFlag` | `Bool` | 是否启用自习室考勤 | — |
| `studyRoomAttendances` | `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances` | 完整自习室考勤数据 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `editAble` | `Bool` | 当前记录是否可编辑，保留服务端拼写 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `end` | `Int` | 区间结束值；日期查询使用 Unix 毫秒 | — |
| `isCCA` | `Bool` | 是否延展课程 | — |
| `isFullPeriodArranged` | `Bool` | 是否安排完整课节 | — |
| `sevenFive` | `Bool` | 未确认语义的课节配置标记，保留上游值 | — |
| `start` | `Int` | 区间开始值；日期查询使用 Unix 毫秒 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm` | 上午考勤 | — |
| `eve` | `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve` | 晚间考勤 | — |
| `pm` | `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm` | 下午考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `JSONValue?` | 具体课节安排标识，来自考勤或课表；允许为空或缺失 | — |
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `editAble` | `Bool` | 当前记录是否可编辑，保留服务端拼写 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `JSONValue?` | 具体课节安排标识，来自考勤或课表；允许为空或缺失 | — |
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `editAble` | `Bool` | 当前记录是否可编辑，保留服务端拼写 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `JSONValue?` | 具体课节安排标识，来自考勤或课表；允许为空或缺失 | — |
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `editAble` | `Bool` | 当前记录是否可编辑，保留服务端拼写 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `eve` | `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve` | 晚间考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `JSONValue?` | 具体课节安排标识，来自考勤或课表；允许为空或缺失 | — |
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `editAble` | `Bool` | 当前记录是否可编辑，保留服务端拼写 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

