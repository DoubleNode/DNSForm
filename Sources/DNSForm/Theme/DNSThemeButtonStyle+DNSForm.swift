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
                                styleDescription: "DNSForm.default",
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
        public static var destructive =
            DNSThemeButtonStyle(styleName: "destructive",
                                styleDescription: "DNSForm.destructive",
                                titleColor: DNSUIColor.DNSForm.Button.Destructive.title,
                                titleFont: DNSUIFont.DNSForm.Button.Destructive.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.Destructive.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.Destructive.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.Destructive.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.Destructive.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Destructive.background,
                                border: DNSUIBorder.DNSForm.Button.destructive,
                                shadow: DNSUIShadow.DNSForm.Button.destructive,
                                tintColor: DNSUIColor.DNSForm.Button.Destructive.tint)
        public static var indexTab =
            DNSThemeButtonStyle(styleName: "indexTab",
                                styleDescription: "DNSForm.indexTab",
                                titleColor: DNSUIColor.DNSForm.Button.IndexTab.title,
                                titleFont: DNSUIFont.DNSForm.Button.IndexTab.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.IndexTab.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.IndexTab.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.IndexTab.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.IndexTab.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.IndexTab.background,
                                border: DNSUIBorder.DNSForm.Button.indexTab,
                                shadow: DNSUIShadow.DNSForm.Button.indexTab,
                                tintColor: DNSUIColor.DNSForm.Button.IndexTab.tint)
        public static var preview =
            DNSThemeButtonStyle(styleName: "preview",
                                styleDescription: "DNSForm.preview",
                                titleColor: DNSUIColor.DNSForm.Button.Preview.title,
                                titleFont: DNSUIFont.DNSForm.Button.Preview.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.Preview.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.Preview.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.Preview.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.Preview.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Preview.background,
                                border: DNSUIBorder.DNSForm.Button.preview,
                                shadow: DNSUIShadow.DNSForm.Button.preview,
                                tintColor: DNSUIColor.DNSForm.Button.Preview.tint)
        public static var square =
            DNSThemeButtonStyle(styleName: "square",
                                styleDescription: "DNSForm.square",
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
