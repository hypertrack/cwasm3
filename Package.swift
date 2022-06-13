// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "CWasm3",
    products: [
        .library(
            name: "CWasm3",
            targets: ["CWasm3"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CWasm3",
            dependencies: ["libuvwasi_a", "libuv_a"],
            cSettings: [
                .define("APPLICATION_EXTENSION_API_ONLY", to: "YES"),
                .define("d_m3MaxDuplicateFunctionImpl", to: "10"),
                .define("d_m3HasUVWASI", to: "YES"),
            ]
        ),
        .binaryTarget(
            name: "libuvwasi_a",
            path: "Libs/libuvwasi_a.xcframework"
        ),
        .binaryTarget(
            name: "libuv_a",
            path: "Libs/libuv_a.xcframework"
        ),
        .testTarget(
            name: "CWasm3Tests",
            dependencies: ["CWasm3"],
            exclude: [
                "Resources/add.wat",
                "Resources/constant.wat",
                "Resources/fib64.wat",
                "Resources/imported-add.wat",
                "Resources/memory.wat",
            ]),
    ]
)
