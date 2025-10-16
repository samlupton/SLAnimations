// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

//let package = Package(
//    name: "SLAnimations",
//    platforms: [
//        .iOS(.v17)
//    ],
//    products: [
//        // Products define the executables and libraries a package produces, making them visible to other packages.
//        .library(
//            name: "SLAnimations",
//            targets: ["SLAnimations"]
//        ),
//    ],
//    targets: [
//        // Targets are the basic building blocks of a package, defining a module or a test suite.
//        // Targets can depend on other targets in this package and products from dependencies.
//        .target(
//            name: "SLAnimations"
//        ),
//        .testTarget(
//            name: "SLAnimationsTests",
//            dependencies: ["SLAnimations"]
//        ),
//    ]
//)

// swift-tools-version: 6.2
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
            path: "SLAnimations/Sources"
        ),
        .testTarget(
            name: "SLAnimationsTests",
            dependencies: ["SLAnimations"],
            path: "SLAnimations/Tests"
        )
    ]
)
