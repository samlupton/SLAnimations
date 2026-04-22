// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedConfetti",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "SharedConfetti",
            targets: ["SharedConfetti"],
        )
    ],
    targets: [
        .target(
            name: "SharedConfetti",
            path: "Sources/SharedConfetti"
        ),
        .testTarget(
            name: "SharedConfettiTests",
            dependencies: ["SharedConfetti"],
            path: "Tests/SharedConfettiTests"
        )
    ]
)
