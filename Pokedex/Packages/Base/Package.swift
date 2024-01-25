// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Base",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Base",
            targets: ["Base"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Resolver.git", from: "1.5.0"),
        .package(url: "https://github.com/GayleDunham/SwiftLintPlugin.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "Base",
            dependencies: ["Resolver"],
            resources: [ .process("Mocks") ],
            plugins: [ .plugin(name: "SwiftLintBuildTool", package: "SwiftLintPlugin") ]
        ),
        .testTarget(
            name: "BaseTests",
            dependencies: ["Base", "Resolver"]
        ),
    ]
)
