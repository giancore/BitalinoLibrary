// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BitalinoLibrary",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "Bitalino", targets: ["Bitalino"]),
        .executable(name: "BitalinoLibrary", targets: ["BitalinoLibrary"])
    ],
    targets: [
        .target(name: "Bitalino"),
        .executableTarget(
            name: "BitalinoLibrary",
            dependencies: ["Bitalino"],
            swiftSettings: [.unsafeFlags(["-cxx-interoperability-mode=default"])]
        )
    ]
)
