# IntCopilot.Core

[![CI](https://github.com/RyanStanLin/IntCopilot.Core/actions/workflows/ci.yml/badge.svg)](https://github.com/RyanStanLin/IntCopilot.Core/actions/workflows/ci.yml)

IntSchool 家长与教师平台的 Swift 6 API 库。公开模块 `IntCopilotCore`，使用 `async/await`、严格并发和内存会话；运行时仅依赖 Foundation。

支持 iOS/iPadOS 16、macOS 13、Mac Catalyst 16、tvOS 16、watchOS 9、visionOS 1。

```swift
.package(url: "https://github.com/RyanStanLin/IntCopilot.Core.git", from: "0.1.0")
```

```swift
import Foundation
import IntCopilotCore

let parent = ParentClient()
let login = try await parent.login(account: account, password: password)
let students = try await parent.students()
let selected = students[userSelectedIndex]
let scope = parent.student(selected)
let timetable = try await scope.timetable(in: .schoolWeek(containing: Date()))
```

家长同时支持短信验证码登录；错误验证码后可以继续调用同一 `SMSLogin.submit(code:)`，不会自动重发短信。教师支持门户密码登录与 OAuth 交换，也能明确区分平台 Token 和 SSO Token。

```swift
let sms = try await parent.requestSMSCode(to: mobile)
do {
    _ = try await sms.submit(code: firstCode)
} catch APIError.invalidVerificationCode {
    _ = try await sms.submit(code: correctedCode)
}

let teacher = TeacherClient()
_ = try await teacher.login(account: account, password: password)
let courses = try await teacher.courses()
let roster = try await teacher.course(courses[userSelectedIndex]).students()
```

状态、类型和动态选项携带中文/英文名称。未知值明确显示未识别，响应模型保留 `additionalFields` 与缺失/null 的区别。`ParentEndpoints` / `TeacherEndpoints` 提供所有已确认抓包业务契约的逐步调用；上下文服务自动补充学校、学生、课程与学年。

未完整验证的接口通过 `client.experimental` 调用，返回来源、稳定性和副作用元数据。HTTP GET 也可能发送短信或改变业务状态，请按契约标记判断。默认测试和 CI 完全使用脱敏 fixtures 与 mock，不访问真实平台。

[完整 GitHub Wiki](https://github.com/RyanStanLin/IntCopilot.Core/wiki) 包含安装、认证、会话、逐接口/字段参考、依赖图、操作 SOP、测试规范及新增 API 指南。Wiki 源文件保存在 [Wiki](Wiki)，可编译 SOP 源码保存在测试 target。此包不提供 UI、磁盘或 Keychain 持久化。

SwiftUI 测试工作台位于 [Examples/SwiftUIDemo](Examples/SwiftUIDemo)，支持 Mac、iPhone 和 iPad，包含两端登录、查询页面、完整 API 目录和逐次确认的手动写入测试。用 Xcode 打开其中的 `IntCopilotDemo.xcodeproj` 即可运行。

MIT License。平台属于其原运营方；本 SDK 与运营方没有隶属关系。
