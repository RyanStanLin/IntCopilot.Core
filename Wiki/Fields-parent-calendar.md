# parent-calendar 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentCalendarByMonthGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `calendarDays` | `[ParentCalendarByMonthGETResponseCalendarDaysItem]` | 日历日期配置 | — |
| `eventList` | `[JSONValue]` | 日历事件列表 | — |
| `firstSemEndDate` | `Int` | 第一学期结束日期，Unix 毫秒 | — |
| `firstSemStartDate` | `Int` | 第一学期开始日期，Unix 毫秒 | — |
| `lastDate` | `Int` | 最后关联日期，Unix 毫秒 | — |
| `secondSemEndDate` | `Int` | 第二学期结束日期，Unix 毫秒 | — |
| `secondSemStartDate` | `Int` | 第二学期开始日期，Unix 毫秒 | — |
| `startDate` | `Int` | 开始日期或时刻，Unix 毫秒 | — |
| `thirdSemEndDate` | `JSONValue?` | 第三学期结束日期，Unix 毫秒；允许为空或缺失 | — |
| `thirdSemStartDate` | `JSONValue?` | 第三学期开始日期，Unix 毫秒；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCalendarByMonthGETResponseCalendarDaysItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `date` | `Int` | 业务日期，日期型端点使用 Unix 毫秒 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | calendarDayType |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

