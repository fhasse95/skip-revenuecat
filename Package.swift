// swift-tools-version: 5.9
// This is a Skip (https://skip.tools) package,
// containing a Swift Package Manager project
// that will use the Skip build plugin to transpile the
// Swift Package, Sources, and Tests into an
// Android Gradle Project with Kotlin sources and JUnit tests.
import PackageDescription

let package = Package(
    name: "skip-revenuecat",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macCatalyst(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "SkipRevenueCat",
            targets: [
                "SkipRevenueCat",
            ])
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "1.6.30"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "1.3.9"),
        .package(url: "https://github.com/RevenueCat/purchases-ios-spm.git", exact: "5.33.0"),
    ],
    targets: [
        .target(
            name: "SkipRevenueCat",
            dependencies: [
                .product(name: "SkipFoundation", package: "skip-foundation"),
                .product(name: "RevenueCat", package: "purchases-ios-spm"),
                .product(name: "RevenueCatUI", package: "purchases-ios-spm"),
            ],
            exclude: [
                "../../skip-revenuecat-library/",
                "../../skip-revenuecat-app/",
            ],
            resources: [],
            plugins: [.plugin(name: "skipstone", package: "skip")]
        ),
        .testTarget(
            name: "SkipRevenueCatTests",
            dependencies: [
                "SkipRevenueCat",
                .product(name: "SkipTest", package: "skip"),
            ],
            resources: [.process("Resources")],
            plugins: [.plugin(name: "skipstone", package: "skip")]
        ),
    ]
)
