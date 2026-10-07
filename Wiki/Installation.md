# 安装与平台

SwiftPM 产品名为 `IntCopilot.Core`，Swift 模块名为 `IntCopilotCore`。工具版本最低 Swift 6.0，语言模式为 Swift 6。

```swift
.package(url: "https://github.com/RyanStanLin/IntCopilot.Core.git", from: "0.1.0")
```

目标依赖：`.product(name: "IntCopilot.Core", package: "IntCopilot.Core")`。Xcode 可使用 File → Add Package Dependencies 添加仓库 URL。

| 平台 | 最低版本 |
|---|---|
| iOS / iPadOS | 16 |
| macOS | 13 |
| Mac Catalyst | 16 |
| tvOS | 16 |
| watchOS | 9 |
| visionOS | 1 |

运行时仅依赖 Foundation。`IntCopilotTransport` 是独立 target，公开类型通过 `IntCopilotCore` 的类型别名提供；默认 `URLSessionTransport` 使用 ephemeral 会话和独立内存 Cookie，不写磁盘。

App 负责界面、用户选择、验证码输入、凭据安全存储和生命周期。所有网络操作都可通过注入 `HTTPTransport` 测试。示例中的账号、手机号、Token、学生和课程都由 App 提供，不使用库内硬编码业务 ID。
