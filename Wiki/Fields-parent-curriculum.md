# parent-curriculum 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentCurriculumStudentSchoolYearIdGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArranges` | `[String: [String: ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem]]` | 按星期与课节组织的课表 | — |
| `classPeriods` | `[ParentCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem]` | 课节定义列表 | — |
| `dayOfArranged` | `[JSONValue]` | 课表安排日期信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `classRoomId` | `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId` | 教室标识或教室对象，来自教室选项或课表 | — |
| `courseId` | `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId` | 课程标识或课程引用，来自课程选择或课表 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `originDayOfWeek` | `JSONValue?` | 调课前的星期序号；允许为空或缺失 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `targetSections` | `[ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem]` | 课程对应年段集合 | — |
| `teachers` | `[ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem]` | 关联教师列表 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | curriculumType |
| `week` | `Int?` | 本次安排所属周信息；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoomId` | `Int?` | 教室标识或教室对象，来自教室选项或课表；允许为空或缺失 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `seqNum` | `JSONValue?` | 当前列表显示序号；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int?` | 课程标识或课程引用，来自课程选择或课表；允许为空或缺失 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `students` | `[ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem]` | 关联学生列表 | — |
| `subject` | `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject?` | 学科对象或名称；允许为空或缺失 | — |
| `teacher` | `[ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem]` | 完整教师对象或教师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `name` | `String` | 业务实体或选项名称 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `color` | `String` | 显示颜色 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `subjectId` | `Int` | 学科标识，来自学科选项或课程配置 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `classTeacher` | `Bool` | 主班教师权限 | — |
| `courseTeacher` | `Bool` | 课程教师权限 | — |
| `displayName` | `String` | 前端使用的显示名称 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `houseTeacher` | `Bool` | 学院教师权限 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionTeacher` | `Bool` | 年段教师权限 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `campusName` | `String` | 学部名称 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionCampusId` | `Int` | 年段所属学部标识 | — |
| `sectionName` | `String` | 年段名称 | — |
| `seqNum` | `JSONValue?` | 当前列表显示序号；允许为空或缺失 | — |
| `teachers` | `[JSONValue]` | 关联教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `isSubstitute` | `Bool` | 是否代课安排 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `end` | `Int` | 区间结束值；日期查询使用 Unix 毫秒 | — |
| `isFullPeriodArranged` | `Bool` | 是否安排完整课节 | — |
| `sevenFive` | `Bool` | 未确认语义的课节配置标记，保留上游值 | — |
| `start` | `Int` | 区间开始值；日期查询使用 Unix 毫秒 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

