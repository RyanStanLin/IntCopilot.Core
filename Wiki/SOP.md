# 标准操作 SOP

以下步骤中的“用户选择”由 App UI 完成。账号材料和目标对象来自 App，写入动作必须由用户明确触发。可编译函数见 [SOP-Examples](SOP-Examples)；逐接口底层参考见 API 页面。示例不使用真人账号或内置业务 ID。

## 两平台密码登录

前提：App 已取得目标平台账号与密码。家长与教师客户端独立。

| 顺序 | API / SDK | 来源与选择 | 副作用 / 稳定性 |
|---|---|---|---|
| 1P | GET `/api/login/schools` | 用学校 `domain` 匹配家长入口，获得 `schoolId` | 公开只读配置；补充只读验证，原始抓包未覆盖 |
| 2P | POST `/api/login/unify` | account/password，SDK 补学校头 | 认证；原始成功/失败抓包覆盖 |
| 1T | 门户 GET `/login` → POST `/api/login` | 公共租户与登录类型，账号密码，保留 Cookie | 认证；密码 POST 抓包覆盖 |
| 2T | GET `/api/oauth/authorize`，必要时 POST 同路由 | OAuth client ID、redirect_uri、服务端审批页 | 认证交换；抓包与前端证据 |
| 3T | GET `/api/login/switchToken` | OAuth 重定向 access_token | 认证；抓包覆盖 |
| 4T | GET `/api/login/schools` / `/api/login/userInfo` | 学校与教师上下文，多个学校时用户选择 | 只读；抓包覆盖 |

使用 `exampleParentPassword` / `exampleTeacherPassword`。失败：密码拒绝直接提示重新输入；首次登录或额外交互交给 App。SDK 不重置密码、不自动授权新应用。撤回：本地 `logout()` 清除 SDK 会话，不声称撤销门户的所有服务端会话。

## 家长短信错误后再次尝试

前提：用户要求发送验证码并提供手机号与地区区号。

1. SDK 读取家长学校配置，调用 GET `/api/login/vcodeMobileSend`，保留服务器 Cookie。此 GET **发送真实短信**，不能自动真实测试。
2. 用户输入验证码，POST `/api/login/unify`，使用相同手机号、areaCode 和 Cookie。
3. `invalidVerificationCode` 后用户改正验证码，继续同一个 `SMSLogin.submit(code:)`。不清除会话、不自动发送短信、没有 SDK 固定次数限制。
4. 过期/限流/锁定保持服务端错误；用户要求重发时显式 `resend()`，再输入新码。发送的短信不可撤回。

Swift：`exampleSMSRetry`。密码重登策略不影响这组提交次数；短信验证码不用于 Token 自动恢复。

## 学生选择、切换、课表与考勤

前提：已登录、教师多学校时已选择学校。

| 顺序 | 调用 | 来源与选择 | 副作用 / 稳定性 |
|---|---|---|---|
| 1 | 家长 `students()`；教师 `courses()` → `course(...).students()` | 家长关联学生；教师先选课程，再选名单中学生 | 只读 / 抓包覆盖 |
| 2 | `student(selected)` | 用户选择具名学生；切换学生创建新的 scope | 仅本地 |
| 3 | GET `/api/semester/currentSchoolYear` | 自动取得 `schoolYearId` | 只读；家长有补充证据，教师抓包覆盖 |
| 4 | GET `/api/curriculum/student/{schoolYearId}` | `studentId` 来自第 1 步，start/end 为 Unix 毫秒 | 只读 / 抓包覆盖 |
| 5 | GET `/api/attendance/statistic/student/{schoolYearId}` | 同一学生、学年、时间范围 | 只读 / 抓包覆盖 |

Swift：`exampleStudentTimetable`；考勤使用同一 scope 的 `attendance(in:)`。跨学校旧引用抛错误，应重新获取对象。时间非法/权限失效时停止；查询不需要撤回。

## 家长请假、审批状态与撤回

前提：已登录并选择目标学生。每次提交和撤回都由用户操作。

| 步骤 | 调用及选择 | 参数来源与注意事项 | 副作用 / 稳定性 |
|---|---|---|---|
| 1 | 登录 → `students()` → 用户选择学生 | 域名学校配置与关联学生建立 scope | 认证 / 只读，已确认 |
| 2 | `leaveOptions()`，GET `/api/dropDown/leave-reasons` | 类别按实际前端固定 personal；动态原因含名称 | 只读 / 抓包覆盖 |
| 3 | 用户选择原因、起止时间，填写说明 | SDK 由语义选项编码 reasonId/type；时间 Unix 毫秒 | 本地 |
| 4 | 如需附件，单独完成上传 | 上传有副作用；当前上传链契约不足时使用实验入口。未确认 time-check 不作为隐式依赖 | **外部副作用 / 不稳定**；时间校验安全性未确认 |
| 5 | `submitLeave`，POST `/api/attendance/leave-application` | 填学生、personal、reasonId、时间、说明和已有资源 ID | **外部副作用 / 抓包覆盖**；真实测试必须先获同意 |
| 6 | GET 同路由，刷新 `leaveApplications()` | 空提交响应没有申请 ID，通过列表取得真实申请记录及语义状态 | 只读 / 抓包覆盖 |
| 7 | 用户选择平台允许撤回的记录 → PUT `/api/attendance/leave-application/retrieve` → 刷新 | 使用列表返回的 leaveApplicationId；服务端决定权限 | **外部副作用 / 抓包覆盖** |

Swift：`exampleSubmitLeave` / `exampleWithdrawLeave`。SDK 返回空确认而不伪造 ID。提交超时的状态可能不确定，先刷新列表确认，禁止自动重复提交。撤回失败刷新状态，已批准等记录是否可撤回以服务端为准；不能假定通知可收回。

底层对应调用：

```swift
let reasons = try await parent.call(ParentEndpoints.dropDownLeaveReasonsGET)
let input = APIInput(body: [
    "studentId": .id(selected.id),
    "type": .selection(LeaveKind.personal.option),
    "reasonId": .selection(selectedReason),
    "reason": .text(explanation),
    "startTime": .date(range.start),
    "endTime": .date(range.end),
    "resourceIds": .list([])
])
let acknowledgement = try await parent.call(ParentEndpoints.attendanceLeaveApplicationPOST, input: input)
let records = try await parent.call(ParentEndpoints.attendanceLeaveApplicationGET,
    input: APIInput(query: ["studentId": .id(selected.id)]))
```

## 作业列表 → 详情 → 成绩或提交状态

前提：已选学生或教师课程。

家长：`scope.courses()` 可选课程 → `scope.tasks(course:page:)` → 用户根据 `item.type.name` 选择作业 → `assignmentDetails(for:)`。混合列表 `entityId` 在作业条目代表 `taskStudentId`，教学资源条目不能用于作业详情。详情保留成绩、标签、学生提交及附件；成绩簿用 `gradeBook()`。资源详情链尚未完整确认时走实验入口。

教师：课程 `tasks()` → 用户选择作业的 taskId → `taskDetails` / `submissions(for:)` → 用户选择学生任务关联记录 → `submissionDetails`。`taskStudentId` 来自 performance 列表；详情返回用于评分的 `studentId` 和 `taskId`。全部上述读取已抓包，无业务写入。

Swift：`exampleAssignmentDetails`。失败时按条目语义检查 ID，不把教学资源 ID 当 taskId。只读流程无撤回；提交学生作业、发布任务等另属写入或实验契约，不能由本 SOP 自动执行。

## 报告周期 → 学生成绩报告 → 详情 / 下载

家长：`reportPeriods()`（GET `/api/monthly-grade/monthly-grade/by-student`）→ 用户选择带周期名称的报告 → `report(for:)`（GET `/api/monthly-grade/report/detail`）。gradePeriodId 来自周期记录，studentId 和学校来自 scope。Swift：`exampleStudentReport`。查询均只读且抓包覆盖。

教师：课程 `reportPeriods()`（路径 courseId，query schoolYearId）→ 用户选择周期 → `monthlyGradeTable(period:)`（路径 gradePeriodId/courseId）→ 显示完整成绩表和周期配置。结果中的 reported、status、权限与可用项目决定后续操作。

下载与页面打印要区分：原始资料中的打印 render 属于另一服务源，不能通过两平台客户端隐式转发 Token。目录保留其辅助抓包记录；打印/上传等未完整确认链保持风险标注。App 如使用外部浏览器生成报告，必须显式控制认证材料与地址。SDK 不伪造 PDF 下载地址，也不把静态推断写成已确认下载契约。失败时显示报告读取结果并保留不稳定性，不自动重复生成/发送。

## 教师课程 → 学生名单 → 课节考勤查询与登记

前提：已登录教师账号，具备所选课程和考勤权限。

1. GET `/api/course/cascadeBySchoolYear`，自动补当前学年；用户选择课程。
2. GET `/api/course/students`，得到具名学生与分页。选择目标学生。
3. `periodOptions(on:)` 读取 `/api/course/cascade/attendance`，根节点 key 是 courseId，子节点 key 是 classPeriodId；用户选择当天课节。课程类别使用 `.regular` / `.cca`。
4. `attendance(on:period:)` 或 `ccaAttendance`，查询记录；`attendanceStatuses()` 读取带名称及可用性的动态状态字典。
5. 用户选择 editable 且未 locked 的目标记录和具名状态；PUT `/api/attendance/class`，使用该记录的 classArrangeId、studentId。**真实写入须先同意。**
6. 再次读取考勤，确认结果。Swift：`exampleTeacherAttendance`。

读取和登记均有抓包；CCA 返回结构单独建模，常规登记 helper 不猜测 CCA 写入规则。401 不自动重放登记；超时先查询。恢复旧状态也是新写入，只有确认原状态及权限后、再次获得同意才能执行，不能保证所有修改可可靠撤回。

## 教师作业 → 学生记录 → 成绩录入

前提：已选课程、作业及目标学生；已读取任务评分规则。

`tasks()` → 用户选 taskId → `submissions(for:)` → 用户选 taskStudentId → `submissionDetails` → 用户输入符合评分规则的成绩与评语 → PUT `/api/task/updateScore` → 刷新详情。studentId/taskId 使用详情返回值，不能用 studentId 代替 taskStudentId。Swift：`exampleTeacherGrade`。

读取均只读；成绩录入有外部副作用且不自动重放。真实测试须说明原成绩、拟录入值、通知影响和恢复方案。保留原评语、标签与成绩用于审查；撤回通常只能通过再次修改，不能声称成绩通知可逆。接口无删除成绩契约时清空成绩使用 mock，不能猜测 null 的行为。

## 日记主类型 → 子类型 → 行为记录

前提：教师有权限，已选唯一目标学生。

`diaryTypes()` → 用户选择具名主类型 → `diaryEntryTypes(for:)` → 用户选对应子类型 → 输入描述、时间及在 lowPoints/highPoints 范围内的积分 → `recordDiary`（POST `/api/diary`）。SDK 校验主/子依赖和学校，编码 recordTime 毫秒。Swift：`exampleDiary`。

字典只读且有抓包。记录、积分和分享标记具有外部副作用。特殊护理日记、保密教师列表、附件或额外收件人的完整契约不足时走实验入口；helper 不隐式触发这些扩展。失败后读取 `/api/diary/by-student` 确认是否已创建，避免重复。

DELETE `/api/diary` 使用已查到的 diaryEntryId 与 studentId，可删除记录，但已送出的通知无法可靠撤回；只有明确批准删除操作时执行。默认全部写入 mock。

## 消息收件人选择与发送

前提：教师具备发消息权限。先说明收件人及是否同时发送邮件。

`parentRecipients(search:page:)` → GET `/api/dropDown/message/receiver`，SDK 使用已确认 parent 查询模式 → 用户选择具名家长及学生关联 → 构建 `MessageDraft` → POST `/api/message/send`。SDK 从同一记录取得 parentId/studentId，保留父母与学生关联，不要求填 queryType 代码。Swift：`exampleMessage`。

读取只读；发送、邮件和抄送具有外部副作用。抓包确认的 helper 限于家长收件人；其他收件人或附件字段仅有静态证据时使用实验入口。发送响应为空时先刷新发送列表取得实际 messageMasterId。

PUT `/api/message/withdraw` 使用发送记录返回的 messageMasterId，可撤回站内消息，不能撤回外部邮件或已读通知。不能可靠撤回的真实测试一律 mock。发送超时先查记录，不自动重发。
