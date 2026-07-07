# DNSForm Release Notes

All notable changes to DNSForm are documented here. Versions follow [Semantic Versioning](https://semver.org/).

---

## 1.12.5 — 2026-07-07

**Release Type**
-   BUGFIX

**Issues Resolved**
-   XDNS-0012 — Completes the field-cell visibility fix per the ratified design. The field line/underline color for the default, datePicker, numberPicker, and stringPicker styles was still the non-adaptive `UIColor.darkText` (invisible on dark/clear backgrounds); it is now the adaptive `UIColor.label`. Additionally, each title-bearing field cell can now opt out of the always-visible floating title per surface, rather than relying solely on the global style default.

**New Features**
-   Per-cell `titleAlwaysVisible: Bool = true` on the `Data` struct of every title-bearing field cell (text, textView, imageUrl, dateTime, appAction, and 12 more). Defaults to `true` (unchanged behavior); set `false` to hide the floating title until focus for that specific cell.

**Technical Improvements**
-   Replaced `UIColor.darkText` with adaptive `UIColor.label` across all `Field.<Cell>.Line` color blocks (normal/focused/highlighted/selected).
-   Added an internal `DNSThemeFieldStyle.dnsFormTitleAlwaysVisible(_:)` helper that returns a per-instance deep copy (via `DNSThemeFieldStyle(from:)`) with `titleAlwaysVisible` overridden — so the per-cell setting survives state-driven `updateForState()` rebuilds and never mutates the shared static style singleton or the theme-style registry.
-   Added `DNSThemeFieldStyleTitleVisibilityTests` (15 tests) covering copy independence (no shared-static corruption), registry non-pollution, default preservation, and guard-pattern value-equality semantics.

**Known Problems**
-   None identified in this release.

---

## 1.12.4 — 2026-07-07

**Release Type**
-   BUGFIX

**Issues Resolved**
-   XDNS-0012 — DNSForm `.DNSForm.default` text-field cells rendered no floating title and invisible/non-editable text under AnimatedField 3.2.x. Root cause: AnimatedField 3.1.1+ routes all title/text rendering through `format.didSet` / `setupTitle()`, so the field's appearance is driven entirely by the theme style values — and the shipped `.DNSForm.default` style used `titleAlwaysVisible = false` (title hidden until focus) and a non-adaptive `UIColor.darkText` text/title color (invisible on dark/clear backgrounds).

**New Features**
-   NONE

**Technical Improvements**
-   `DNSUIEnabled.DNSForm.Field.Default.titleAlwaysVisible` changed `false` → `true`, so the floating title is always visible for the default field cell.
-   Replaced non-adaptive `UIColor.darkText` with the adaptive system `UIColor.label` across every `Field.<Cell>.{Text,Title}.Text` color block (default plus the datePicker, numberPicker, stringPicker, and textView field cells), so field title and text render correctly in both light and dark appearances. ImageUrl / DateTime / AppAction cells inherit `.DNSForm.default` and are covered by the same change.
-   Aligned the `AnimatedField` dependency to `.upToNextMajor(from: "3.2.2")` (matching downstream apps) and validated the fix against AnimatedField 3.2.2. No AnimatedField bridge was added — the existing DNS style path already assigns `format`.
-   Added `DNSThemeFieldStyleColorTests` (8 regression tests) locking in `titleAlwaysVisible == true` and adaptive `UIColor.label` title/text colors for all `.DNSForm` field styles.

**Known Problems**
-   None identified in this release.

---
