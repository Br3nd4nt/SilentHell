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
        ),
        .library(
            name: "SilentHellRenderer",
            targets: ["SilentHellRenderer"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdaEngine/AdaEngine.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/SimplyDanny/SwiftLintPlugins.git",
            from: "0.64.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "SilentHell",
            dependencies: [
                .product(name: "AdaEngine", package: "AdaEngine"),
                .product(name: "AdaRender", package: "AdaEngine"),
                .product(name: "AdaUtils", package: "AdaEngine"),
                .product(name: "Math", package: "AdaEngine")
            ],
            path: "SilentHell/App",
            resources: [
                .process("Assets.xcassets")
            ], plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),
        .target(
            name: "SilentHellRenderer",
            dependencies: [
                .product(name: "AdaEngine", package: "AdaEngine"),
                .product(name: "AdaRender", package: "AdaEngine"),
                .product(name: "Math", package: "AdaEngine")
            ],
            path: "SilentHell/Renderer",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
