// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Payment",
    platforms: [
        .iOS(.v13),
        .macOS(.v11),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(name: "Payment", targets: ["Payment"])
    ],
    targets: [
        .target(name: "Payment", dependencies: [], path: "Sources"),
    ]
)
