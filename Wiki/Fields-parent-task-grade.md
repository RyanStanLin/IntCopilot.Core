# parent-task-grade 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentTaskGradeGradeBookGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `customColumns` | `[ParentTaskGradeGradeBookGETResponseCustomColumnsItem]` | 自定义成绩列 | — |
| `gradeBookItems` | `[ParentTaskGradeGradeBookGETResponseGradeBookItemsItem]` | 按课程组织的成绩簿项目 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentTaskGradeGradeBookGETResponseCustomColumnsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `customColumnId` | `Int` | 自定义成绩列标识，来自成绩簿列配置 | — |
| `customColumnName` | `String` | 自定义成绩列名称 | — |
| `publishParent` | `Bool` | 是否向家长发布 | — |
| `publishStudent` | `Bool` | 是否向学生发布 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentTaskGradeGradeBookGETResponseGradeBookItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `courseName` | `String` | 课程名称 | — |
| `customColumnScores` | `[String: ParentTaskGradeGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem]` | 自定义列成绩 | — |
| `inClass` | `Bool` | 是否仍在此课程班级 | — |
| `subject` | `String` | 学科对象或名称 | — |
| `taskScores` | `[ParentTaskGradeGradeBookGETResponseGradeBookItemsItemTaskScoresItem]` | 任务成绩列表 | — |
| `teacherNames` | `String` | 关联教师名称文本 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentTaskGradeGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `calculatedLevel` | `String` | 按评分规则计算的等级 | — |
| `calculatedScore` | `Double?` | 按评分规则计算的分数；允许为空或缺失 | — |
| `level` | `String` | 成绩等级名称 | — |
| `manual` | `Bool` | 是否手动录入此项目 | — |
| `manualPass` | `Bool` | 手动设置的通过标记 | — |
| `score` | `Double?` | 分数；单位及评分方式由任务或成绩规则决定；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentTaskGradeGradeBookGETResponseGradeBookItemsItemTaskScoresItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `color` | `String` | 显示颜色 | — |
| `endDate` | `Int` | 结束日期或截止时刻，Unix 毫秒 | — |
| `score` | `Double?` | 分数；单位及评分方式由任务或成绩规则决定；允许为空或缺失 | — |
| `scoreFlag` | `Bool` | 是否启用评分 | — |
| `scoreMethod` | `JSONValue?` | 评分方式，按本业务域解释；允许为空或缺失 | — |
| `taskId` | `Int` | 任务标识，来自任务列表 | — |
| `taskName` | `String` | 任务显示名称 | — |
| `taskStudentId` | `Int` | 学生任务关联标识，来自任务列表或任务学生记录 | — |
| `taskTypeName` | `String` | 任务类型名称 | — |
| `topScore` | `Double` | 评分上限或统计最高分，依端点业务区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

