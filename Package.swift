// swift-tools-version:5.7
//
//  Package.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "DNSForm",
    platforms: [
        .iOS(.v16),
        .tvOS(.v16),
        .macCatalyst(.v16),
        .macOS(.v13),
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
        .package(url: "https://github.com/DoubleNodeOpen/AnimatedField.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/DoubleNode/DNSAppCore.git", .upToNextMajor(from: "1.12.0")),
        .package(url: "https://github.com/DoubleNode/DNSBaseStage.git", .upToNextMajor(from: "1.12.2")),
        .package(url: "https://github.com/DoubleNode/DNSBlankWorkers.git", .upToNextMajor(from: "1.12.4")),
        .package(url: "https://github.com/DoubleNode/DNSCore.git", .upToNextMajor(from: "1.12.1")),
        .package(url: "https://github.com/DoubleNode/DNSCoreThreading.git", .upToNextMajor(from: "1.12.1")),
        .package(url: "https://github.com/DoubleNode/DNSCrashNetwork.git", .upToNextMajor(from: "1.12.0")),
        .package(url: "https://github.com/DoubleNode/DNSCrashSystems.git", .upToNextMajor(from: "1.12.0")),
        .package(url: "https://github.com/DoubleNode/DNSCrashWorkers.git", .upToNextMajor(from: "1.12.1")),
        .package(url: "https://github.com/DoubleNode/DNSProtocols.git", .upToNextMajor(from: "1.12.3")),
//        .package(path: "../../Open Source/AnimatedField"),
//        .package(path: "../DNSAppCore"),
//        .package(path: "../DNSBaseStage"),
//        .package(path: "../DNSBlankWorkers"),
//        .package(path: "../DNSCore"),
//        .package(path: "../DNSCoreThreading"),
//        .package(path: "../DNSCrashNetwork"),
//        .package(path: "../DNSCrashSystems"),
//        .package(path: "../DNSCrashWorkers"),
//        .package(path: "../DNSProtocols"),
        .package(url: "https://github.com/Minitour/EasyNotificationBadge.git", .upToNextMajor(from: "1.2.5")),
        .package(url: "https://github.com/rajdeep/proton.git", .upToNextMajor(from: "0.8.35")),
        .package(url: "https://github.com/DoubleNodeOpen/SFSymbol", .upToNextMajor(from: "3.0.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "DNSForm",
            dependencies: [
                "AnimatedField", "DNSAppCore", "DNSBaseStage", "DNSBlankWorkers",
                "DNSCore", "DNSCoreThreading", "DNSCrashNetwork", "DNSCrashSystems",
                "DNSCrashWorkers", "DNSProtocols", "EasyNotificationBadge", "SFSymbol",
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
                .process("FieldTypeCells/DNSFormDetailPersonNameCell.xib"),
                .process("FieldTypeCells/DNSFormDetailPostalAddressCell.xib"),
                .process("FieldTypeCells/DNSFormDetailPostalAddressNicknameCell.xib"),
                .process("FieldTypeCells/DNSFormDetailPreviewButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailPricesFieldCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSaveButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSearchButtonCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSectionFooterCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSectionHeaderCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSpacerCell.xib"),
                .process("FieldTypeCells/DNSFormDetailSubHeaderView.xib"),
                .process("FieldTypeCells/DNSFormDetailTabSelectionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextEditorCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextFieldCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextSelectionCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextViewCell.xib"),
                .process("FieldTypeCells/DNSFormDetailTextViewLargeCell.xib"),
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
