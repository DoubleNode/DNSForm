// swift-tools-version:5.6
//
//  Package.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
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
        .package(url: "https://github.com/DoubleNodeOpen/AnimatedField.git", from: "2.5.18"),
        .package(url: "https://github.com/DoubleNode/DNSAppCore.git", from: "1.9.8"),
        .package(url: "https://github.com/DoubleNode/DNSBaseStage.git", from: "1.9.24"),
        .package(url: "https://github.com/DoubleNode/DNSBaseTheme.git", from: "1.9.7"),
        .package(url: "https://github.com/DoubleNode/DNSBlankWorkers.git", from: "1.9.60"),
        .package(url: "https://github.com/DoubleNode/DNSCore.git", from: "1.9.32"),
        .package(url: "https://github.com/DoubleNode/DNSCoreThreading.git", from: "1.9.0"),
        .package(url: "https://github.com/DoubleNode/DNSCrashNetwork.git", from: "1.9.13"),
        .package(url: "https://github.com/DoubleNode/DNSCrashSystems.git", from: "1.9.8"),
        .package(url: "https://github.com/DoubleNode/DNSProtocols.git", from: "1.9.85"),
        .package(url: "https://github.com/Nirma/SFSymbol", from: "1.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DNSForm",
            dependencies: [
                "AnimatedField", "DNSAppCore", "DNSBaseStage", "DNSBaseTheme", "DNSBlankWorkers",
                "DNSCore", "DNSCoreThreading", "DNSCrashNetwork", "DNSCrashSystems",
                "DNSProtocols", "SFSymbol"
            ],
            resources: [
                .process("FieldTypeCells/DNSFormDetailActionButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailAppActionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailCheckboxCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDateCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDateTimeCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDayOfWeekCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDeleteButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailHeaderView.xib"),
                .process("FieldTypeCells/DNSFormDetailHoursCell.xib"),
                .process("FieldTypeCells/DNSFormDetailImageUrlCell.xib"),
                .process("FieldTypeCells/DNSFormDetailLanguageSelectionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailPreviewButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSaveButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSectionHeaderCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextFieldCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextSelectionFieldCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextViewCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTimeOfDayCell.xib"),
                .process("FieldTypeCells/DNSFormDetailWeblinkCell.xib"),
                .process("DNSFormDetailImagePopupViewController.xib"),
                .process("Resources/Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "DNSFormTests",
            dependencies: ["DNSForm"]),
    ]
)
