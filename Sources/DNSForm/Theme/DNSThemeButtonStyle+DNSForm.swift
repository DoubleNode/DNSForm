//
//  DNSThemeButtonStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore

public extension DNSThemeButtonStyle {
    enum DNSForm {
        public static var `default` =
            DNSThemeButtonStyle(styleName: "default",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Default.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Default.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Default.background,
                                border: DNSUIBorder.DNSForm.Button.default,
                                shadow: DNSUIShadow.DNSForm.Button.default,
                                tintColor: DNSUIColor.DNSForm.Button.Default.tint)
        public static var action =
            DNSThemeButtonStyle(styleName: "action",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Action.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Action.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Action.background,
                                border: DNSUIBorder.DNSForm.Button.action,
                                shadow: DNSUIShadow.DNSForm.Button.action,
                                tintColor: DNSUIColor.DNSForm.Button.Action.tint)
        public static var actionLeft =
            DNSThemeButtonStyle(styleName: "actionLeft",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.ActionLeft.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.ActionLeft.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.ActionLeft.background,
                                border: DNSUIBorder.DNSForm.Button.actionLeft,
                                shadow: DNSUIShadow.DNSForm.Button.actionLeft,
                                tintColor: DNSUIColor.DNSForm.Button.ActionLeft.tint)
        public static var actionRight =
            DNSThemeButtonStyle(styleName: "actionRight",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.ActionRight.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.ActionRight.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.ActionRight.background,
                                border: DNSUIBorder.DNSForm.Button.actionRight,
                                shadow: DNSUIShadow.DNSForm.Button.actionRight,
                                tintColor: DNSUIColor.DNSForm.Button.ActionRight.tint)
        public static var destructive =
            DNSThemeButtonStyle(styleName: "destructive",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Destructive.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Destructive.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Destructive.background,
                                border: DNSUIBorder.DNSForm.Button.destructive,
                                shadow: DNSUIShadow.DNSForm.Button.destructive,
                                tintColor: DNSUIColor.DNSForm.Button.Destructive.tint)
        public static var indexTab =
            DNSThemeButtonStyle(styleName: "indexTab",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.IndexTab.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.IndexTab.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.IndexTab.background,
                                border: DNSUIBorder.DNSForm.Button.indexTab,
                                shadow: DNSUIShadow.DNSForm.Button.indexTab,
                                tintColor: DNSUIColor.DNSForm.Button.IndexTab.tint)
        public static var preview =
            DNSThemeButtonStyle(styleName: "preview",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Preview.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Preview.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Preview.background,
                                border: DNSUIBorder.DNSForm.Button.preview,
                                shadow: DNSUIShadow.DNSForm.Button.preview,
                                tintColor: DNSUIColor.DNSForm.Button.Preview.tint)
        public static var square =
            DNSThemeButtonStyle(styleName: "square",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Square.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Square.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Square.background,
                                border: DNSUIBorder.DNSForm.Button.square,
                                shadow: DNSUIShadow.DNSForm.Button.square,
                                tintColor: DNSUIColor.DNSForm.Button.Square.tint)
    }
}
