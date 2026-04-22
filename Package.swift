// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedConfetti",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SharedConfetti",
            targets: ["SharedConfetti"]
        )
    ],
    targets: [
        .target(
            name: "Sources",
            path: "Sources/SharedConfetti"
        ),
        .testTarget(
            name: "Tests",
            dependencies: ["SharedConfetti"],
            path: "Tests"
        )
    ]
)
