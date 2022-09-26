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
