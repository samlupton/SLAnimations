// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Plume",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Plume",
            targets: ["Plume"],
        )
    ],
    targets: [
        .target(
            name: "Plume",
            path: "Sources/Plume"
        ),
        .testTarget(
            name: "PlumeTests",
            dependencies: ["Plume"],
            path: "Tests/PlumeTests"
        )
    ]
)
