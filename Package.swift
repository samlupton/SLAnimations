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
        )
    ],
    targets: [
        .target(
            name: "SLAnimations",
            path: "SLAnimations/Sources/SLAnimations"
        ),
        .testTarget(
            name: "SLAnimationsTests",
            dependencies: ["SLAnimations"],
            path: "SLAnimations/Tests"
        )
    ]
)
