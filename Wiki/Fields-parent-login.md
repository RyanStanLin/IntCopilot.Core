# parent-login 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentLoginSchoolsGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `domain` | `String` | 家长入口域名，用于匹配公开学校配置 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `logoUrl` | `String` | 学校公开标志资源地址 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `schoolId` | `Int` | 学校标识，来自认证学校列表 | — |
| `shortName` | `String` | 学校或机构简称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentLoginUnifyPOSTResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `extraMsg` | `Bool?` | 业务结果的附加信息；允许为空或缺失 | — |
| `msg` | `String` | 业务结果说明 | — |
| `resCode` | `Int?` | 业务结果代码，与 HTTP 状态码独立；允许为空或缺失 | — |
| `success` | `Bool` | 本次认证或业务操作是否成功 | — |
| `token` | `String` | 平台会话 Token，敏感认证材料，不应记录 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentLoginVcodeMobileSendGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `resCode` | `JSONValue?` | 业务结果代码，与 HTTP 状态码独立；允许为空或缺失 | — |
| `resMsg` | `String` | 业务结果说明 | — |
| `success` | `Bool` | 本次认证或业务操作是否成功 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

