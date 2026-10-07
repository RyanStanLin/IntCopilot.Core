# IntCopilot Demo

SwiftUI API 测试工作台，支持 macOS 13+、iPhone / iPad iOS 16+。直接依赖本仓库的 `IntCopilot.Core`，所有请求通过 SDK；Demo 不复制认证或业务 API 实现。

## 运行

打开 `IntCopilotDemo.xcodeproj`，选择共享 Scheme **IntCopilotDemo**，运行目标选 **My Mac** 或 iPhone / iPad 模拟器，然后 ⌘R。真机运行需要在 Signing & Capabilities 中选择自己的开发团队。

克隆 Core 仓库后，打开以下工程：

```text
IntCopilot.Core/
├── Package.swift
└── Examples/SwiftUIDemo/IntCopilotDemo.xcodeproj
```

默认使用真实平台，但启动不发请求。选择家长或教师平台，输入账号密码登录。家长也支持短信验证码；教师支持平台 Token 和独立的 SSO Token 交换入口。

打开“离线样本模式”可以免账号检查界面。账号密码输入 `demo` / `demo`；离线短信验证码为 `123456`，先输入其他码可验证错误后重试。离线网络不会回退到真实请求。样本使用已脱敏的 SDK fixtures，学校、教师入口等少量认证响应为合成数据。

## 查询顺序

家长：登录 → 获取关联学生 → 选择学生 → 资料、课表、考勤、行为记录、课程、作业、报告与请假记录。

教师：门户登录 → 获取课程 → 选择课程 → 获取名单 → 选择学生 → 学生资料、课表、考勤与行为记录。课程课节、任务类型、作业学生记录和成绩报告使用课程上下文。

日期、查询范围和分页可在相应页面调整。作业详情、报告详情和课节考勤需要先获取列表并选择具名对象；不会猜测 ID。学校列表切换后点击“应用学校”，SDK 会使旧上下文失效。学生和课程改变时界面清除相关旧选择。

查询结果可以展开嵌套字段，查看字段含义、空值和语义状态，也可以切换完整 JSON。结果保留 SDK 的新增字段。完整 API 目录加载 SDK 的全部 626 项接口契约，按当前平台展示，可搜索、查看参数来源、证据、稳定性和安全分类。特殊查询可使用 JSON 编辑器；选项从平台字典获得后以具名对象插入，无需填写内部状态代码。契约不完整的接口仍保留实验标记。

2026-10-08 实测中，家长原成绩簿路由 `/api/task-grade/grade-book` 返回 404。界面会直接显示服务器错误，不自动切换到安全性未确认的 V2 路由。作业分数为空会显示“未提供”，不会转换为零分。

## 真实操作保护

- 默认仅允许认证初始化和已确认无外部副作用的查询。未知行为、短信发送、已读标记、上传及业务写入均由传输层拦截，不能依据 GET / POST 判断安全性。
- 短信“发送验证码”与“重新发送”各放行一次发送请求；验证码错误后仍保留手机号和 Cookie，可以再次提交，不自动重发。
- “手动写入测试”默认锁定。用户解锁后，提交请假、撤回请假、教师考勤登记、成绩录入、行为日记和发送家长消息都必须再次核对目标、请求路由和数据，再确认执行一次。
- 完整 API 目录中未确认安全性的调用同样要求手动解锁和逐次确认。未确认语义不会被描述为安全；辅助参数校验可能在发送前失败。
- 一次性许可在发出请求之前消耗。网络失败或 SDK 鉴权失败时不自动重放业务操作；确认后未用掉的许可也会清除。空响应仅表示服务器接受，不能凭空生成记录 ID。
- 本轮自动真实验证只读；教师限定 A2 Computer Science 的 Ryan Lin，名单和课程仅用来定位该学生。自动诊断不会调用登记、提交、撤回、发送通知或上传。

账号密码只在输入和认证期间驻留内存。SDK 的 Token、Cookie 和会话快照不持久化；登出清除会话。请求记录只显示契约路由、HTTP 状态、耗时和大小，隐藏所有路径参数、查询、认证头、Cookie 和响应正文。完整查询结果只供当前屏幕查看，不写入日志。切换平台或数据来源会清除会话。

## 测试

```sh
swift test --disable-sandbox
xcodebuild -project IntCopilotDemo.xcodeproj -scheme IntCopilotDemo \
  -destination 'platform=macOS' CODE_SIGNING_ALLOWED=NO build
xcodebuild -project IntCopilotDemo.xcodeproj -scheme IntCopilotDemo \
  -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build
```

2026-10-08 验证：Core 31 项测试、Demo 安全层 11 项测试通过；Mac 和 iOS 模拟器构建通过。真实只读流程 40 项通过，家长成绩簿 1 项返回 404；真实短信发送一次后登录成功。iPhone 离线流程 56 项通过，1 项因样本缺少关联记录而跳过。详细范围和结果见 [ValidationReport.json](Docs/ValidationReport.json)，不包含验证码、凭据或真实查询正文。

SwiftPM 的 `DemoSupportTests` 验证传输边界、所有已确认查询、全部业务写入默认拦截、短信逐次放行、失败不重放、Cookie 隔离、请求记录脱敏和语义参数关联。默认测试完全离线。

可在 Xcode Scheme 的运行参数加入 `--offline --offline-smoke`，在真正的 App 中逐步执行两平台离线诊断，包含密码、Token、快照、学生与课程查询、短信错误后重试。结果显示在 App 中；可选 `--report-file /path/to/report.json` 写入仅含检查名称和结果的报告。模拟器报告路径必须位于 App 沙盒内。

真实诊断需显式传入 `--live-readonly-smoke --credentials-file /private/path/credentials.private.json`；该文件由使用者提供，形如 `{"parent":{"account":"…","password":"…"},"teacher":{"account":"…","password":"…"}}`。凭据、报告和 research 均不属于工程资源，也不得提交。真实诊断只验证当时有数据的路径，空列表会标记跳过，静态样本不能证明服务器契约稳定。

## 扩展

`Support/GuardedTransport.swift` 独立管理安全边界；`QueryPlanning.swift` 管理实验参数。`DemoStore` 管理内存状态，`Queries.swift` 调用 SDK 服务，`Features` 按业务领域拆分，`JSONInspector` 展示字段参考。

新增稳定 API 应先在 Core 中加入契约、模型、服务和 mock；再在 `Queries.swift` 增加调用，在对应业务页面添加具名对象选择和按钮。新实验 API 会自动出现在目录，但不会自动获得安全放行。添加 Swift 文件后执行 `python3 Tools/generate_project.py` 更新工程；该脚本只生成工程和共享 Scheme，不会修改 SDK。
