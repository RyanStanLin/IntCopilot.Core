# teacher-grade-book 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherGradeBookGradeBookGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `customColumns` | `[TeacherGradeBookGradeBookGETResponseCustomColumnsItem]?` | 自定义成绩列；允许为空或缺失 | — |
| `editable` | `Bool?` | 当前记录是否可编辑；允许为空或缺失 | — |
| `gradeBookItems` | `[TeacherGradeBookGradeBookGETResponseGradeBookItemsItem]?` | 按课程组织的成绩簿项目；允许为空或缺失 | — |
| `gradeItems` | `[TeacherGradeBookGradeBookGETResponseGradeItemsItem]?` | 完整成绩列或报告成绩项目；允许为空或缺失 | — |
| `gradeLevelItems` | `[JSONValue]?` | 等级评分定义；允许为空或缺失 | — |
| `gradeLevelName` | `String?` | 评分等级名称；允许为空或缺失 | — |
| `meanMap` | `[String: Double]?` | 成绩字段到平均数的映射；允许为空或缺失 | — |
| `medianMap` | `[String: Double]?` | 成绩字段到中位数的映射；允许为空或缺失 | — |
| `students` | `[TeacherGradeBookGradeBookGETResponseStudentsItem]?` | 关联学生列表；允许为空或缺失 | — |
| `taskGradeLevelId` | `Int?` | 任务评分等级标识；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherGradeBookGradeBookGETResponseCustomColumnsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `customColumnId` | `Int` | 自定义成绩列标识，来自成绩簿列配置 | — |
| `customColumnName` | `String` | 自定义成绩列名称 | — |
| `publishParent` | `Bool` | 是否向家长发布 | — |
| `publishStudent` | `Bool` | 是否向学生发布 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherGradeBookGradeBookGETResponseGradeBookItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `courseName` | `String` | 课程名称 | — |
| `customColumnScores` | `[String: TeacherGradeBookGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem]` | 自定义列成绩 | — |
| `inClass` | `Bool` | 是否仍在此课程班级 | — |
| `subject` | `String` | 学科对象或名称 | — |
| `taskScores` | `[TeacherGradeBookGradeBookGETResponseGradeBookItemsItemTaskScoresItem]` | 任务成绩列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherGradeBookGradeBookGETResponseGradeBookItemsItemCustomColumnScoresItem`

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

## `TeacherGradeBookGradeBookGETResponseGradeBookItemsItemTaskScoresItem`

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

## `TeacherGradeBookGradeBookGETResponseGradeItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `canColumnLock` | `Bool` | 是否允许锁定成绩列 | — |
| `colour` | `String` | 显示颜色 | — |
| `columnId` | `String` | 成绩列标识，来自列配置 | — |
| `columnType` | `String` | 成绩列类别，按成绩簿业务解释 | — |
| `countInCalculation` | `Bool` | 是否纳入成绩计算 | — |
| `editable` | `Bool` | 当前记录是否可编辑 | — |
| `endDate` | `Int` | 结束日期或截止时刻，Unix 毫秒 | — |
| `itemId` | `Int` | 当前成绩项目标识 | — |
| `locked` | `Bool` | 当前记录是否已锁定 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `publishStudent` | `Bool` | 是否向学生发布 | — |
| `publishTeacher` | `Bool` | 是否向教师发布 | — |
| `scoreMethod` | `JSONValue?` | 评分方式，按本业务域解释；允许为空或缺失 | — |
| `startDate` | `Int` | 开始日期或时刻，Unix 毫秒 | — |
| `studentJoin` | `Bool` | 是否有学生参与 | — |
| `taskRuleId` | `JSONValue?` | 任务评分规则标识；允许为空或缺失 | — |
| `taskTypeId` | `Int?` | 任务类型标识，来自任务类型选项；允许为空或缺失 | — |
| `topScore` | `Double` | 评分上限或统计最高分，依端点业务区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherGradeBookGradeBookGETResponseStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `gradeMap` | `[String: TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItem]` | 按成绩列标识组织的学生成绩 | — |
| `inClass` | `Bool` | 是否仍在此课程班级 | — |
| `studentEnName` | `String` | 学生英文显示姓名 | — |
| `studentFirstName` | `String` | 学生名字或拼音名 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentLastName` | `String` | 学生姓氏或拼音姓 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `grade` | `TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItemGrade` | 年级名称或成绩等级，按所在业务解释 | — |
| `submitted` | `Bool` | 当前记录是否已提交 | — |
| `tag` | `SemanticValue` | 评分备注标签，需按评分业务解析 | unconfirmed:/api/grade-book/grade-book:tag |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherGradeBookGradeBookGETResponseStudentsItemGradeMapItemGrade`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `calculatedLevel` | `String` | 按评分规则计算的等级 | — |
| `calculatedScore` | `Double` | 按评分规则计算的分数 | — |
| `level` | `String` | 成绩等级名称 | — |
| `manual` | `Bool` | 是否手动录入此项目 | — |
| `manualPass` | `Bool` | 手动设置的通过标记 | — |
| `score` | `Double` | 分数；单位及评分方式由任务或成绩规则决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

