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
        public static var `default` = DNSThemeFieldStyle(styleName: "default",
                                                         styleSetName: "DNSForm",
                                                         alertColor: DNSUIColor.DNSForm.Field.Default.alert,
                                                         alertFont: DNSUIFont.DNSForm.Field.Default.alert,
                                                         counterColor: DNSUIColor.DNSForm.Field.Default.counter,
                                                         counterFont: DNSUIFont.DNSForm.Field.Default.counter,
                                                         highlightColor: DNSUIColor.DNSForm.Field.Default.highlight,
                                                         lineColor: DNSUIColor.DNSForm.Field.Default.line,
                                                         textColor: DNSUIColor.DNSForm.Field.Default.text,
                                                         textFont: DNSUIFont.DNSForm.Field.Default.text,
                                                         titleColor: DNSUIColor.DNSForm.Field.Default.title,
                                                         titleFont: DNSUIFont.DNSForm.Field.Default.title,
                                                         backgroundColor: DNSUIColor.DNSForm.Field.Default.background,
                                                         border: DNSUIBorder.DNSForm.Field.default,
                                                         shadow: DNSUIShadow.DNSForm.Field.default,
                                                         tintColor: DNSUIColor.DNSForm.Field.Default.tint)
        public static var textView = DNSThemeFieldStyle(styleName: "textView",
                                                        styleSetName: "DNSForm",
                                                        alertColor: DNSUIColor.DNSForm.Field.TextView.alert,
                                                        alertFont: DNSUIFont.DNSForm.Field.TextView.alert,
                                                        counterColor: DNSUIColor.DNSForm.Field.TextView.counter,
                                                        counterFont: DNSUIFont.DNSForm.Field.TextView.counter,
                                                        highlightColor: DNSUIColor.DNSForm.Field.TextView.highlight,
                                                        lineColor: DNSUIColor.DNSForm.Field.TextView.line,
                                                        textColor: DNSUIColor.DNSForm.Field.TextView.text,
                                                        textFont: DNSUIFont.DNSForm.Field.TextView.text,
                                                        titleColor: DNSUIColor.DNSForm.Field.TextView.title,
                                                        titleFont: DNSUIFont.DNSForm.Field.TextView.title,
                                                        backgroundColor: DNSUIColor.DNSForm.Field.TextView.background,
                                                        border: DNSUIBorder.DNSForm.Field.textView,
                                                        shadow: DNSUIShadow.DNSForm.Field.textView,
                                                        tintColor: DNSUIColor.DNSForm.Field.TextView.tint)
    }
}
