// swift-tools-version:5.7
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
        .iOS(.v15),
        .tvOS(.v15),
        .macOS(.v10_15),
        .watchOS(.v9),
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
        .package(url: "https://github.com/DoubleNodeOpen/AnimatedField.git", from: "2.5.45"),
        .package(url: "https://github.com/DoubleNode/DNSAppCore.git", from: "1.10.2"),
        .package(url: "https://github.com/DoubleNode/DNSBaseStage.git", from: "1.10.29"),
        .package(url: "https://github.com/DoubleNode/DNSBaseTheme.git", from: "1.10.6"),
        .package(url: "https://github.com/DoubleNode/DNSBlankWorkers.git", from: "1.10.43"),
        .package(url: "https://github.com/DoubleNode/DNSCore.git", from: "1.10.35"),
        .package(url: "https://github.com/DoubleNode/DNSCoreThreading.git", from: "1.10.1"),
        .package(url: "https://github.com/DoubleNode/DNSCrashNetwork.git", from: "1.10.0"),
        .package(url: "https://github.com/DoubleNode/DNSCrashSystems.git", from: "1.10.0"),
        .package(url: "https://github.com/DoubleNode/DNSCrashWorkers.git", from: "1.10.36"),
        .package(url: "https://github.com/DoubleNode/DNSProtocols.git", from: "1.10.68"),
        .package(url: "https://github.com/rajdeep/proton.git", from: "0.6.1"),
        .package(url: "https://github.com/Nirma/SFSymbol", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DNSForm",
            dependencies: [
                "AnimatedField", "DNSAppCore", "DNSBaseStage", "DNSBaseTheme", "DNSBlankWorkers",
                "DNSCore", "DNSCoreThreading", "DNSCrashNetwork", "DNSCrashSystems",
                "DNSCrashWorkers", "DNSProtocols", "SFSymbol",
                .product(name: "Proton", package: "proton")
            ],
            resources: [
                .process("FieldTypeCells/DNSFormDetailActionButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailAppActionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailCheckboxCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDateCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDateTimeCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDayOfWeekCell.xib"),
                .process("FieldTypeCells/DNSFormDetailDeleteButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailFileSelectorCell.xib"),
                .process("FieldTypeCells/DNSFormDetailHeaderView.xib"),
                .process("FieldTypeCells/DNSFormDetailHoursCell.xib"),
                .process("FieldTypeCells/DNSFormDetailImageSelectorCell.xib"),
                .process("FieldTypeCells/DNSFormDetailImageSelectorPlusCell.xib"),
                .process("FieldTypeCells/DNSFormDetailImageUrlCell.xib"),
                .process("FieldTypeCells/DNSFormDetailLanguageSelectionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailPreviewButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSaveButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSectionHeaderCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSpacerCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextFieldCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextSelectionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextViewCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTimeOfDayCell.xib"),
                .process("FieldTypeCells/DNSFormDetailWeblinkCell.xib"),
                .process("FormStage/DNSFormDetailImagePopupViewController.xib"),
                .process("Resources/Assets.xcassets")
            ]
        ),
        .testTarget(
            name: "DNSFormTests",
            dependencies: ["DNSForm"]),
    ]
)
