// swift-tools-version:5.6
//
//  Package.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "DNSForm",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DNSForm",
            type: .static,
            targets: ["DNSForm"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/DoubleNode/DNSBaseStage.git",  branch: "master"),
        .package(url: "https://github.com/DoubleNode/DNSBaseTheme.git", from: "1.8.0"),
        .package(url: "https://github.com/DoubleNode/DNSCore.git", from: "1.8.0"),
        .package(url: "https://github.com/DoubleNode/DNSCoreThreading.git", from: "1.8.0"),
        .package(url: "https://github.com/DoubleNode/DNSProtocols.git", from: "1.8.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DNSForm",
            dependencies: [
                "DNSBaseStage", "DNSBaseTheme", "DNSCore", "DNSCoreThreading",
                "DNSProtocols"
            ]),
        .testTarget(
            name: "DNSFormTests",
            dependencies: ["DNSForm"]),
    ]
)
