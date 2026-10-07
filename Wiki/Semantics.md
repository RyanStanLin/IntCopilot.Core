# 语义字典

`SemanticValue` 返回原始值、业务域、中英文名称、是否识别和动态可用性。`SemanticOption` 返回字典原始 key、名称、英文名称、可用性、学校、依赖与完整记录。平台动态标签优先；可用性没有当前权限证据时明确为 nil，不把“识别代码”当“允许编辑”。

| 业务域 | 代码示例 | 中文 / English | 证据 |
|---|---|---|---|
| taskFeedType | 1001 / 1002 | 任务 Assignment / 教学资源 Teaching resource | 家长混合列表与前端分支 |
| courseType | 1001 / 1002 | 课程 Course / 延展课程 CCA | 课程选项与前端规则 |
| repetition | 1011 / 1012 / 1013 | 每周 / 隔周 / 单次 | 状态说明与前端 |
| taskCompletion | 1011 / 1012 / 1013 | 未完成 / 按时完成 / 逾期完成 | 作业前端独立字典 |
| studentStatus | 1014…1018 | 在校 / 毕业 / 转学 / 待入学 / 转学中 | 学生前端字典 |
| classType | 1251 / 1253 / 1255 / 1256 / 1257 / 1258 | 主班级 / 学院 / 课程 / 自习室 / 宿舍 / 延展课程 | 班级前端字典 |
| gradeType | 1031 / 1032 / 1033 | 不评分 / 百分制 / 等级制 | 作业前端字典 |
| semesterType | 1204 / 1205 | 上学期 / 下学期 | 学期字典 |
| semesterStatus | 1201 / 1202 / 1203 | 未开始 / 进行中 / 已结束 | 学期字典 |
| attendanceStatus | intime / late / illness / personal 等 | 平台返回的具名考勤状态 | `/api/attendance/attendance-status`，平台标签优先 |
| leaveKind | personal | 请假申请 | 家长真实提交字段及前端固定值 |
| leaveStatus | pending / approved / declined / retrieved | 待审批 / 已批准 / 已拒绝 / 已撤回 | 请假前端与抓包 |

不能把 AllStatusCode 中的全局 1001 或 1011 含义直接套给所有字段。不同域保留不同解释；未确认的域返回“未识别状态或类型（原值）”与 `isRecognized=false`，不会仅显示裸数字。

考勤解析会先获取当前学校/学年字典，并在解码时绑定动态标签；响应自身的 kinds 也可补充字典。选项和语义缓存随学校、语言及会话清理。原因字典中的错误英文原文会保留，SDK 不静默修改平台数据。

`additionalFields` 中的新增字段是原始 JSON，不能凭字段名推断其语义；应按新增 API 指南补充证据后映射。成绩平均数、比率与时长采用字段或端点单位说明，SDK 不把未知比例擅自乘 100。
