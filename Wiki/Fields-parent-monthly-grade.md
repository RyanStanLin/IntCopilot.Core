# parent-monthly-grade 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentMonthlyGradeMonthlyGradeByStudentGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enName` | `String` | 英文名称，可能为空 | — |
| `gradePeriodId` | `Int` | 成绩周期标识，来自报告周期选项 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `requestUrl` | `String` | 报告请求地址或路径 | — |
| `schoolYear` | `String` | 所属学年显示文本或选项对象 | — |
| `studentId` | `JSONValue?` | 学生标识，来自学生列表或课程学生名单；允许为空或缺失 | — |
| `templateId` | `Int` | 报告模板标识 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | unconfirmed:/api/monthly-grade/monthly-grade/by-student:type |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attendanceInfo` | `[ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItem]` | 报告附带的完整考勤统计 | — |
| `behaviourEvents` | `String` | 行为事件说明 | — |
| `conductPoints` | `JSONValue?` | 行为积分汇总；允许为空或缺失 | — |
| `customColumns` | `[JSONValue]` | 自定义成绩列 | — |
| `deputyComment` | `JSONValue?` | 副负责人评语；允许为空或缺失 | — |
| `grade` | `String` | 年级名称或成绩等级，按所在业务解释 | — |
| `gradeItems` | `[ParentMonthlyGradeReportDetailGETResponseGradeItemsItem]` | 完整成绩列或报告成绩项目 | — |
| `gradePeriod` | `ParentMonthlyGradeReportDetailGETResponseGradePeriod` | 完整报告周期配置 | — |
| `headTeacher` | `String` | 主班教师信息或启用标记 | — |
| `headTeacherComments` | `[JSONValue]` | 主班教师评语 | — |
| `house` | `String` | 学院名称 | — |
| `houseAchievements` | `String` | 学院表现说明 | — |
| `housePoint` | `JSONValue?` | 学院积分；允许为空或缺失 | — |
| `month` | `Int` | 报告月份 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |
| `tutor` | `String` | 辅导师显示信息 | — |
| `tutorComments` | `[ParentMonthlyGradeReportDetailGETResponseTutorCommentsItem]` | 辅导师评语 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `data` | `ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItemData` | 完整业务数据；结构由当前端点决定 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `gradePeriodId` | `Int` | 成绩周期标识，来自报告周期选项 | — |
| `gradePeriodName` | `String` | 报告周期名称 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseAttendanceInfoItemData`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `intime` | `Int` | 出席记录或出席数量 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseGradeItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attainment` | `String` | 学业达成等级或等级对象 | — |
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseName` | `String` | 课程名称 | — |
| `courseScheduleName` | `String` | 课程教学班名称 | — |
| `customColumnScore` | `Double` | 自定义列分数 | — |
| `effort` | `String` | 努力程度等级或等级对象 | — |
| `keyWords` | `String` | 教学关键词 | — |
| `level` | `String` | 成绩等级名称 | — |
| `percentage` | `JSONValue?` | 百分制成绩；允许为空或缺失 | — |
| `subjectClass` | `String` | 完整学科班级信息 | — |
| `teachers` | `String` | 关联教师列表 | — |
| `teachingContent` | `String` | 教学内容 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseGradePeriod`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attainment` | `Bool` | 学业达成等级或等级对象 | — |
| `campus` | `ParentMonthlyGradeReportDetailGETResponseGradePeriodCampus` | 完整学部对象 | — |
| `courseTeacher` | `Bool` | 课程教师权限 | — |
| `deputyHead` | `Bool` | 副负责人完整资料或周期是否启用副负责人评语 | — |
| `deputyHeadId` | `JSONValue?` | 副负责人标识，来自教师配置；允许为空或缺失 | — |
| `effort` | `Bool` | 努力程度等级或等级对象 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `ep` | `Bool` | 成绩周期的考试百分比项目配置 | — |
| `hc` | `Bool` | 成绩周期的学院或行为积分项目配置 | — |
| `headTeacher` | `Bool` | 主班教师信息或启用标记 | — |
| `monthlyGradePeriodId` | `Int` | 月度成绩周期标识，来自月度成绩周期列表 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `reportType` | `SemanticValue` | 报告类别 | unconfirmed:/api/monthly-grade/report/detail:reportType |
| `schoolYear` | `ParentMonthlyGradeReportDetailGETResponseGradePeriodSchoolYear` | 所属学年显示文本或选项对象 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `teachingReview` | `Bool` | 课程教学回顾内容 | — |
| `tutor` | `Bool` | 辅导师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseGradePeriodCampus`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `JSONValue?` | 选项值或显示文本；具体角色由所属选项字典决定；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseGradePeriodSchoolYear`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentMonthlyGradeReportDetailGETResponseTutorCommentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

