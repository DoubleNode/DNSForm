# DNSForm Release Notes

All notable changes to DNSForm are documented here. Versions follow [Semantic Versioning](https://semver.org/).

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
