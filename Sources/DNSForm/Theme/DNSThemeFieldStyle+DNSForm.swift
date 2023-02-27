//
//  DNSThemeFieldStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore
import DNSCoreThreading

public extension DNSThemeFieldStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static func initThemes() {
            DNSThemeFieldStyle.initThemes(block: createThemes)
        }
        public static let createThemes: DNSBlock = {
            _ = Self.default
            _ = Self.datePicker
            _ = Self.numberPicker
            _ = Self.stringPicker
            _ = Self.textView
        }
        public static var `default` =
            DNSThemeFieldStyle(styleName: "default",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.Default.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.Default.counter,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.Default.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.Default.title,
                               alertPosition: .bottom,
                               invalidCharacters: "",
                               lineColor: DNSUIColor.DNSForm.Field.Default.line,
                               alertEnabled: DNSUIEnabled.DNSForm.Field.Default.alertEnabled,
                               alertFieldActive: DNSUIEnabled.DNSForm.Field.Default.alertFieldActive,
                               alertLineActive: DNSUIEnabled.DNSForm.Field.Default.alertLineActive,
                               alertTitleActive: DNSUIEnabled.DNSForm.Field.Default.alertTitleActive,
                               countDown: DNSUIEnabled.DNSForm.Field.Default.countDown,
                               counterAnimation: DNSUIEnabled.DNSForm.Field.Default.counterAnimation,
                               counterEnabled: DNSUIEnabled.DNSForm.Field.Default.counterEnabled,
                               titleAlwaysVisible: DNSUIEnabled.DNSForm.Field.Default.titleAlwaysVisible,
                               backgroundColor: DNSUIColor.DNSForm.Field.Default.background,
                               border: DNSUIBorder.DNSForm.Field.default,
                               shadow: DNSUIShadow.DNSForm.Field.default,
                               tintColor: DNSUIColor.DNSForm.Field.Default.tint)
        public static var datePicker =
            DNSThemeFieldStyle(styleName: "datePicker",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.DatePicker.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.DatePicker.counter,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.DatePicker.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.DatePicker.title,
                               alertPosition: .bottom,
                               invalidCharacters: "",
                               lineColor: DNSUIColor.DNSForm.Field.DatePicker.line,
                               pickerTextColor: DNSUIColor.DNSForm.Field.DatePicker.pickerText,
                               alertEnabled: DNSUIEnabled.DNSForm.Field.DatePicker.alertEnabled,
                               alertFieldActive: DNSUIEnabled.DNSForm.Field.DatePicker.alertFieldActive,
                               alertLineActive: DNSUIEnabled.DNSForm.Field.DatePicker.alertLineActive,
                               alertTitleActive: DNSUIEnabled.DNSForm.Field.DatePicker.alertTitleActive,
                               countDown: DNSUIEnabled.DNSForm.Field.DatePicker.countDown,
                               counterAnimation: DNSUIEnabled.DNSForm.Field.DatePicker.counterAnimation,
                               counterEnabled: DNSUIEnabled.DNSForm.Field.DatePicker.counterEnabled,
                               titleAlwaysVisible: DNSUIEnabled.DNSForm.Field.DatePicker.titleAlwaysVisible,
                               backgroundColor: DNSUIColor.DNSForm.Field.DatePicker.background,
                               border: DNSUIBorder.DNSForm.Field.datePicker,
                               shadow: DNSUIShadow.DNSForm.Field.datePicker,
                               tintColor: DNSUIColor.DNSForm.Field.DatePicker.tint)
        public static var numberPicker =
            DNSThemeFieldStyle(styleName: "numberPicker",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.NumberPicker.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.NumberPicker.counter,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.NumberPicker.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.NumberPicker.title,
                               alertPosition: .bottom,
                               invalidCharacters: "",
                               lineColor: DNSUIColor.DNSForm.Field.NumberPicker.line,
                               pickerTextColor: DNSUIColor.DNSForm.Field.NumberPicker.pickerText,
                               alertEnabled: DNSUIEnabled.DNSForm.Field.NumberPicker.alertEnabled,
                               alertFieldActive: DNSUIEnabled.DNSForm.Field.NumberPicker.alertFieldActive,
                               alertLineActive: DNSUIEnabled.DNSForm.Field.NumberPicker.alertLineActive,
                               alertTitleActive: DNSUIEnabled.DNSForm.Field.NumberPicker.alertTitleActive,
                               countDown: DNSUIEnabled.DNSForm.Field.NumberPicker.countDown,
                               counterAnimation: DNSUIEnabled.DNSForm.Field.NumberPicker.counterAnimation,
                               counterEnabled: DNSUIEnabled.DNSForm.Field.NumberPicker.counterEnabled,
                               titleAlwaysVisible: DNSUIEnabled.DNSForm.Field.NumberPicker.titleAlwaysVisible,
                               backgroundColor: DNSUIColor.DNSForm.Field.NumberPicker.background,
                               border: DNSUIBorder.DNSForm.Field.numberPicker,
                               shadow: DNSUIShadow.DNSForm.Field.numberPicker,
                               tintColor: DNSUIColor.DNSForm.Field.NumberPicker.tint)
        public static var stringPicker =
            DNSThemeFieldStyle(styleName: "stringPicker",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.StringPicker.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.StringPicker.counter,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.StringPicker.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.StringPicker.title,
                               alertPosition: .bottom,
                               invalidCharacters: "",
                               lineColor: DNSUIColor.DNSForm.Field.StringPicker.line,
                               pickerTextColor: DNSUIColor.DNSForm.Field.StringPicker.pickerText,
                               alertEnabled: DNSUIEnabled.DNSForm.Field.StringPicker.alertEnabled,
                               alertFieldActive: DNSUIEnabled.DNSForm.Field.StringPicker.alertFieldActive,
                               alertLineActive: DNSUIEnabled.DNSForm.Field.StringPicker.alertLineActive,
                               alertTitleActive: DNSUIEnabled.DNSForm.Field.StringPicker.alertTitleActive,
                               countDown: DNSUIEnabled.DNSForm.Field.StringPicker.countDown,
                               counterAnimation: DNSUIEnabled.DNSForm.Field.StringPicker.counterAnimation,
                               counterEnabled: DNSUIEnabled.DNSForm.Field.StringPicker.counterEnabled,
                               titleAlwaysVisible: DNSUIEnabled.DNSForm.Field.StringPicker.titleAlwaysVisible,
                               backgroundColor: DNSUIColor.DNSForm.Field.StringPicker.background,
                               border: DNSUIBorder.DNSForm.Field.stringPicker,
                               shadow: DNSUIShadow.DNSForm.Field.stringPicker,
                               tintColor: DNSUIColor.DNSForm.Field.StringPicker.tint)
        public static var textView =
            DNSThemeFieldStyle(styleName: "textView",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.counter,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.title,
                               alertPosition: .bottom,
                               invalidCharacters: "",
                               lineColor: DNSUIColor.DNSForm.Field.TextView.line,
                               alertEnabled: DNSUIEnabled.DNSForm.Field.TextView.alertEnabled,
                               alertFieldActive: DNSUIEnabled.DNSForm.Field.TextView.alertFieldActive,
                               alertLineActive: DNSUIEnabled.DNSForm.Field.TextView.alertLineActive,
                               alertTitleActive: DNSUIEnabled.DNSForm.Field.TextView.alertTitleActive,
                               countDown: DNSUIEnabled.DNSForm.Field.TextView.countDown,
                               counterAnimation: DNSUIEnabled.DNSForm.Field.TextView.counterAnimation,
                               counterEnabled: DNSUIEnabled.DNSForm.Field.TextView.counterEnabled,
                               titleAlwaysVisible: DNSUIEnabled.DNSForm.Field.TextView.titleAlwaysVisible,
                               backgroundColor: DNSUIColor.DNSForm.Field.TextView.background,
                               border: DNSUIBorder.DNSForm.Field.textView,
                               shadow: DNSUIShadow.DNSForm.Field.textView,
                               tintColor: DNSUIColor.DNSForm.Field.TextView.tint)
    }
}
