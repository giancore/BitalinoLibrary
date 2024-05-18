// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BitalinoLibrary",
    products: [
        .library(
            name: "BitalinoCpp",
            targets: ["BitalinoCpp"]),
        .executable(
            name: "BitalinoLibrary",
            targets: ["BitalinoLibrary"]),
    ],
    targets: [
        .target(
            name: "BitalinoCpp",
            dependencies: []
        ),
        .executableTarget(
            name: "BitalinoLibrary",
            dependencies: ["BitalinoCpp"],
            path: "./Sources/BitalinoLibrary",
            sources: [ "main.swift" ],
            swiftSettings: [.unsafeFlags([
                "-I", "Sources/BitalinoCpp",
                "-cxx-interoperability-mode=default",
            ])]
        ),
    ]
)
