// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SLAnimations",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "SLAnimations",
            targets: ["SLAnimations"]
        ),
        .executable(
            name: "Example",
            targets: ["Example"]
        )
    ],
    targets: [
        .target(
            name: "SLAnimations",
            path: "SLAnimations/Sources/SLAnimations"
        ),
        .executableTarget(
            name: "Example",
            dependencies: ["SLAnimations"],
            path: "Example/"
        ),
        .testTarget(
            name: "SLAnimationsTests",
            dependencies: ["SLAnimations"],
            path: "SLAnimations/Tests"
        )
    ]
)
