//
//  DNSThemeFieldStyleColorTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSFormTests
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
@testable import DNSForm
import DNSThemeTypes
import UIKit

// Regression coverage for XDNS-0012.
//
// Prior to this fix, every `.DNSForm` field style set `titleAlwaysVisible` to
// `false` (or, for `.default`, left the field title hidden until the user
// began typing) and painted field titles/text with the fixed `UIColor.darkText`,
// which is invisible/low-contrast in Dark Mode because it never adapts.
//
// The fix (see Sources/DNSForm/Theme/DNSUIEnabled+DNSForm.swift and
// Sources/DNSForm/Theme/UIColor+DNSForm.swift) makes `titleAlwaysVisible.normal`
// `true` and routes `Field.<Cell>.Text.Text` / `Field.<Cell>.Title.Text` through
// the adaptive `UIColor.label` instead. AnimatedField 3.2.2's
// `AnimatedField.updateForState(using:)` / `dnsApply(_:)` (in DNSThemeObjects)
// read `style.titleAlwaysVisible.normal`, `style.titleStyle.color.normal`, and
// `style.textStyle.color.normal` directly, so locking these values in here
// locks in the actual on-screen fix without needing to stand up a live
// AnimatedField/UIView instance (which is `@MainActor`-isolated as of
// AnimatedField 3.2.2).
final class DNSThemeFieldStyleColorTests: XCTestCase {

    private func assertTitleAlwaysVisibleAndAdaptiveColors(_ style: DNSThemeFieldStyle,
                                                             styleName: String,
                                                             file: StaticString = #filePath,
                                                             line: UInt = #line) {
        XCTAssertTrue(style.titleAlwaysVisible.normal,
                       "\(styleName): titleAlwaysVisible.normal should be true so field titles remain visible",
                       file: file, line: line)
        XCTAssertEqual(style.titleStyle.color.normal, UIColor.label,
                        "\(styleName): titleStyle.color.normal should resolve to the adaptive UIColor.label",
                        file: file, line: line)
        XCTAssertEqual(style.textStyle.color.normal, UIColor.label,
                        "\(styleName): textStyle.color.normal should resolve to the adaptive UIColor.label",
                        file: file, line: line)
        XCTAssertNotEqual(style.titleStyle.color.normal, UIColor.darkText,
                           "\(styleName): titleStyle.color.normal must not still resolve to the fixed UIColor.darkText",
                           file: file, line: line)
        XCTAssertNotEqual(style.textStyle.color.normal, UIColor.darkText,
                           "\(styleName): textStyle.color.normal must not still resolve to the fixed UIColor.darkText",
                           file: file, line: line)
    }

    // MARK: - Field.Default

    func test_defaultFieldStyle_titleAlwaysVisibleAndColorsAreAdaptive() {
        assertTitleAlwaysVisibleAndAdaptiveColors(DNSThemeFieldStyle.DNSForm.default, styleName: "default")
    }

    // MARK: - Field.DatePicker

    func test_datePickerFieldStyle_titleAlwaysVisibleAndColorsAreAdaptive() {
        assertTitleAlwaysVisibleAndAdaptiveColors(DNSThemeFieldStyle.DNSForm.datePicker, styleName: "datePicker")
    }

    // MARK: - Field.NumberPicker

    func test_numberPickerFieldStyle_titleAlwaysVisibleAndColorsAreAdaptive() {
        assertTitleAlwaysVisibleAndAdaptiveColors(DNSThemeFieldStyle.DNSForm.numberPicker, styleName: "numberPicker")
    }

    // MARK: - Field.StringPicker

    func test_stringPickerFieldStyle_titleAlwaysVisibleAndColorsAreAdaptive() {
        assertTitleAlwaysVisibleAndAdaptiveColors(DNSThemeFieldStyle.DNSForm.stringPicker, styleName: "stringPicker")
    }

    // MARK: - Field.TextView

    func test_textViewFieldStyle_titleAlwaysVisibleAndColorsAreAdaptive() {
        assertTitleAlwaysVisibleAndAdaptiveColors(DNSThemeFieldStyle.DNSForm.textView, styleName: "textView")
    }

    // MARK: - ImageUrl / DateTime / AppAction cells

    // These field cell types don't have their own DNSThemeFieldStyle entries; they
    // default to `.DNSForm.default`, so the `default` coverage above already locks
    // in their title/text colors and title visibility. These tests confirm the
    // mapping itself hasn't regressed to some other, unverified style.
    func test_imageUrlCell_defaultsToFieldDefaultStyle() {
        let data = DNSFormDetailImageUrlCell.Data(field: "imageUrlField", label: "Image URL",
                                                   languageCode: "en", placeholder: "Enter URL",
                                                   readonly: false, required: false)
        XCTAssertEqual(data.style.name, DNSThemeFieldStyle.DNSForm.default.name)
        assertTitleAlwaysVisibleAndAdaptiveColors(data.style, styleName: "imageUrl (default)")
    }

    func test_dateTimeCell_defaultsToFieldDefaultStyle() {
        let data = DNSFormDetailDateTimeCell.Data(date: Date(), dateLabel: "Date", datePlaceholder: "Select date",
                                                    field: "dateTimeField", languageCode: "en",
                                                    readonly: false, required: false,
                                                    timeLabel: "Time", timePlaceholder: "Select time")
        XCTAssertEqual(data.style.name, DNSThemeFieldStyle.DNSForm.default.name)
        assertTitleAlwaysVisibleAndAdaptiveColors(data.style, styleName: "dateTime (default)")
    }

    func test_appActionCell_defaultsToFieldDefaultStyle() {
        let data = DNSFormDetailAppActionCell.Data(field: "appActionField", label: "Action",
                                                     languageCode: "en", placeholder: "Select action",
                                                     readonly: false, required: false, selectMode: false)
        XCTAssertEqual(data.style.name, DNSThemeFieldStyle.DNSForm.default.name)
        assertTitleAlwaysVisibleAndAdaptiveColors(data.style, styleName: "appAction (default)")
    }
}
