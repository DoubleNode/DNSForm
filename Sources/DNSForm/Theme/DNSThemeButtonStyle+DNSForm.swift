//
//  DNSThemeButtonStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme

public extension DNSThemeButtonStyle {
    enum DNSForm {
        public static var `default` =
            DNSThemeButtonStyle(styleName: "default",
                                styleSetName: "DNSForm",
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
        public static var action =
            DNSThemeButtonStyle(styleName: "action",
                                styleSetName: "DNSForm",
                                titleColor: DNSUIColor.DNSForm.Button.Action.title,
                                titleFont: DNSUIFont.DNSForm.Button.Action.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.Action.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.Action.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.Action.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.Action.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Action.background,
                                border: DNSUIBorder.DNSForm.Button.action,
                                shadow: DNSUIShadow.DNSForm.Button.action,
                                tintColor: DNSUIColor.DNSForm.Button.Action.tint)
        public static var actionLeft =
            DNSThemeButtonStyle(styleName: "actionLeft",
                                styleSetName: "DNSForm",
                                titleColor: DNSUIColor.DNSForm.Button.ActionLeft.title,
                                titleFont: DNSUIFont.DNSForm.Button.ActionLeft.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.ActionLeft.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.ActionLeft.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.ActionLeft.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.ActionLeft.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.ActionLeft.background,
                                border: DNSUIBorder.DNSForm.Button.actionLeft,
                                shadow: DNSUIShadow.DNSForm.Button.actionLeft,
                                tintColor: DNSUIColor.DNSForm.Button.ActionLeft.tint)
        public static var actionRight =
            DNSThemeButtonStyle(styleName: "actionRight",
                                styleSetName: "DNSForm",
                                titleColor: DNSUIColor.DNSForm.Button.ActionRight.title,
                                titleFont: DNSUIFont.DNSForm.Button.ActionRight.title,
                                titleShadow: DNSUIShadow.DNSForm.Button.ActionRight.title,
                                subtitleColor: DNSUIColor.DNSForm.Button.ActionRight.subtitle,
                                subtitleFont: DNSUIFont.DNSForm.Button.ActionRight.subtitle,
                                subtitleShadow: DNSUIShadow.DNSForm.Button.ActionRight.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.ActionRight.background,
                                border: DNSUIBorder.DNSForm.Button.actionRight,
                                shadow: DNSUIShadow.DNSForm.Button.actionRight,
                                tintColor: DNSUIColor.DNSForm.Button.ActionRight.tint)
        public static var destructive =
            DNSThemeButtonStyle(styleName: "destructive",
                                styleSetName: "DNSForm",
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
                                styleSetName: "DNSForm",
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
                                styleSetName: "DNSForm",
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
                                styleSetName: "DNSForm",
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
