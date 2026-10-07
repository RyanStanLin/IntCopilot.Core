// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "IntCopilot.Core",
    platforms: [.iOS(.v16), .macOS(.v13), .macCatalyst(.v16), .tvOS(.v16), .watchOS(.v9), .visionOS(.v1)],
    products: [.library(name: "IntCopilot.Core", targets: ["IntCopilotCore"])],
    targets: [
        .target(name: "IntCopilotTransport"),
        .target(name: "IntCopilotCore", dependencies: ["IntCopilotTransport"], resources: [.process("Resources")]),
        .testTarget(name: "IntCopilotCoreTests", dependencies: ["IntCopilotCore", "IntCopilotTransport"], resources: [.process("Fixtures")])
    ],
    swiftLanguageModes: [.v6]
)
