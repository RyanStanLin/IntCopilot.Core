# teacher-curriculum 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherCurriculumRoomGETResponseItemItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `classMaterialId` | `JSONValue?` | 教学资源标识，来自混合资源列表；允许为空或缺失 | — |
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `classRoomId` | `TeacherCurriculumRoomGETResponseItemItemClassRoomId` | 教室标识或教室对象，来自教室选项或课表 | — |
| `countIn` | `JSONValue?` | 是否纳入成绩计算；允许为空或缺失 | — |
| `courseId` | `TeacherCurriculumRoomGETResponseItemItemCourseId` | 课程标识或课程引用，来自课程选择或课表 | — |
| `curriculumId` | `Int` | 课表安排标识，来自课表记录 | — |
| `dayOfWeek` | `Int` | 星期序号 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `originDayOfWeek` | `JSONValue?` | 调课前的星期序号；允许为空或缺失 | — |
| `periods` | `Int` | 安排包含的课节定义 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `students` | `[TeacherCurriculumRoomGETResponseItemItemStudentsItem]` | 关联学生列表 | — |
| `targetSections` | `[TeacherCurriculumRoomGETResponseItemItemTargetSectionsItem]` | 课程对应年段集合 | — |
| `teachers` | `[TeacherCurriculumRoomGETResponseItemItemTeachersItem]` | 关联教师列表 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | curriculumType |
| `week` | `JSONValue?` | 本次安排所属周信息；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemClassRoomId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `building` | `String` | 完整楼栋对象或名称 | — |
| `classRoomId` | `Int` | 教室标识或教室对象，来自教室选项或课表 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `realCode` | `String` | 上游实际业务编码，含义依实体区分 | — |
| `subjects` | `JSONValue?` | 关联学科列表；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `arranged` | `JSONValue?` | 是否已安排；允许为空或缺失 | — |
| `classRoom` | `TeacherCurriculumRoomGETResponseItemItemCourseIdClassRoom` | 教室名称或完整教室对象，来自教室配置 | — |
| `courseFlag` | `JSONValue?` | 课程筛选或课程功能标记，按所属接口解释；允许为空或缺失 | — |
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `courseScheduleId` | `JSONValue?` | 课程教学安排标识，来自课程安排；允许为空或缺失 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `gradeLevelId` | `JSONValue?` | 评分等级标识，来自等级配置；允许为空或缺失 | — |
| `openSchoolYear` | `TeacherCurriculumRoomGETResponseItemItemCourseIdOpenSchoolYear` | 是否开放此学年 | — |
| `semesters` | `[TeacherCurriculumRoomGETResponseItemItemCourseIdSemestersItem]` | 完整学期集合 | — |
| `students` | `[TeacherCurriculumRoomGETResponseItemItemCourseIdStudentsItem]` | 关联学生列表 | — |
| `subject` | `TeacherCurriculumRoomGETResponseItemItemCourseIdSubject?` | 学科对象或名称；允许为空或缺失 | — |
| `targetSections` | `[TeacherCurriculumRoomGETResponseItemItemCourseIdTargetSectionsItem]` | 课程对应年段集合 | — |
| `tas` | `JSONValue?` | 课程助教集合；允许为空或缺失 | — |
| `teacher` | `[TeacherCurriculumRoomGETResponseItemItemCourseIdTeacherItem]` | 完整教师对象或教师显示信息 | — |
| `type` | `JSONValue?` | 本业务域类型；不能跨业务域套用代码表；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdClassRoom`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `building` | `JSONValue?` | 完整楼栋对象或名称；允许为空或缺失 | — |
| `classRoomId` | `Int` | 教室标识或教室对象，来自教室选项或课表 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `name` | `JSONValue?` | 业务实体或选项名称；允许为空或缺失 | — |
| `realCode` | `JSONValue?` | 上游实际业务编码，含义依实体区分；允许为空或缺失 | — |
| `subjects` | `JSONValue?` | 关联学科列表；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdOpenSchoolYear`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `schoolYearId` | `Int` | 学年标识，来自当前学年或学年选项 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdSemestersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `semesterId` | `Int` | 学期标识，来自学期选项 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `JSONValue?` | 头像资源地址；允许为空或缺失 | — |
| `detailedName` | `JSONValue?` | 完整展开显示名称；允许为空或缺失 | — |
| `enName` | `JSONValue?` | 英文名称，可能为空；允许为空或缺失 | — |
| `firstName` | `JSONValue?` | 名字或拼音名；允许为空或缺失 | — |
| `gender` | `JSONValue?` | 性别语义值；允许为空或缺失 | — |
| `lastName` | `JSONValue?` | 姓氏或拼音姓；允许为空或缺失 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionId` | `JSONValue?` | 年级或年段标识，来自年段选项；允许为空或缺失 | — |
| `sectionName` | `JSONValue?` | 年段名称；允许为空或缺失 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `JSONValue?` | 学生学号或统计学生数量，依端点区分；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdSubject`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `color` | `String` | 显示颜色 | — |
| `countIn` | `Bool` | 是否纳入成绩计算 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `sortNum` | `JSONValue?` | 显示排序序号；允许为空或缺失 | — |
| `subjectId` | `Int` | 学科标识，来自学科选项或课程配置 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdTargetSectionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `campusName` | `JSONValue?` | 学部名称；允许为空或缺失 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionCampusId` | `Int` | 年段所属学部标识 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemCourseIdTeacherItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `displayName` | `String` | 前端使用的显示名称 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `campusType` | `SemanticValue` | 服务端 campusType 字段；完整业务含义尚未确认，保留其完整结构 | campusType |
| `cardNum` | `String` | 学生卡号，敏感资料 | — |
| `className` | `String` | 主班级名称 | — |
| `enterDate` | `Int` | 入学日期，Unix 毫秒 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionId` | `Int` | 年级或年段标识，来自年段选项 | — |
| `status` | `SemanticValue` | 本业务域状态；不能跨业务域套用代码表 | unconfirmed:/api/curriculum/room:status |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemTargetSectionsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `campusName` | `JSONValue?` | 学部名称；允许为空或缺失 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionCampusId` | `Int` | 年段所属学部标识 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumRoomGETResponseItemItemTeachersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `isSubstitute` | `Bool` | 是否代课安排 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArranges` | `[String: [String: TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem]]` | 按星期与课节组织的课表 | — |
| `classPeriods` | `[TeacherCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem]` | 课节定义列表 | — |
| `dayOfArranged` | `[JSONValue]` | 课表安排日期信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `classRoomId` | `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId` | 教室标识或教室对象，来自教室选项或课表 | — |
| `courseId` | `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId` | 课程标识或课程引用，来自课程选择或课表 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `originDayOfWeek` | `JSONValue?` | 调课前的星期序号；允许为空或缺失 | — |
| `periods` | `Int` | 安排包含的课节定义 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `targetSections` | `[TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem]` | 课程对应年段集合 | — |
| `teachers` | `[TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem]` | 关联教师列表 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | curriculumType |
| `week` | `Int?` | 本次安排所属周信息；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemClassRoomId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoomId` | `Int?` | 教室标识或教室对象，来自教室选项或课表；允许为空或缺失 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `seqNum` | `JSONValue?` | 当前列表显示序号；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int?` | 课程标识或课程引用，来自课程选择或课表；允许为空或缺失 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `students` | `[TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem]` | 关联学生列表 | — |
| `subject` | `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject?` | 学科对象或名称；允许为空或缺失 | — |
| `teacher` | `[TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem]` | 完整教师对象或教师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionId` | `JSONValue?` | 年级或年段标识，来自年段选项；允许为空或缺失 | — |
| `sectionName` | `String` | 年段名称 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdSubject`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `color` | `String` | 显示颜色 | — |
| `countIn` | `Bool` | 是否纳入成绩计算 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `subjectId` | `Int` | 学科标识，来自学科选项或课程配置 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemCourseIdTeacherItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `dataPermission` | `JSONValue?` | 当前用户的数据权限集合；允许为空或缺失 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isTeacher` | `Bool` | 是否关联教师身份 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTargetSectionsItem`

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

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassArrangesItemItemTeachersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `isSubstitute` | `Bool` | 是否代课安排 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumStudentSchoolYearIdGETResponseClassPeriodsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classPeriodId` | `Int` | 课节定义标识，来自课节列表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `end` | `Int` | 区间结束值；日期查询使用 Unix 毫秒 | — |
| `isCCA` | `Bool` | 是否延展课程 | — |
| `isFullPeriodArranged` | `Bool` | 是否安排完整课节 | — |
| `sevenFive` | `Bool` | 未确认语义的课节配置标记，保留上游值 | — |
| `start` | `Int` | 区间开始值；日期查询使用 Unix 毫秒 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArranges` | `[String: [TeacherCurriculumTeacherGETResponseClassArrangesItemItem]]` | 按星期与课节组织的课表 | — |
| `institute` | `Int` | 公共或机构课程安排计数 | — |
| `regular` | `Int` | 常规课程安排计数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `classRoomId` | `TeacherCurriculumTeacherGETResponseClassArrangesItemItemClassRoomId` | 教室标识或教室对象，来自教室选项或课表 | — |
| `courseId` | `TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseId` | 课程标识或课程引用，来自课程选择或课表 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `originDayOfWeek` | `JSONValue?` | 调课前的星期序号；允许为空或缺失 | — |
| `periods` | `Int` | 安排包含的课节定义 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `targetSections` | `[TeacherCurriculumTeacherGETResponseClassArrangesItemItemTargetSectionsItem]` | 课程对应年段集合 | — |
| `teachers` | `[TeacherCurriculumTeacherGETResponseClassArrangesItemItemTeachersItem]` | 关联教师列表 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | curriculumType |
| `week` | `JSONValue?` | 本次安排所属周信息；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemClassRoomId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoomId` | `Int` | 教室标识或教室对象，来自教室选项或课表 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `seqNum` | `JSONValue?` | 当前列表显示序号；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `students` | `[TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseIdStudentsItem]` | 关联学生列表 | — |
| `subject` | `TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseIdSubject?` | 学科对象或名称；允许为空或缺失 | — |
| `teacher` | `[TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseIdTeacherItem]` | 完整教师对象或教师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseIdStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionId` | `JSONValue?` | 年级或年段标识，来自年段选项；允许为空或缺失 | — |
| `sectionName` | `String` | 年段名称 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseIdSubject`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `color` | `String` | 显示颜色 | — |
| `countIn` | `Bool` | 是否纳入成绩计算 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `subjectId` | `Int` | 学科标识，来自学科选项或课程配置 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemCourseIdTeacherItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `dataPermission` | `JSONValue?` | 当前用户的数据权限集合；允许为空或缺失 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isTeacher` | `Bool` | 是否关联教师身份 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemTargetSectionsItem`

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

## `TeacherCurriculumTeacherGETResponseClassArrangesItemItemTeachersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `isSubstitute` | `Bool` | 是否代课安排 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArranges` | `[String: [TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItem]]` | 按星期与课节组织的课表 | — |
| `institute` | `Int` | 公共或机构课程安排计数 | — |
| `regular` | `Int` | 常规课程安排计数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classArrangeId` | `Int` | 具体课节安排标识，来自考勤或课表 | — |
| `classRoomId` | `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemClassRoomId` | 教室标识或教室对象，来自教室选项或课表 | — |
| `courseId` | `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseId` | 课程标识或课程引用，来自课程选择或课表 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `originDayOfWeek` | `JSONValue?` | 调课前的星期序号；允许为空或缺失 | — |
| `periods` | `Int` | 安排包含的课节定义 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `targetSections` | `[TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTargetSectionsItem]` | 课程对应年段集合 | — |
| `teachers` | `[TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTeachersItem]` | 关联教师列表 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | curriculumType |
| `week` | `JSONValue?` | 本次安排所属周信息；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemClassRoomId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `classRoomId` | `Int` | 教室标识或教室对象，来自教室选项或课表 | — |
| `code` | `String` | 本业务域代码，需结合该对象的名称解释 | — |
| `seqNum` | `JSONValue?` | 当前列表显示序号；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseId`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `students` | `[TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdStudentsItem]` | 关联学生列表 | — |
| `subject` | `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdSubject?` | 学科对象或名称；允许为空或缺失 | — |
| `teacher` | `[TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdTeacherItem]` | 完整教师对象或教师显示信息 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdStudentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `firstName` | `String` | 名字或拼音名 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `lastName` | `String` | 姓氏或拼音姓 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `sectionId` | `JSONValue?` | 年级或年段标识，来自年段选项；允许为空或缺失 | — |
| `sectionName` | `String` | 年段名称 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentNum` | `String` | 学生学号或统计学生数量，依端点区分 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdSubject`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `color` | `String` | 显示颜色 | — |
| `countIn` | `Bool` | 是否纳入成绩计算 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `subjectId` | `Int` | 学科标识，来自学科选项或课程配置 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemCourseIdTeacherItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `dataPermission` | `JSONValue?` | 当前用户的数据权限集合；允许为空或缺失 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `isTeacher` | `Bool` | 是否关联教师身份 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherEnName` | `String` | 教师英文显示名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |
| `teacherName` | `String` | 教师显示名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTargetSectionsItem`

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

## `TeacherCurriculumTeacherPersonalGETResponseClassArrangesItemItemTeachersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `isSubstitute` | `Bool` | 是否代课安排 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `teacherId` | `Int` | 教师标识，来自用户信息或教师列表 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

