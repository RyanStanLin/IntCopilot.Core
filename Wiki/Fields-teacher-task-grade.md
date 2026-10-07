# teacher-task-grade 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherTaskGradeRuleGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `customColumnId` | `Int` | 自定义成绩列标识，来自成绩簿列配置 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `rules` | `[TeacherTaskGradeRuleGETResponseItemRulesItem]` | 完整业务规则配置 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherTaskGradeRuleGETResponseItemRulesItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `abbr` | `String` | 业务名称缩写 | — |
| `colour` | `String` | 显示颜色 | — |
| `percentage` | `Int` | 百分制成绩 | — |
| `taskType` | `String` | 任务类型对象或名称 | — |
| `taskTypeId` | `Int` | 任务类型标识，来自任务类型选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

