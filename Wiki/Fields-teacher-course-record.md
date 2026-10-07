# teacher-course-record 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherCourseRecordListByStudentGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `comment` | `String` | 备注、评语或考勤说明 | — |
| `courseCredit` | `Double?` | 课程学分；允许为空或缺失 | — |
| `courseId` | `Int` | 课程标识或课程引用，来自课程选择或课表 | — |
| `courseLeaveReasonId` | `Int` | 离开课程原因标识，来自课程原因选项 | — |
| `courseName` | `String` | 课程名称 | — |
| `courseRecordId` | `Int` | 学生课程记录标识 | — |
| `courseScheduleId` | `Int` | 课程教学安排标识，来自课程安排 | — |
| `courseScheduleName` | `String` | 课程教学班名称 | — |
| `creditAvailable` | `Int` | 是否允许授予学分 | — |
| `creditSet` | `Double?` | 是否已设置学分；允许为空或缺失 | — |
| `endTime` | `Int` | 结束时刻，Unix 毫秒或端点定义的课节时间 | — |
| `leaveEnReason` | `String` | 课程离班原因英文名称 | — |
| `leaveReason` | `String` | 课程离班原因中文名称 | — |
| `reportView` | `Bool` | 是否允许查看该报告 | — |
| `startTime` | `Int` | 开始时刻，Unix 毫秒或端点定义的课节时间 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |
| `subjectName` | `String` | 学科名称 | — |
| `teacherNames` | `String` | 关联教师名称文本 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

