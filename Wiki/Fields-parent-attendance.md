# parent-attendance 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentAttendanceAttendanceStatusGETResponseItem`

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

## `ParentAttendanceLeaveApplicationGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[ParentAttendanceLeaveApplicationGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceLeaveApplicationGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `approveReply` | `String` | 审批回复 | — |
| `attachment` | `[JSONValue]` | 已关联附件列表 | — |
| `auditor` | `String` | 审批人员显示信息 | — |
| `declineReason` | `String` | 审批拒绝原因 | — |
| `displayName` | `String` | 前端使用的显示名称 | — |
| `durationInDays` | `Double` | 请假时长，以天为单位 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `leaveApplicationId` | `Int` | 请假申请标识，来自请假记录 | — |
| `modifyTime` | `Int` | 最后修改时刻，Unix 毫秒 | — |
| `reason` | `String` | 请假原因说明或课程离班说明 | — |
| `reasonEnName` | `String` | 请假原因选项英文名称 | — |
| `reasonId` | `Int` | 请假原因选项标识，来自原因字典 | — |
| `reasonName` | `String` | 请假原因选项中文名称 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | leaveStatus |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | leaveKind |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceTypes` | `[String]` | 允许的考勤时段或模式 | — |
| `dailySession` | `[String]` | 日常考勤时段 | — |
| `dailyStatistics` | `[ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem]` | 按日期组织的考勤记录 | — |
| `dormitorySession` | `[String]` | 宿舍考勤时段 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `String` | 上午考勤 | — |
| `amcomment` | `String` | 上午考勤备注 | — |
| `attendances` | `[String: ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem]` | 考勤记录或统计映射 | — |
| `classPeriods` | `[ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem]` | 课节定义列表 | — |
| `date` | `Int` | 业务日期，日期型端点使用 Unix 毫秒 | — |
| `dormitoryAttendanceFlag` | `Bool` | 是否启用宿舍考勤 | — |
| `dormitoryAttendances` | `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances` | 完整宿舍考勤数据 | — |
| `editAbleAM` | `Bool` | 上午是否可编辑 | — |
| `editAbleEVE` | `Bool` | 晚间是否可编辑 | — |
| `editAblePM` | `Bool` | 下午是否可编辑 | — |
| `eve` | `String` | 晚间考勤 | — |
| `evecomment` | `String` | 晚间考勤备注 | — |
| `leaveInfo` | `[JSONValue]` | 关联请假信息 | — |
| `pm` | `String` | 下午考勤 | — |
| `pmcomment` | `String` | 下午考勤备注 | — |
| `studyRoomAttendanceFlag` | `Bool` | 是否启用自习室考勤 | — |
| `studyRoomAttendances` | `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances` | 完整自习室考勤数据 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemAttendancesItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemClassPeriodsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `end` | `Int` | 区间结束值；日期查询使用 Unix 毫秒 | — |
| `isFullPeriodArranged` | `Bool` | 是否安排完整课节 | — |
| `sevenFive` | `Bool` | 未确认语义的课节配置标记，保留上游值 | — |
| `start` | `Int` | 区间开始值；日期查询使用 Unix 毫秒 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `am` | `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm` | 上午考勤 | — |
| `eve` | `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve` | 晚间考勤 | — |
| `pm` | `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm` | 下午考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesAm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemDormitoryAttendancesPm`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendances`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `eve` | `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve` | 晚间考勤 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentAttendanceStatisticStudentSchoolYearIdGETResponseDailyStatisticsItemStudyRoomAttendancesEve`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoom` | `String` | 教室名称或完整教室对象，来自教室配置 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | studentStatus |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

