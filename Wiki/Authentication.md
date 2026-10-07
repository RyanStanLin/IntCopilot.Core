# 认证与内存会话

| 入口 | 家长 | 教师 |
|---|---|---|
| `login(account:password:)` | `/api/login/unify` | 成都门户 Cookie → OAuth → `/api/login/switchToken` |
| `login(token:)` | 家长平台 Token | 教师平台 Token |
| `login(ssoAccessToken:)` | 不支持 | 明确进行 SSO Token 交换 |
| `requestSMSCode(to:areaCode:)` | 发送验证码并返回挑战句柄 | 不支持 |

家长登录先读 `/api/login/schools` 的公开配置，用 `domain` 匹配入口域名，得到请求头 `X-SchoolId`。这里的学校配置不是账号权限证明，服务端仍校验每次业务请求。密码登录和短信登录响应中的 `success`、`resCode`、`extraMsg` 与 Token 会被独立检查。首次登录需要交互时返回 `unsupportedAuthentication`，不会自动执行密码重置。

教师门户使用 `loginType=INTOA`、公开租户与 OAuth client ID。SDK 拒绝自动 HTTP 跳转，只接受预期门户及教师根地址的 OAuth 跳转；门户密码失败不会被当成成功。平台 Token 与 SSO Token 不混用。

直接平台 Token 入口是挂接已有会话材料，不验证 JWT 签名，不把 JWT 内容当授权证明。JWT `exp` 仅提供过期提示。学校和后续业务请求由服务器验证。默认不存储密码；短信验证码从不作为自动恢复凭据。

## 恢复策略

默认回调模式。App 回调可以返回密码、平台 Token 或教师 SSO Token。

```swift
let client = ParentClient(authentication: AuthenticationConfiguration(
    callback: { context in
        let material = try await appAuthentication(context)
        return material
    }
))
```

仅当 App 显式启用 `.automatic()` 时保留内存密码，最多自动尝试三次，不含首次登录。`.automatic(maxAttempts:)` 可修改上限；零表示不自动重登。只重试临时网络错误或 HTTP 5xx；无效密码、交互要求及其他业务拒绝立即回退 App 回调。没有回调或恢复失败时抛出错误。

并发恢复合并为同一个 Task。只读请求遇到 HTTP 401 后最多重放一次；业务写入和安全性未知的调用不自动重放。过期提示触发请求前恢复，不会造成已经发出的写入被重复提交。HTTP 403 直接返回权限错误。

`logout()` 使旧认证任务和在途请求失效，清除 Token、Cookie、密码及上下文。跨学校引用会被拒绝；选项缓存按学校及语言隔离，五分钟过期，也可 `refreshOptions()` 手动清空。显式登录失败不会恢复原账号。

## 快照

`try await client.snapshot()` 与 `try await client.restore(snapshot)` 支持 App 管理的会话快照。快照包含敏感 Token/Cookie、平台、环境、学校与上下文，不包含密码。SDK 不实现任何持久化；App 必须避免日志及非安全存储。恢复拒绝不同平台/环境快照，并过滤非受信任域 Cookie。

## 短信重试

发送与提交分开。错误码 1039 表示本次验证码拒绝，挑战和 Cookie 保留，可以再次 `submit(code:)`。SDK 不设置固定提交次数限制，也不自动发送短信。过期、限流及锁定按服务端错误处理；只在用户要求重新发送时调用 `resend()`。旧挑战在登出、其他登录或成功提交后失效。并发提交须等待上一提交结果；重新发送会使旧提交结果失效。

其他 `resCode` 保留在 `APIError.backend`，不会猜测为验证码错误。`APIError` 区分 HTTP、业务拒绝、参数、权限及会话失效。业务错误文本可能包含用户信息，App 不应直接记录完整错误内容。
