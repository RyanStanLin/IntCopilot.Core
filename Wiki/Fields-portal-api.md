# portal-api 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `PortalApiUserInfoGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `accountNonExpired` | `Bool` | 账号是否未过期 | — |
| `accountNonLocked` | `Bool` | 账号是否未锁定 | — |
| `appsAuth` | `[String]` | 门户可使用的应用标识 | — |
| `authorities` | `[PortalApiUserInfoGETResponseAuthoritiesItem]` | 门户角色权限列表 | — |
| `credentialsNonExpired` | `Bool` | 凭据是否未过期 | — |
| `email` | `String` | 邮箱地址 | — |
| `id` | `String` | 当前业务实体标识 | — |
| `password` | `JSONValue?` | 密码字段；响应中通常为空，不应持久化或记录；允许为空或缺失 | — |
| `ssoStatus` | `String` | SSO 是否可用 | — |
| `tenantId` | `JSONValue?` | 门户租户标识；允许为空或缺失 | — |
| `userId` | `String` | 门户用户标识 | — |
| `username` | `String` | 门户登录账号 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `PortalApiUserInfoGETResponseAuthoritiesItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `authority` | `String` | 单项权限标识 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

