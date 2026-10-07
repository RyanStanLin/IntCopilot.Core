import SwiftUI
import IntCopilotCore

struct AuthenticationView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var mode = "password"
    @State private var account = ""
    @State private var password = ""
    @State private var token = ""
    @State private var mobile = ""
    @State private var areaCode = "86"
    @State private var code = ""
    var body: some View {
        LabCard("测试数据来源", symbol: "externaldrive") {
            Toggle("离线样本模式（不连接真实平台）", isOn: Binding(get: {store.offlineMode}, set: {value in Task { await store.switchDataSource(value) }}))
            if store.offlineMode { Text("密码登录可输入 demo / demo；离线短信正确码为 123456，其他码用于错误重试验证。切换来源会清除会话。").font(.caption).foregroundStyle(.secondary) }
        }
        LabCard(store.platform == .parent ? "家长平台认证" : "教师门户认证", symbol: "person.badge.key") {
            Picker("登录方式", selection: $mode) {
                Text("账号密码").tag("password")
                if store.platform == .parent { Text("短信验证码").tag("sms") }
                Text("平台 Token").tag("token")
                if store.platform == .teacher { Text("SSO Token 交换").tag("sso") }
            }.pickerStyle(.segmented)
            switch mode {
            case "password":
                TextField("账号", text: $account).textFieldStyle(.roundedBorder).autocorrectionDisabled().lowercaseInput()
                SecureField("密码", text: $password).textFieldStyle(.roundedBorder)
                Text(store.platform == .parent ? "SDK 自动取得入口学校配置并调用统一登录。" : "SDK 完成成都门户 Cookie 登录、OAuth 和教师平台 Token 交换。")
                    .font(.caption).foregroundStyle(.secondary)
                ActionButton("账号密码登录", symbol: "arrow.right.circle") {
                    let secret = password; password = ""
                    await store.passwordLogin(account: account.trimmingCharacters(in: .whitespacesAndNewlines), password: secret)
                }.disabled(account.isEmpty || password.isEmpty)
            case "sms":
                TextField("手机号", text: $mobile).textFieldStyle(.roundedBorder).disabled(store.smsReady)
                TextField("国家 / 地区区号", text: $areaCode).textFieldStyle(.roundedBorder).disabled(store.smsReady)
                ActionRow {
                    ActionButton(store.smsReady ? "重新发送（会发送短信）" : "发送验证码", symbol: "message") { await store.requestSMS(mobile: mobile, areaCode: areaCode) }.disabled(mobile.isEmpty || areaCode.isEmpty)
                    if store.smsReady { ActionButton("取消短信会话", symbol: "xmark.circle") { await store.logout() } }
                }
                if store.smsReady {
                    SecureField("短信验证码", text: $code).textFieldStyle(.roundedBorder)
                    ActionButton("提交验证码 / 再次尝试", symbol: "checkmark.circle") { let value = code; code = ""; await store.submitSMS(value) }.disabled(code.isEmpty)
                    Text("验证码错误后继续输入即可。不会自动重发，不会清除当前手机号与 Cookie。").font(.caption).foregroundStyle(.secondary)
                }
            default:
                SecureField(mode == "sso" ? "门户 OAuth access_token" : "本平台 X-Token", text: $token).textFieldStyle(.roundedBorder)
                ActionButton(mode == "sso" ? "交换教师平台 Token" : "使用平台 Token", symbol: "key") { let value = token; token = ""; await store.tokenLogin(value, sso: mode == "sso") }.disabled(token.isEmpty)
            }
        }
        LabCard("内存会话", symbol: "lock.shield") {
            Text("账号密码只用于本次输入。Token、Cookie 和快照留在内存；不写入 UserDefaults、文件或 Keychain。Token 过期后回到这里重新登录。").font(.callout).foregroundStyle(.secondary)
            Text(store.snapshotInfo).font(.caption)
            ActionRow {
                ActionButton("保存内存快照", symbol: "square.and.arrow.down") { await store.saveSnapshot() }.disabled(!store.isLoggedIn)
                ActionButton("恢复内存快照", symbol: "arrow.clockwise") { await store.restoreSnapshot() }
                ActionButton("登出并清除", symbol: "rectangle.portrait.and.arrow.right") { await store.logout() }
            }
        }
        .onChange(of: store.platform) { _ in mode = "password"; account = ""; password = ""; token = ""; mobile = ""; code = "" }
    }
}

private extension View {
    @ViewBuilder func lowercaseInput() -> some View {
        #if os(iOS)
        self.textInputAutocapitalization(.never)
        #else
        self
        #endif
    }
}
