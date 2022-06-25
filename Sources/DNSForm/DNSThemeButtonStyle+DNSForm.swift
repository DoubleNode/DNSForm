//
//  DNSThemeButtonStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme

public extension DNSThemeButtonStyle {
    enum DNSForm {
        public static var `default` =
            DNSThemeButtonStyle(styleName: "default",
                                titleColor: DNSUIColor.DNSForm.Button.Default.title,
                                titleFont: DNSUIFont.DNSForm.Button.Default.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.Default.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.Default.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.Default.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.Default.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Default.background,
                                border: DNSUIBorder.DNSForm.Button.default,
                                shadow: DNSUIShadow.DNSForm.Button.default,
                                tintColor: DNSUIColor.DNSForm.Button.Default.tint)
        public static var square =
            DNSThemeButtonStyle(styleName: "square",
                                titleColor: DNSUIColor.DNSForm.Button.Square.title,
                                titleFont: DNSUIFont.DNSForm.Button.Square.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.Square.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.Square.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.Square.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.Square.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Square.background,
                                border: DNSUIBorder.DNSForm.Button.square,
                                shadow: DNSUIShadow.DNSForm.Button.square,
                                tintColor: DNSUIColor.DNSForm.Button.Square.tint)
    }
}
