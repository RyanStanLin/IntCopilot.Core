// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "IntCopilotDemoSupport",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [.library(name: "DemoSupport", targets: ["DemoSupport"])],
    dependencies: [.package(path: "../..")],
    targets: [
        .target(name: "DemoSupport", dependencies: [.product(name: "IntCopilot.Core", package: "IntCopilot.Core")], path: "Support"),
        .testTarget(name: "DemoSupportTests", dependencies: ["DemoSupport"], path: "Tests")
    ],
    swiftLanguageModes: [.v6]
)
