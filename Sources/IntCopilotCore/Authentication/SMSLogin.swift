import Foundation

public struct SMSLogin: Sendable {
    /// 保持服务器验证 Cookie 的家长会话。
    private let session: CoreSession
    /// 内存验证码挑战标识；不属于服务器 Token。
    private let challenge: UUID
    /// 本次验证码对应手机号，不包含国家区号。
    public let mobile: String
    /// 国家或地区电话区号。
    public let areaCode: String
    init(session: CoreSession, mobile: String, areaCode: String, challenge: UUID) { self.session = session; self.mobile = mobile; self.areaCode = areaCode; self.challenge = challenge }
    public func submit(code: String) async throws -> LoginResult { try await session.smsLogin(mobile: mobile, areaCode: areaCode, code: code, challenge: challenge) }
    public func resend() async throws { try await session.smsCode(to: mobile, areaCode: areaCode, challenge: challenge) }
}

