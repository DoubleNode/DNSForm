//
//  DNSThemeFieldStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore

public extension DNSThemeFieldStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static var `default` =
            DNSThemeFieldStyle(styleName: "default",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.Default.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.Default.counter,
                               lineColor: DNSUIColor.DNSForm.Field.Default.line,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.Default.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.Default.title,
                               backgroundColor: DNSUIColor.DNSForm.Field.Default.background,
                               border: DNSUIBorder.DNSForm.Field.default,
                               shadow: DNSUIShadow.DNSForm.Field.default,
                               tintColor: DNSUIColor.DNSForm.Field.Default.tint)
            public static var textView =
            DNSThemeFieldStyle(styleName: "textView",
                               styleSetName: "DNSForm",
                               alertStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.alert,
                               counterStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.counter,
                               lineColor: DNSUIColor.DNSForm.Field.TextView.line,
                               textStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.text,
                               titleStyle: DNSThemeLabelStyle.DNSForm.Field.TextView.title,
                               backgroundColor: DNSUIColor.DNSForm.Field.TextView.background,
                               border: DNSUIBorder.DNSForm.Field.textView,
                               shadow: DNSUIShadow.DNSForm.Field.textView,
                               tintColor: DNSUIColor.DNSForm.Field.TextView.tint)
    }
}
