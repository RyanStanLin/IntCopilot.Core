# IntCopilot.Core

Swift 6 API 库，公开模块 `IntCopilotCore`，运行时仅依赖 Foundation。MIT 许可。家长与教师客户端独立管理内存会话。

当前目录记录 **626 个端点**；**125 个端点覆盖全部 157 组原始请求/响应**，另有补充只读证据。响应模型保留所有已确认字段、动态字典与新增字段。原始研究资料不公开。

| 文档 | 内容 |
|---|---|
| [安装与平台](Installation) | 安装与平台 |
| [认证、短信重试与 Token 恢复](Authentication) | 认证、短信重试与 Token 恢复 |
| [架构与模块边界](Architecture) | 架构与模块边界 |
| [逐接口参考](API-Index) | 逐接口参考 |
| [157 组抓包覆盖](Capture-Coverage) | 157 组抓包覆盖 |
| [参数依赖图与来源](Dependencies) | 参数依赖图与来源 |
| [业务语义字典](Semantics) | 业务语义字典 |
| [不稳定性、外部副作用及证据](Risks) | 不稳定性、外部副作用及证据 |
| [标准操作调用顺序](SOP) | 标准操作调用顺序 |
| [可编译 Swift 示例](SOP-Examples) | 可编译 Swift 示例 |
| [脱敏测试与真实测试边界](Testing) | 脱敏测试与真实测试边界 |
| [新增 API 完整指南](Adding-APIs) | 新增 API 完整指南 |

[仓库与 CI](https://github.com/RyanStanLin/IntCopilot.Core) · [验证报告](https://github.com/RyanStanLin/IntCopilot.Core/blob/main/Docs/ValidationReport.json)

Wiki 源文件随主仓库版本管理，并同步 GitHub 原生 Wiki。静态发现和 mock 不代表真实契约验证；未完整确认接口留在实验入口。
