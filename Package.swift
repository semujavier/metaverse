// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetaverseLib",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "MetaverseLib",
            targets: ["MetaverseLib"]),
    ],
    targets: [
        .executableTarget(
            name: "MetaverseExecutable",
            dependencies: [.target(name: "MetaverseLib")],
            path: "Sources/MetaverseExecutable"),
        .target(
            name: "MetaverseLib",
            path: "Sources/MetaverseLib")
    ]
)
