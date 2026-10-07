# teacher-task 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherTaskDetailGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `canEditType` | `Bool` | 是否允许编辑任务类型 | — |
| `course` | `TeacherTaskDetailGETResponseCourse` | 完整关联课程对象 | — |
| `courseType` | `SemanticValue` | 课程类别，区别常规课程和 CCA | courseType |
| `description` | `String` | 业务说明或富文本内容 | — |
| `endDate` | `Int` | 结束日期或截止时刻，Unix 毫秒 | — |
| `inTotal` | `Bool` | 是否计入汇总成绩 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `online` | `Bool` | 是否线上提交或线上状态 | — |
| `overDeadline` | `Bool` | 是否已超过截止时间 | — |
| `publicFlag` | `Bool` | 是否公开或发布 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `scoreFlag` | `Bool` | 是否启用评分 | — |
| `startDate` | `Int` | 开始日期或时刻，Unix 毫秒 | — |
| `subjectName` | `String` | 学科名称 | — |
| `taskId` | `Int` | 任务标识，来自任务列表 | — |
| `topScore` | `Int` | 评分上限或统计最高分，依端点业务区分 | — |
| `type` | `TeacherTaskDetailGETResponseType` | 本业务域类型；不能跨业务域套用代码表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherTaskDetailGETResponseCourse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `students` | `[JSONValue]` | 关联学生列表 | — |
| `subject` | `JSONValue?` | 学科对象或名称；允许为空或缺失 | — |
| `teacher` | `[JSONValue]` | 完整教师对象或教师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherTaskDetailGETResponseType`

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

## `TeacherTaskMergeListGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherTaskMergeListGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherTaskMergeListGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `allNum` | `Int` | 统计总数量 | — |
| `color` | `String` | 显示颜色 | — |
| `createTime` | `Int` | 创建时刻，Unix 毫秒 | — |
| `creator` | `Int` | 创建者显示信息 | — |
| `creatorName` | `String` | 创建者姓名 | — |
| `editFlag` | `Bool` | 当前记录是否可编辑 | — |
| `entityId` | `Int` | 混合列表实体标识；任务条目与教学资源条目的标识语义不同 | — |
| `gradedNum` | `Int` | 已评分学生数量 | — |
| `inTotal` | `Bool` | 是否计入汇总成绩 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `online` | `Bool` | 是否线上提交或线上状态 | — |
| `openFlag` | `Bool` | 是否开放 | — |
| `parentNum` | `Int` | 关联家长数量 | — |
| `parentReadNum` | `Int` | 家长已读数量 | — |
| `scoreFlag` | `Bool` | 是否启用评分 | — |
| `studentReadNum` | `Int` | 学生已读数量 | — |
| `submitNum` | `Int` | 已提交数量 | — |
| `taskTypeName` | `String` | 任务类型名称 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | taskFeedType |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherTaskPerformanceGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `className` | `String` | 主班级名称 | — |
| `comments` | `String` | 评语或备注内容 | — |
| `editFlag` | `Bool` | 当前记录是否可编辑 | — |
| `enterDate` | `JSONValue?` | 入学日期，Unix 毫秒；允许为空或缺失 | — |
| `handInTime` | `JSONValue?` | 学生提交时刻，Unix 毫秒；允许为空或缺失 | — |
| `houseName` | `String` | 学院名称 | — |
| `lastClassDate` | `JSONValue?` | 最后参与课程日期，Unix 毫秒；允许为空或缺失 | — |
| `outDate` | `JSONValue?` | 离校日期，Unix 毫秒；未离校可为空；允许为空或缺失 | — |
| `reSubmit` | `Bool` | 是否允许再次提交 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `score` | `Double` | 分数；单位及评分方式由任务或成绩规则决定 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |
| `tag` | `SemanticValue` | 评分备注标签，需按评分业务解析 | unconfirmed:/api/task/performance:tag |
| `taskStudentId` | `Int` | 学生任务关联标识，来自任务列表或任务学生记录 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherTaskStudentDetailGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `comments` | `String` | 评语或备注内容 | — |
| `content` | `String` | 正文或学生提交内容，可能包含富文本 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `score` | `Double?` | 分数；单位及评分方式由任务或成绩规则决定；允许为空或缺失 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `tag` | `SemanticValue` | 评分备注标签，需按评分业务解析 | unconfirmed:/api/task/student/detail:tag |
| `taskId` | `Int` | 任务标识，来自任务列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

