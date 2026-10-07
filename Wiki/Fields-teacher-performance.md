# teacher-performance 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherPerformanceTaskPOSTResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avgScore` | `Double` | 平均分 | — |
| `data` | `[TeacherPerformanceTaskPOSTResponseDataItem]` | 完整业务数据；结构由当前端点决定 | — |
| `gradedNum` | `Int` | 已评分学生数量 | — |
| `lowestScore` | `Double` | 最低分 | — |
| `studentNum` | `Int` | 学生学号或统计学生数量，依端点区分 | — |
| `topScore` | `Double` | 评分上限或统计最高分，依端点业务区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherPerformanceTaskPOSTResponseDataItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `borders` | `[JSONValue]` | 寄宿学生数量，保留服务端拼写 | — |
| `females` | `[JSONValue]` | 女生数量 | — |
| `higher` | `Int` | 统计区间上限 | — |
| `label` | `String` | 显示标签 | — |
| `lower` | `Int` | 统计区间下限 | — |
| `males` | `[TeacherPerformanceTaskPOSTResponseDataItemMalesItem]` | 男生数量 | — |
| `num` | `Int` | 当前节点数量 | — |
| `unBorders` | `[TeacherPerformanceTaskPOSTResponseDataItemUnBordersItem]` | 非寄宿学生数量，保留服务端拼写 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherPerformanceTaskPOSTResponseDataItemMalesItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `boarding` | `Bool` | 是否寄宿 | — |
| `columnId` | `JSONValue?` | 成绩列标识，来自列配置；允许为空或缺失 | — |
| `courseId` | `JSONValue?` | 课程标识或课程引用，来自课程选择或课表；允许为空或缺失 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `name` | `String` | 业务实体或选项名称 | — |
| `score` | `Double` | 分数；单位及评分方式由任务或成绩规则决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherPerformanceTaskPOSTResponseDataItemUnBordersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `boarding` | `Bool` | 是否寄宿 | — |
| `columnId` | `JSONValue?` | 成绩列标识，来自列配置；允许为空或缺失 | — |
| `courseId` | `JSONValue?` | 课程标识或课程引用，来自课程选择或课表；允许为空或缺失 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `name` | `String` | 业务实体或选项名称 | — |
| `score` | `Double` | 分数；单位及评分方式由任务或成绩规则决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

