// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SilentHell",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(
            name: "SilentHell",
            targets: ["SilentHell"]
        )
    ],
    targets: [
        .executableTarget(
            name: "SilentHell",
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
