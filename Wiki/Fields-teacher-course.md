# teacher-course 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherCourseCascadeAttendanceGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherCourseCascadeAttendanceGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseCascadeAttendanceGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseCascadeBySchoolYearGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `Int` | 选项附加元数据，类型随业务域变化 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[TeacherCourseCascadeBySchoolYearGETResponseItemSubOptionsItem]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseCascadeBySchoolYearGETResponseItemSubOptionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `isTeach` | `Bool` | 当前教师是否具有此选项的教学权限 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `subOptions` | `[JSONValue]` | 下一级完整选项 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseCourseAndCcaGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `ccaList` | `[JSONValue]` | 延展课程列表 | — |
| `courseList` | `[TeacherCourseCourseAndCcaGETResponseCourseListItem]` | 常规课程列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseCourseAndCcaGETResponseCourseListItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `classPeriodName` | `String` | 课节显示名称 | — |
| `classRoomName` | `String` | 教室显示名称 | — |
| `courseFlag` | `Bool` | 课程筛选或课程功能标记，按所属接口解释 | — |
| `end` | `Int` | 区间结束值；日期查询使用 Unix 毫秒 | — |
| `id` | `Int` | 当前业务实体标识 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `start` | `Int` | 区间开始值；日期查询使用 Unix 毫秒 | — |
| `studentNum` | `Int` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseStudentsGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherCourseStudentsGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCourseStudentsGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `className` | `String` | 主班级名称 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `grade` | `String` | 年级名称或成绩等级，按所在业务解释 | — |
| `house` | `String` | 学院名称 | — |
| `houseGroup` | `String` | 完整学院小组或小组显示文本 | — |
| `medical` | `String` | 医疗说明，属于敏感资料 | — |
| `medicalTag` | `Bool` | 是否有医疗提示 | — |
| `medium` | `String` | 授课语言或相关提示文本 | — |
| `mediumTag` | `Bool` | 是否有语言提示标记 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `parentEmail` | `String` | 家长邮箱显示文本 | — |
| `parentsEmail` | `[String]` | 家长邮箱列表 | — |
| `studentEmail` | `String` | 学生邮箱 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

