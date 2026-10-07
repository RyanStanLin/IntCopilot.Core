# parent-dropDown 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentDropDownLeaveReasonsGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentDropDownRelatedAllCoursesGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `isRead` | `Bool` | 当前条目是否已读 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | courseType |
| `unHandInNum` | `Int` | 未提交任务数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentDropDownSchoolYearRuleListGETResponseItem`

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

