// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MediaPipeline",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "MediaPipeline",
            targets: ["MediaPipeline"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "1.2.0"),
        .package(url: "https://github.com/noppefoxwolf/AVFoundationBackport-iOS17", from: "0.0.2"),
    ],
    targets: [
        .target(
            name: "MediaPipeline",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                "AVFoundationBackport-iOS17"
            ]
        ),
        .testTarget(
            name: "MediaPipelineTests",
            dependencies: ["MediaPipeline"],
            resources: [
                .copy("Resources/10bit.heic"),
                .copy("Resources/screenshot.png"),
                .copy("Resources/ultraHD8K.jpg"),
                .copy("Resources/ultraHD8K.mp4"),
                .copy("Resources/vga.mp4"),
                .copy("Resources/square.mp4"),
            ]
        ),
    ]
)

/*
let warnConcurrency = "-warn-concurrency"
let enableActorDataRaceChecks = "-enable-actor-data-race-checks"
let swiftSettings: [SwiftSetting] = [
    .enableUpcomingFeature("BareSlashRegexLiterals"),
    .enableUpcomingFeature("ConciseMagicFile"),
    .enableUpcomingFeature("ExistentialAny"),
    .enableUpcomingFeature("ForwardTrailingClosures"),
    .enableUpcomingFeature("ImplicitOpenExistentials"),
    .enableUpcomingFeature("StrictConcurrency"),
    
    .enableUpcomingFeature("ImportObjcForwardDeclarations"),
    .enableUpcomingFeature("DisableOutwardActorInference"),
    .enableUpcomingFeature("DeprecateApplicationMain"),
    .enableUpcomingFeature("IsolatedDefaultValues"),
    .enableUpcomingFeature("GlobalConcurrency"),

    .unsafeFlags([
        warnConcurrency,
        enableActorDataRaceChecks,
    ]),
]

package.targets.forEach { target in
    target.swiftSettings = target.swiftSettings ?? []
    target.swiftSettings?.append(contentsOf: swiftSettings)
}
*/
