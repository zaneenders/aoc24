// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "aoc24",
    platforms: [
        .macOS("15.0")
    ],
    products: [
        .library(
            name: "aoc24",
            targets: ["aoc24"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-system", from: "1.4.0"),
        .package(
            url: "https://github.com/apple/swift-nio.git",
            from: "2.76.1"
        ),
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
    ],
    targets: [
        .target(
            name: "aoc24",
            dependencies: [
                .product(name: "_NIOFileSystem", package: "swift-nio"),
                .product(name: "SystemPackage", package: "swift-system"),
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]),
        .testTarget(
            name: "aoc24Tests",
            dependencies: ["aoc24"]
        ),
    ]
)
