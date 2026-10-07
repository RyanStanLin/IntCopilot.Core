# parent-diary 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentDiaryByStudentGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[ParentDiaryByStudentGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentDiaryByStudentGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `createTime` | `Int` | 创建时刻，Unix 毫秒 | — |
| `creator` | `String` | 创建者显示信息 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `diaryEntryId` | `Int` | 日记记录标识 | — |
| `diaryEntryType` | `String` | 日记子类型中文名称 | — |
| `diaryEntryTypeEn` | `String` | 日记子类型英文名称 | — |
| `displayName` | `String` | 前端使用的显示名称 | — |
| `points` | `Int` | 本次行为积分 | — |
| `primaryType` | `String` | 日记主类型中文名称 | — |
| `primaryTypeEn` | `String` | 日记主类型英文名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

