# 契约与风险标记

每个 `EndpointDescriptor` 包含平台、方法、路径、稳定性、安全分类、是否有外部副作用、安全性是否已确认、抓包覆盖、证据、参数、字段类型、依赖与告警。实验结果保留同一元数据。

| 标记 | 含义 |
|---|---|
| `stable` | 已确认本 SDK 使用的请求/响应契约；不等于平台承诺永不变更 |
| `unstable` | 请求、响应或用途不完整，使用 `client.experimental` |
| `readOnly` | 已确认业务读取，认证恢复后最多重放一次 |
| `authentication` | 专用认证状态管理，不通过实验入口调用 |
| `externalEffect` | 有真实业务写入/通知/发送效果，不自动重放 |
| `unverified` | 实际安全性未确认，禁止自动真实测试 |
| `hasExternalSideEffects` | 独立标识已知业务副作用；无法判断时为 nil |
| `safetyConfirmed` | 独立标识安全判断证据是否完整 |

自行发现接口标注“用户原始抓包未覆盖”，列出公开脚本或补充只读证据。只有静态脚本、路由编码 mock 或空响应的记录不能证明完整真实行为。发现写入可以同时标注外部副作用与安全性未完整确认。

短信 GET、已读标记、邮件、上传和预览 Token 不因为使用 GET 就视为安全。请假时间校验的未确认接口没有作为稳定请假的隐式依赖。家长请假前端实际提交 `personal`，原因使用平台动态字典，不混用普通考勤种类。

```swift
let endpoints = try client.experimental.endpoints()
let chosen = endpoints[userSelectedIndex]
let result = try await client.experimental.invoke(chosen, input: input)
let warnings = result.contract.warnings
```

实验接口要求调用方理解前端表达式和未确认部分。动态路径 `pathSuffix` 不应由猜测拼出；无法确定来源时停止真实调用。返回 `data` 支持 JSON 外的下载字节，`value` 保留完整 JSON；未知资源上传及第三方地址使用独立、明确批准的传输器，不能泄露平台认证头。

SDK 本身不代替 App 对业务写入的用户确认。测试环境中的真实写入必须先说明 API、目的、数据、影响和可靠撤回方案，并逐项获得账号持有人同意；没有可靠撤回时使用 mock。消息邮件与通知即使撤回记录也无法保证收回，不能声称完全可逆。
