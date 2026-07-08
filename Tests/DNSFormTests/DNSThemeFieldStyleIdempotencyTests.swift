//
//  DNSThemeFieldStyleIdempotencyTests.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSFormTests
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import XCTest
@testable import DNSForm
import DNSCore
import DNSThemeTypes
import UIKit

// Regression coverage for XDNS-0014.
//
// DNSUIAnimatedField.style.didSet (DNSThemeObjects/Theme/Controls/DNSUIAnimatedField.swift)
// re-enables an idempotency guard that had been commented out since the file's
// first commit:
//
//     guard oldValue != style else { return }
//
// `style` is declared as the base `DNSThemeStyle` type, so `!=` resolves to
// `DNSThemeStyle.!=(lhs:rhs:)`, which calls the `open` (dynamically dispatched)
// `isDiffFrom(_:)`. Because the runtime type held in `style` is actually
// `DNSThemeFieldStyle`, dispatch lands on `DNSThemeFieldStyle.isDiffFrom(_:)`,
// a VALUE-based compare that includes `titleAlwaysVisible`, `lineColor`,
// `textStyle`, `titleStyle`, etc. — not identity/reference comparison and not a
// `fullName`-only comparison.
//
// This suite proves that value-based behavior directly at the type each guard
// site actually uses (the `DNSThemeStyle`-typed `!=`), rather than only at the
// `DNSThemeFieldStyle`-typed `isDiffFrom`/`!=` already exercised indirectly by
// DNSThemeFieldStyleTitleVisibilityTests. In particular it locks in the
// regression check that matters for the 1.12.5 per-cell `titleAlwaysVisible`
// opt-out: two style copies that differ ONLY in `titleAlwaysVisible` must
// compare `!=` (guard does NOT skip the re-apply), while two value-identical
// copies must compare `==` (guard safely skips a redundant reconfigure without
// resigning the field's first responder).
final class DNSThemeFieldStyleIdempotencyTests: XCTestCase {

    // MARK: - 2a. Identical-value copies -> guard WOULD skip (isDiffFrom == false)

    func test_identicalValueCopy_comparesEqual_viaThemeStyleTypedOperator() throws {
        let base: DNSThemeStyle = DNSThemeFieldStyle.DNSForm.default
        let copy: DNSThemeStyle = DNSThemeFieldStyle(from: DNSThemeFieldStyle.DNSForm.default)

        XCTAssertFalse(base === copy, "Precondition: distinct instances, not the same reference")
        XCTAssertFalse(base != copy,
                       "An unmodified DNSThemeFieldStyle(from:) copy must compare == to its source via the " +
                       "DNSThemeStyle-typed operator — this is exactly what lets style.didSet's " +
                       "`guard oldValue != style else { return }` skip a redundant reconfigure")
        XCTAssertTrue(base == copy)
    }

    func test_identicalValueCopy_isDiffFromFalse_atFieldStyleLevel() throws {
        let base = DNSThemeFieldStyle.DNSForm.default
        let copy = DNSThemeFieldStyle(from: base)

        XCTAssertFalse(copy.isDiffFrom(base))
    }

    // MARK: - 2b. titleAlwaysVisible-only diff -> guard must NOT skip (KEY REGRESSION CHECK)

    func test_titleAlwaysVisibleOnlyDiff_comparesNotEqual_viaThemeStyleTypedOperator() throws {
        let base: DNSThemeStyle = DNSThemeFieldStyle.DNSForm.default
        let optedOut: DNSThemeStyle = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)

        XCTAssertTrue(base != optedOut,
                      "A copy differing ONLY in titleAlwaysVisible must compare != via the DNSThemeStyle-typed " +
                      "operator, or the 1.12.5 per-cell titleAlwaysVisible opt-out would be silently skipped " +
                      "by the style.didSet idempotency guard")
        XCTAssertFalse(base == optedOut)
    }

    func test_titleAlwaysVisibleOnlyDiff_isDiffFromTrue_bothDirections() throws {
        let optedIn = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)
        let optedOut = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)

        XCTAssertTrue(optedIn.isDiffFrom(optedOut))
        XCTAssertTrue(optedOut.isDiffFrom(optedIn), "isDiffFrom must be symmetric for a real value difference")
    }

    func test_reconfigureSequence_sameCellFlippingTitleAlwaysVisible_neverSkipsRealChange() throws {
        // Simulates a host reconfiguring the same AnimatedField cell across two
        // different rows/models: row A opts out, row B (or B reused as A) opts in.
        // Each transition must be seen as a diff by the guard so the field actually
        // restyles instead of keeping stale titleAlwaysVisible state on reuse.
        var oldValue: DNSThemeStyle = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(false)
        let newValue: DNSThemeStyle = DNSThemeFieldStyle.DNSForm.default.dnsFormTitleAlwaysVisible(true)

        XCTAssertTrue(oldValue != newValue, "Flipping titleAlwaysVisible on cell reuse must not be skipped")
        oldValue = newValue
        XCTAssertFalse(oldValue != newValue, "Reassigning the identical value a second time must be skipped")
    }

    // MARK: - 2c. lineColor-only diff -> guard must NOT skip

    func test_lineColorOnlyDiff_comparesNotEqual_viaThemeStyleTypedOperator() throws {
        let base: DNSThemeStyle = DNSThemeFieldStyle.DNSForm.default
        let recolored = DNSThemeFieldStyle(from: DNSThemeFieldStyle.DNSForm.default)
        recolored.lineColor = DNSUIColor(.systemRed)

        XCTAssertTrue(base != (recolored as DNSThemeStyle),
                      "A copy differing ONLY in lineColor must compare != via the DNSThemeStyle-typed operator")
    }

    func test_lineColorOnlyDiff_isDiffFromTrue_atFieldStyleLevel() throws {
        let base = DNSThemeFieldStyle.DNSForm.default
        let recolored = DNSThemeFieldStyle(from: base)
        recolored.lineColor = DNSUIColor(.systemRed)

        XCTAssertTrue(recolored.isDiffFrom(base))
        XCTAssertNotEqual(recolored.lineColor.normal, base.lineColor.normal, "Precondition: colors actually differ")
    }

    // MARK: - Sanity: everything else held constant except the one field under test

    func test_titleAlwaysVisibleOnlyDiff_leavesEveryOtherFieldEqual() throws {
        let base = DNSThemeFieldStyle.DNSForm.default
        let optedOut = base.dnsFormTitleAlwaysVisible(false)

        XCTAssertEqual(optedOut.lineColor.normal, base.lineColor.normal)
        XCTAssertEqual(optedOut.textStyle.color.normal, base.textStyle.color.normal)
        XCTAssertEqual(optedOut.titleStyle.color.normal, base.titleStyle.color.normal)
        XCTAssertNotEqual(optedOut.titleAlwaysVisible.normal, base.titleAlwaysVisible.normal)
    }
}
