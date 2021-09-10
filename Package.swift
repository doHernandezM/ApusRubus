// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ApusRubus",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ApusRubus",
            targets: ["ApusRubus"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "4.0.0"),
        .package(url: "https://github.com/doHernandezM/SwiftyPi.git", ._exactItem("0.1.30")),
],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ApusRubus",
            dependencies: [
                .product(name: "Leaf", package: "leaf"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftyPi", package: "SwiftyPi"),
            ],
        swiftSettings: [
            // Enable better optimizations when buildSwiftyPiing in Release configuration. Despite the use of
            // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
            // builds. See <https://github.com/swift-server/guides/blob/main/docs/building.md#building-for-production> for details.
            .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
        ]
        ),
        .testTarget(
            name: "ApusRubusTests",
            dependencies: ["ApusRubus"]),
    ]
)
