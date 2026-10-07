# teacher-login 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherLoginSchoolsGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `address` | `String` | 联系地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `logoUrl` | `String` | 学校公开标志资源地址 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `schoolId` | `Int` | 学校标识，来自认证学校列表 | — |
| `shortName` | `String` | 学校或机构简称 | — |
| `tel` | `String` | 联系电话 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherLoginSwitchTokenGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `ccaCourseTeacher` | `Bool` | CCA 教师权限 | — |
| `classTeacher` | `Bool` | 主班教师权限 | — |
| `courseManager` | `Bool` | 课程管理权限 | — |
| `courseTeacher` | `Bool` | 课程教师权限 | — |
| `houseGroupTeacher` | `Bool` | 学院小组教师权限 | — |
| `houseTeacher` | `Bool` | 学院教师权限 | — |
| `msg` | `String` | 业务结果说明 | — |
| `resCode` | `JSONValue?` | 业务结果代码，与 HTTP 状态码独立；允许为空或缺失 | — |
| `schools` | `[TeacherLoginSwitchTokenGETResponseSchoolsItem]` | 可访问学校列表 | — |
| `sectionTeacher` | `Bool` | 年段教师权限 | — |
| `success` | `Bool` | 本次认证或业务操作是否成功 | — |
| `token` | `String` | 平台会话 Token，敏感认证材料，不应记录 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherLoginSwitchTokenGETResponseSchoolsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `address` | `String` | 联系地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `logoUrl` | `String` | 学校公开标志资源地址 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `schoolId` | `Int` | 学校标识，来自认证学校列表 | — |
| `shortName` | `String` | 学校或机构简称 | — |
| `tel` | `String` | 联系电话 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherLoginUserInfoGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `dataPermission` | `TeacherLoginUserInfoGETResponseDataPermission` | 当前用户的数据权限集合 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isTeacher` | `Bool` | 是否关联教师身份 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherLoginUserInfoGETResponseDataPermission`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `ccaCourseTeacher` | `Bool` | CCA 教师权限 | — |
| `classAtten` | `Bool` | 课节考勤摘要 | — |
| `classTeacher` | `Bool` | 主班教师权限 | — |
| `courseManager` | `Bool` | 课程管理权限 | — |
| `courseTeacher` | `Bool` | 课程教师权限 | — |
| `deputyHead` | `Bool` | 副负责人完整资料或周期是否启用副负责人评语 | — |
| `dormitory` | `Bool` | 完整宿舍对象或宿舍名称 | — |
| `higSchoolCcaTeacher` | `Bool` | 高中延展课程教师权限，保留服务端拼写 | — |
| `houseGroupTeacher` | `Bool` | 学院小组教师权限 | — |
| `houseTeacher` | `Bool` | 学院教师权限 | — |
| `sectionTeacher` | `Bool` | 年段教师权限 | — |
| `selfStudyRoom` | `Bool` | 完整自习室对象或名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

