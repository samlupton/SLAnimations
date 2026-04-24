// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharedPlume",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SharedPlume",
            targets: ["SharedPlume"],
        )
    ],
    targets: [
        .target(
            name: "SharedPlume",
            path: "Sources/SharedPlume"
        ),
        .testTarget(
            name: "SharedPlumeTests",
            dependencies: ["SharedPlume"],
            path: "Tests/SharedPlumeTests"
        )
    ]
)
