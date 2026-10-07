# teacher-monthly-grade 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherMonthlyGradeBehaviorTableGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `advisory` | `String` | 辅导或学院分组显示名称 | — |
| `behaviourEvent` | `String` | 行为事件说明 | — |
| `className` | `String` | 主班级名称 | — |
| `conductPoint` | `Int` | 行为积分 | — |
| `dormitory` | `String` | 完整宿舍对象或宿舍名称 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `grade` | `String` | 年级名称或成绩等级，按所在业务解释 | — |
| `houseAchievement` | `String` | 学院表现说明 | — |
| `housePoint` | `Int` | 学院积分 | — |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `schoolYearConductPoint` | `Int` | 当前学年行为积分 | — |
| `schoolYearHousePoint` | `Int` | 当前学年学院积分 | — |
| `selfStudyRoom` | `String` | 完整自习室对象或名称 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradePeriodCourseIdGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `TeacherMonthlyGradeGradePeriodCourseIdGETResponseItemExtraValue` | 选项附加元数据，类型随业务域变化 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradePeriodCourseIdGETResponseItemExtraValue`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attainment` | `Bool` | 学业达成等级或等级对象 | — |
| `courseTeacher` | `Bool` | 课程教师权限 | — |
| `deputyHead` | `Bool` | 副负责人完整资料或周期是否启用副负责人评语 | — |
| `effort` | `Bool` | 努力程度等级或等级对象 | — |
| `ep` | `Bool` | 成绩周期的考试百分比项目配置 | — |
| `hc` | `Bool` | 成绩周期的学院或行为积分项目配置 | — |
| `headTeacher` | `Bool` | 主班教师信息或启用标记 | — |
| `reported` | `Bool` | 此周期是否已发布报告 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | unconfirmed:/api/monthly-grade/grade-period/{courseId}:status |
| `tutor` | `Bool` | 辅导师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradePeriodGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `String` | 选项附加元数据，类型随业务域变化 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherMonthlyGradeGradePeriodGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradePeriodGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `TeacherMonthlyGradeGradePeriodGETResponseItemSubOptionsItemExtraValue` | 选项附加元数据，类型随业务域变化 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradePeriodGETResponseItemSubOptionsItemExtraValue`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attainment` | `Bool` | 学业达成等级或等级对象 | — |
| `courseTeacher` | `Bool` | 课程教师权限 | — |
| `deputyHead` | `Bool` | 副负责人完整资料或周期是否启用副负责人评语 | — |
| `effort` | `Bool` | 努力程度等级或等级对象 | — |
| `ep` | `Bool` | 成绩周期的考试百分比项目配置 | — |
| `hc` | `Bool` | 成绩周期的学院或行为积分项目配置 | — |
| `headTeacher` | `Bool` | 主班教师信息或启用标记 | — |
| `reported` | `Bool` | 此周期是否已发布报告 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | unconfirmed:/api/monthly-grade/grade-period:status |
| `tutor` | `Bool` | 辅导师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `attainment` | `TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemAttainment` | 学业达成等级或等级对象 | — |
| `comments` | `String` | 评语或备注内容 | — |
| `effort` | `TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemEffort` | 努力程度等级或等级对象 | — |
| `examPercentage` | `JSONValue?` | 考试百分制成绩；允许为空或缺失 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemAttainment`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | unconfirmed:/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}:type |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponseItemEffort`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | unconfirmed:/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}:type |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeLevelAttainmentGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeLevelEffortGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeReportGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherMonthlyGradeReportGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeReportGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `className` | `String` | 主班级名称 | — |
| `commentedNum` | `Int` | 已填写评语数量 | — |
| `courseNum` | `Int` | 课程数量 | — |
| `deputyHeadCommentNum` | `Int` | 已填写副负责人评语数量 | — |
| `epGradedNum` | `Int` | 已录入考试百分比成绩数量 | — |
| `gradedNum` | `Int` | 已评分学生数量 | — |
| `headTeacherCommentedNum` | `Int` | 已填写主班教师评语数量 | — |
| `headTeacherNum` | `Int` | 主班教师数量 | — |
| `houseGroup` | `String` | 完整学院小组或小组显示文本 | — |
| `requestUrl` | `String` | 报告请求地址或路径 | — |
| `sent` | `String` | 是否已发送 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |
| `success` | `Bool` | 本次认证或业务操作是否成功 | — |
| `templateId` | `Int` | 报告模板标识 | — |
| `tutorCommentedNum` | `Int` | 已填写辅导师评语数量 | — |
| `tutorNum` | `Int` | 辅导师数量 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeReportStudentIdGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `templateId` | `Int` | 报告模板标识 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMonthlyGradeTeachingReviewListGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `courseName` | `String` | 课程名称 | — |
| `keyWords` | `String` | 教学关键词 | — |
| `monthlyGradePeriodId` | `Int` | 月度成绩周期标识，来自月度成绩周期列表 | — |
| `sectionId` | `JSONValue?` | 年级或年段标识，来自年段选项；允许为空或缺失 | — |
| `sectionName` | `String` | 年段名称 | — |
| `subjectId` | `JSONValue?` | 学科标识，来自学科选项或课程配置；允许为空或缺失 | — |
| `subjectName` | `String` | 学科名称 | — |
| `teachers` | `String` | 关联教师列表 | — |
| `teachingContent` | `String` | 教学内容 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

