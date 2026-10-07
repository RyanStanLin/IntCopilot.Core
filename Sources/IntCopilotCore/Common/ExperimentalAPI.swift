import Foundation

public struct ExperimentalAPI: Sendable {
    /// 实验入口所属会话；与稳定服务共享内存认证状态。
    private let session: CoreSession
    /// 此入口对应的平台。
    public let platform: Platform
    init(session: CoreSession, platform: Platform) { self.session = session; self.platform = platform }
    public func endpoints() throws -> [EndpointDescriptor] { try APIContractCatalog.endpoints(platform: platform).filter { $0.stability == .unstable } }
    public func invoke(_ endpoint: EndpointDescriptor, input: APIInput = APIInput()) async throws -> ExperimentalResult { try await session.experimental(endpoint, input: input) }
}

