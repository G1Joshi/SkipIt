// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "skip-it",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
        .library(name: "SkipItApp", type: .dynamic, targets: ["SkipIt"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.1.12"),
        .package(url: "https://source.skip.tools/skip-ui.git", from: "1.0.0"),
    ],
    targets: [
        .target(name: "SkipIt", dependencies: [.product(name: "SkipUI", package: "skip-ui")], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
        .testTarget(name: "SkipItTests", dependencies: ["SkipIt", .product(name: "SkipTest", package: "skip")], resources: [.process("Resources")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
