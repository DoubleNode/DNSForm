//
//  DNSThemeFieldStyleTitleVisibilityTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSFormTests
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
@testable import DNSForm
import DNSThemeTypes
import UIKit

// Regression coverage for XDNS-0012 (follow-up patch, 1.12.5).
//
// `DNSThemeFieldStyle` is an `open class` (reference type), and the shared
// static styles (`.DNSForm.default`, `.DNSForm.datePicker`, …) are singletons
// registered in `DNSThemeFieldStyle.themeStyles`. Every field cell in
// FieldTypeCells previously assigned that SAME shared instance directly to its
// `AnimatedField.style`. The per-cell `titleAlwaysVisible` opt-out
// (`dnsFormTitleAlwaysVisible(_:)` in Sources/DNSForm/Theme/DNSThemeFieldStyle+DNSForm.swift)
// introduces a `DNSThemeFieldStyle(from:)` deep copy before mutating
// `titleAlwaysVisible`, specifically so that mutation cannot corrupt the shared
// singleton (or every other cell/screen that also points at it).
//
// These tests lock in that independence at the value level, since standing up a
// live AnimatedField/UIView requires storyboard/@MainActor machinery (see
// DNSThemeFieldStyleColorTests.swift for the same tradeoff already accepted for
// the 1.12.4 color fix).
final class DNSThemeFieldStyleTitleVisibilityTests: XCTestCase {

    // MARK: - 3a. Independence / no shared-state corruption (highest risk)

    func test_dnsFormTitleAlwaysVisible_false_doesNotCorruptSharedDefaultStatic() throws {
        // Sanity-check the known baseline before mutating anything.
        XCTAssertTrue(DNSThemeFieldStyle.DNSForm.default.titleAlwaysVisible.normal,
                      "Precondition: .DNSForm.default.titleAlwaysVisible.normal should start true")

        let overridden = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)

        XCTAssertFalse(overridden.titleAlwaysVisible.normal,
                       "The returned copy should reflect the requested opt-out (false)")
        XCTAssertTrue(DNSThemeFieldStyle.DNSForm.default.titleAlwaysVisible.normal,
                      "The shared static .DNSForm.default must be unaffected by mutating the copy")
    }

    func test_dnsFormTitleAlwaysVisible_returnsIndependentReference() throws {
        let base = DNSThemeFieldStyle.DNSForm.default
        let overridden = base.dnsFormTitleAlwaysVisible(false)

        XCTAssertFalse(overridden === base,
                       "dnsFormTitleAlwaysVisible must return a distinct instance, not the same reference")
    }

    func test_dnsFormTitleAlwaysVisible_multipleCopies_areMutuallyIndependent() throws {
        let base = DNSThemeFieldStyle.DNSForm.default

        let copyOff = base.dnsFormTitleAlwaysVisible(false)
        let copyOn = base.dnsFormTitleAlwaysVisible(true)

        XCTAssertFalse(copyOff.titleAlwaysVisible.normal)
        XCTAssertTrue(copyOn.titleAlwaysVisible.normal)
        // Mutating/creating copyOn after copyOff must not have retroactively
        // changed copyOff (would indicate accidental shared storage).
        XCTAssertFalse(copyOff.titleAlwaysVisible.normal,
                       "copyOff must remain false even after a sibling copy was created")
        XCTAssertFalse(copyOff === copyOn,
                       "Two independent calls must not alias the same instance")
        // ...and the shared static is still untouched by either.
        XCTAssertTrue(DNSThemeFieldStyle.DNSForm.default.titleAlwaysVisible.normal)
    }

    // MARK: - 3b. Default preserved (opt-in to true is a no-op behaviorally)

    func test_dnsFormTitleAlwaysVisible_true_preservesDefaultBehavior() throws {
        let copy = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)

        XCTAssertTrue(copy.titleAlwaysVisible.normal)
        // DNSUIEnabled(_ normal:) defaults every state to `normal` when the
        // other states aren't specified, so all states should track together.
        XCTAssertTrue(copy.titleAlwaysVisible.disabled)
        XCTAssertTrue(copy.titleAlwaysVisible.focused)
        XCTAssertTrue(copy.titleAlwaysVisible.highlighted)
        XCTAssertTrue(copy.titleAlwaysVisible.selected)
    }

    func test_dnsFormTitleAlwaysVisible_false_setsAllUIEnabledStates() throws {
        let copy = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)

        XCTAssertFalse(copy.titleAlwaysVisible.normal)
        XCTAssertFalse(copy.titleAlwaysVisible.disabled)
        XCTAssertFalse(copy.titleAlwaysVisible.focused)
        XCTAssertFalse(copy.titleAlwaysVisible.highlighted)
        XCTAssertFalse(copy.titleAlwaysVisible.selected)
    }

    // MARK: - 3c. themeStyles registry not polluted by per-cell copies

    func test_dnsFormTitleAlwaysVisible_doesNotPolluteThemeStylesRegistry() throws {
        let countBefore = DNSThemeFieldStyle.themeStyles.count
        let defaultRefBefore = DNSThemeFieldStyle.themeStyles["default"]

        // Simulate several cells independently opting in/out, as FieldTypeCells does.
        _ = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)
        _ = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)
        _ = DNSThemeFieldStyle.DNSForm.datePicker.dnsFormTitleAlwaysVisible(false)
        _ = DNSThemeFieldStyle.DNSForm.textView.dnsFormTitleAlwaysVisible(false)

        XCTAssertEqual(DNSThemeFieldStyle.themeStyles.count, countBefore,
                       "dnsFormTitleAlwaysVisible copies must not register themselves in the shared themeStyles cache " +
                       "(init(from:) does not call utilityUpdateCache(), unlike the styleName-based initializers)")
        XCTAssertTrue(DNSThemeFieldStyle.themeStyles["default"] === defaultRefBefore,
                     "The registry's 'default' entry must still be the original singleton instance")
    }

    // MARK: - Isolation holds across every .DNSForm base style

    func test_dnsFormTitleAlwaysVisible_isolationAcrossAllBaseStyles() throws {
        let styles: [(name: String, style: DNSThemeFieldStyle)] = [
            ("default", DNSThemeFieldStyle.DNSForm.default),
            ("datePicker", DNSThemeFieldStyle.DNSForm.datePicker),
            ("numberPicker", DNSThemeFieldStyle.DNSForm.numberPicker),
            ("stringPicker", DNSThemeFieldStyle.DNSForm.stringPicker),
            ("textView", DNSThemeFieldStyle.DNSForm.textView),
        ]

        for (name, style) in styles {
            let originalValue = style.titleAlwaysVisible.normal
            let flipped = style.dnsFormTitleAlwaysVisible(!originalValue)

            XCTAssertEqual(flipped.titleAlwaysVisible.normal, !originalValue,
                           "\(name): copy should reflect the flipped value")
            XCTAssertEqual(style.titleAlwaysVisible.normal, originalValue,
                           "\(name): shared base style must be unchanged after copying")
        }
    }

    // MARK: - Copy preserves every other style property (opt-out is scoped to titleAlwaysVisible only)

    func test_dnsFormTitleAlwaysVisible_preservesOtherStyleProperties() throws {
        let base = DNSThemeFieldStyle.DNSForm.default
        let overridden = base.dnsFormTitleAlwaysVisible(false)

        XCTAssertEqual(overridden.name, base.name)
        XCTAssertEqual(overridden.setName, base.setName)
        XCTAssertEqual(overridden.titleStyle.color.normal, base.titleStyle.color.normal)
        XCTAssertEqual(overridden.textStyle.color.normal, base.textStyle.color.normal)
        XCTAssertEqual(overridden.lineColor.normal, base.lineColor.normal)
        XCTAssertEqual(overridden.alertPosition, base.alertPosition)
        // Only titleAlwaysVisible itself should actually differ.
        XCTAssertNotEqual(overridden.titleAlwaysVisible.normal, base.titleAlwaysVisible.normal)
    }

    // MARK: - 2. Per-cell mechanism as exercised by FieldTypeCells configure() paths

    func test_effectiveStyle_forTextFieldCell_defaultsToTitleAlwaysVisibleTrue() throws {
        let data = DNSFormDetailTextFieldCell.Data(
            field: "testField", label: "Test", languageCode: "en", placeholder: "Enter text",
            readonly: false, required: false, text: "", type: .text)

        XCTAssertTrue(data.titleAlwaysVisible, "Data.titleAlwaysVisible should default to true (unchanged behavior)")

        let effectiveStyle = data.style.dnsFormTitleAlwaysVisible(data.titleAlwaysVisible)
        XCTAssertTrue(effectiveStyle.titleAlwaysVisible.normal)
    }

    func test_effectiveStyle_forTextFieldCell_honorsExplicitOptOut() throws {
        var data = DNSFormDetailTextFieldCell.Data(
            field: "testField", label: "Test", languageCode: "en", placeholder: "Enter text",
            readonly: false, required: false, text: "", type: .text)
        data.titleAlwaysVisible = false

        let effectiveStyle = data.style.dnsFormTitleAlwaysVisible(data.titleAlwaysVisible)

        XCTAssertFalse(effectiveStyle.titleAlwaysVisible.normal,
                       "Opting a cell out must produce an effective style with titleAlwaysVisible.normal == false")
        // ...and must not have touched the shared style this cell's data still points at.
        XCTAssertTrue(data.style.titleAlwaysVisible.normal,
                      "data.style (the shared .DNSForm.default) must remain untouched by the per-cell opt-out")
    }

    func test_effectiveStyle_forDateCell_honorsExplicitOptOut() throws {
        var data = DNSFormDetailDateCell.Data(
            date: Date(), dateLabel: "Date", datePlaceholder: "Choose a date",
            field: "dateField", languageCode: "en", readonly: false, required: false)
        data.titleAlwaysVisible = false

        let effectiveStyle = data.style.dnsFormTitleAlwaysVisible(data.titleAlwaysVisible)

        XCTAssertFalse(effectiveStyle.titleAlwaysVisible.normal)
        XCTAssertTrue(DNSThemeFieldStyle.DNSForm.default.titleAlwaysVisible.normal,
                      "Shared static must remain true after DateCell opts out")
    }

    func test_effectiveStyle_forPersonNameCell_sharedAcrossAllSubfields() throws {
        // PersonNameCell has one style/titleAlwaysVisible shared across 4 subfields
        // (family/given/middle/nickname), all deriving from the same effectiveStyle.
        var data = DNSFormDetailPersonNameCell.Data(
            field: "nameField", labels: [:], placeholders: [:],
            readonly: false, required: false, value: PersonNameComponents())
        data.titleAlwaysVisible = false

        let effectiveStyle = data.style.dnsFormTitleAlwaysVisible(data.titleAlwaysVisible)

        XCTAssertFalse(effectiveStyle.titleAlwaysVisible.normal)
        XCTAssertTrue(DNSThemeFieldStyle.DNSForm.default.titleAlwaysVisible.normal)
    }

    func test_effectiveStyle_forPricesFieldCell_nestedFieldData_honorsExplicitOptOut() throws {
        // PricesFieldCell nests titleAlwaysVisible inside Data.FieldData, not Data itself.
        var fieldData1 = DNSFormDetailPricesFieldCell.Data.FieldData(
            field: "price1", label: "Price 1", languageCode: "en", placeholder: "0.00",
            readonly: false, required: false, price: 1.99)
        fieldData1.titleAlwaysVisible = false
        let fieldData2 = DNSFormDetailPricesFieldCell.Data.FieldData(
            field: "price2", label: "Price 2", languageCode: "en", placeholder: "0.00",
            readonly: false, required: false, price: 2.99)

        XCTAssertTrue(fieldData2.titleAlwaysVisible, "fieldData2 should keep the true default")

        let effectiveStyle1 = fieldData1.style.dnsFormTitleAlwaysVisible(fieldData1.titleAlwaysVisible)
        let effectiveStyle2 = fieldData2.style.dnsFormTitleAlwaysVisible(fieldData2.titleAlwaysVisible)

        XCTAssertFalse(effectiveStyle1.titleAlwaysVisible.normal)
        XCTAssertTrue(effectiveStyle2.titleAlwaysVisible.normal)
        // The two FieldData slots must not have influenced one another.
        XCTAssertNotEqual(effectiveStyle1.titleAlwaysVisible.normal, effectiveStyle2.titleAlwaysVisible.normal)
    }

    // MARK: - 4. Guard-pattern (`if field.style != effectiveStyle`) sanity

    func test_effectiveStyle_valueEquality_acrossIndependentCopiesWithSameSetting() throws {
        // Two separately-created copies with the *same* requested value must compare
        // equal (value-based isDiffFrom), which is what lets the `if field.style !=
        // effectiveStyle` guard in cells like PersonNameCell/PostalAddressCell skip a
        // redundant re-apply on reconfigure, rather than always seeing "different"
        // just because they're different object instances.
        let first = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)
        let second = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)

        XCTAssertFalse(first === second, "Precondition: these are distinct instances")
        XCTAssertFalse(first.isDiffFrom(second),
                       "Two independent copies with identical values must be value-equal for the guard to no-op")
        XCTAssertTrue(first == second)
    }

    func test_effectiveStyle_valueEquality_detectsRealChange() throws {
        // The guard must still detect an actual change in titleAlwaysVisible so a
        // cell that flips its opt-out on reconfigure re-applies the new style.
        let optedIn = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)
        let optedOut = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)

        XCTAssertTrue(optedIn.isDiffFrom(optedOut),
                      "A real change in titleAlwaysVisible must be detected as a diff, not silently skipped")
        XCTAssertTrue(optedIn != optedOut)
    }
}
