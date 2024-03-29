//
//  DNSThemeButtonStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore
import DNSCoreThreading

public extension DNSThemeButtonStyle {
    enum DNSForm {
        public static func initThemes() {
            DNSThemeButtonStyle.initThemes(block: createThemes)
        }
        public static let createThemes: DNSBlock = {
            _ = Self.default
            _ = Self.action
            _ = Self.actionLeft
            _ = Self.actionRight
            _ = Self.clear
            _ = Self.destructive
            _ = Self.indexTab
            _ = Self.preview
            _ = Self.search
            _ = Self.square
            _ = Self.symbol
        }
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
        public static var clear =
            DNSThemeButtonStyle(styleName: "clear",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Clear.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Clear.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Clear.background,
                                border: DNSUIBorder.DNSForm.Button.clear,
                                shadow: DNSUIShadow.DNSForm.Button.clear,
                                tintColor: DNSUIColor.DNSForm.Button.Clear.tint)
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
        public static var search =
            DNSThemeButtonStyle(styleName: "search",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Search.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Search.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Search.background,
                                border: DNSUIBorder.DNSForm.Button.search,
                                shadow: DNSUIShadow.DNSForm.Button.search,
                                tintColor: DNSUIColor.DNSForm.Button.Search.tint)
        public static var square =
            DNSThemeButtonStyle(styleName: "square",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Square.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Square.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Square.background,
                                border: DNSUIBorder.DNSForm.Button.square,
                                shadow: DNSUIShadow.DNSForm.Button.square,
                                tintColor: DNSUIColor.DNSForm.Button.Square.tint)
        public static var symbol =
            DNSThemeButtonStyle(styleName: "symbol",
                                styleSetName: "DNSForm",
                                titleStyle: DNSThemeLabelStyle.DNSForm.Button.Symbol.title,
                                subtitleStyle: DNSThemeLabelStyle.DNSForm.Button.Symbol.subtitle,
                                backgroundColor: DNSUIColor.DNSForm.Button.Symbol.background,
                                border: DNSUIBorder.DNSForm.Button.symbol,
                                shadow: DNSUIShadow.DNSForm.Button.symbol,
                                tintColor: DNSUIColor.DNSForm.Button.Symbol.tint)
    }
}
