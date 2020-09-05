// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Feedac-UIRedux",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Feedac-UIRedux",
            targets: ["Feedac-UIRedux"]),
    ],
    dependencies: [
        .package(url: "https://github.com/mariusjcb/Feedac-CoreRedux.git", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "Feedac-UIRedux",
            dependencies: ["Feedac-CoreRedux"]),
        .testTarget(
            name: "Feedac-UIReduxTests",
            dependencies: ["Feedac-UIRedux"]),
    ],
    swiftLanguageVersions: [
        .version("5")
    ]
)
