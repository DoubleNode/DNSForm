//
//  DNSThemeLabelStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore
import DNSCoreThreading

public extension DNSThemeLabelStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static func initThemes() {
            DNSThemeLabelStyle.initThemes(block: createThemes)
        }
        public static let createThemes: DNSBlock = {
            _ = Self.default
            _ = Self.body
            _ = Self.bodyTight
            _ = Self.field
            _ = Self.fieldHeader
            _ = Self.header
            _ = Self.sectionFrameTitle
            _ = Self.tag
            _ = Self.title
            _ = Self.Button.Default.subtitle
            _ = Self.Button.Default.title
            _ = Self.Button.Action.subtitle
            _ = Self.Button.Action.title
            _ = Self.Button.ActionLeft.subtitle
            _ = Self.Button.ActionLeft.title
            _ = Self.Button.ActionRight.subtitle
            _ = Self.Button.ActionRight.title
            _ = Self.Button.Clear.subtitle
            _ = Self.Button.Clear.title
            _ = Self.Button.Destructive.subtitle
            _ = Self.Button.Destructive.title
            _ = Self.Button.IndexTab.subtitle
            _ = Self.Button.IndexTab.title
            _ = Self.Button.Preview.subtitle
            _ = Self.Button.Preview.title
            _ = Self.Button.Search.subtitle
            _ = Self.Button.Search.title
            _ = Self.Button.Square.subtitle
            _ = Self.Button.Square.title
            _ = Self.Field.Default.alert
            _ = Self.Field.Default.counter
            _ = Self.Field.Default.text
            _ = Self.Field.Default.title
            _ = Self.Field.TextView.alert
            _ = Self.Field.TextView.counter
            _ = Self.Field.TextView.text
            _ = Self.Field.TextView.title
        }
        public static var `default` = DNSThemeLabelStyle(styleName: "default",
                                                         styleSetName: "DNSForm",
                                                         color: DNSUIColor.DNSForm.Label.default,
                                                         font: DNSUIFont.DNSForm.Label.default)
        public static var body = DNSThemeLabelStyle(styleName: "body",
                                                    styleSetName: "DNSForm",
                                                    color: DNSUIColor.DNSForm.Label.body,
                                                    font: DNSUIFont.DNSForm.Label.body,
                                                    zeplinLineHeight: 21)
        public static var bodyTight = DNSThemeLabelStyle(styleName: "bodyTight",
                                                         styleSetName: "DNSForm",
                                                         color: DNSUIColor.DNSForm.Label.bodyTight,
                                                         font: DNSUIFont.DNSForm.Label.bodyTight,
                                                         zeplinLineHeight: 14)
        public static var field = DNSThemeLabelStyle(styleName: "field",
                                                     styleSetName: "DNSForm",
                                                     color: DNSUIColor.DNSForm.Label.field,
                                                     font: DNSUIFont.DNSForm.Label.field)
        public static var fieldHeader = DNSThemeLabelStyle(styleName: "fieldHeader",
                                                           styleSetName: "DNSForm",
                                                           color: DNSUIColor.DNSForm.Label.fieldHeader,
                                                           font: DNSUIFont.DNSForm.Label.fieldHeader)
        public static var header = DNSThemeLabelStyle(styleName: "header",
                                                      styleSetName: "DNSForm",
                                                      color: DNSUIColor.DNSForm.Label.header,
                                                      font: DNSUIFont.DNSForm.Label.header)
        public static var sectionFrameTitle =
            DNSThemeLabelStyle(styleName: "sectionFrameTitle",
                               styleSetName: "DNSForm",
                               color: DNSUIColor.DNSForm.Label.sectionFrameTitle,
                               font: DNSUIFont.DNSForm.Label.sectionFrameTitle)
        public static var tag = DNSThemeLabelStyle(styleName: "tag",
                                                   styleSetName: "DNSForm",
                                                   color: DNSUIColor.DNSForm.Label.tag,
                                                   font: DNSUIFont.DNSForm.Label.tag)
        public static var title = DNSThemeLabelStyle(styleName: "title",
                                                     styleSetName: "DNSForm",
                                                     color: DNSUIColor.DNSForm.Label.title,
                                                     font: DNSUIFont.DNSForm.Label.title)
        public enum Button {
            public enum Default {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Default.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Default.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Default.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Default.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Default.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Default.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Default.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Default.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Default.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Default.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Default.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Default.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Default.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Default.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Default.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Default.Title.tint)
            }
            public enum Action {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Action.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Action.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Action.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Action.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Action.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Action.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Action.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Action.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Action.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Action.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Action.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Action.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Action.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Action.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Action.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Action.Title.tint)
            }
            public enum ActionLeft {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.ActionLeft.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.ActionLeft.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.ActionLeft.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.ActionLeft.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.ActionLeft.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.ActionLeft.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.ActionLeft.Title.text,
                                       font: DNSUIFont.DNSForm.Button.ActionLeft.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.ActionLeft.title,
                                       shadow: DNSUIShadow.DNSForm.Button.ActionLeft.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.ActionLeft.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.ActionLeft.title,
                                       tintColor: DNSUIColor.DNSForm.Button.ActionLeft.Title.tint)
            }
            public enum ActionRight {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.ActionRight.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.ActionRight.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.ActionRight.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.ActionRight.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.ActionRight.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.ActionRight.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.ActionRight.Title.text,
                                       font: DNSUIFont.DNSForm.Button.ActionRight.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.ActionRight.title,
                                       shadow: DNSUIShadow.DNSForm.Button.ActionRight.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.ActionRight.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.ActionRight.title,
                                       tintColor: DNSUIColor.DNSForm.Button.ActionRight.Title.tint)
            }
            public enum Clear {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Clear.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Clear.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Clear.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Clear.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Clear.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Clear.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Clear.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Clear.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Clear.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Clear.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Clear.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Clear.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Clear.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Clear.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Clear.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Clear.Title.tint)
            }
            public enum Destructive {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Destructive.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Destructive.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Destructive.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Destructive.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Destructive.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Destructive.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Destructive.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Destructive.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Destructive.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Destructive.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Destructive.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Destructive.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Destructive.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Destructive.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Destructive.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Destructive.Title.tint)
            }
            public enum IndexTab {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.IndexTab.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.IndexTab.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.IndexTab.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.IndexTab.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.IndexTab.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.IndexTab.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.IndexTab.Title.text,
                                       font: DNSUIFont.DNSForm.Button.IndexTab.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.IndexTab.title,
                                       shadow: DNSUIShadow.DNSForm.Button.IndexTab.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.IndexTab.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.IndexTab.title,
                                       tintColor: DNSUIColor.DNSForm.Button.IndexTab.Title.tint)
            }
            public enum Preview {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Preview.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Preview.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Preview.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Preview.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Preview.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Preview.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Preview.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Preview.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Preview.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Preview.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Preview.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Preview.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Preview.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Preview.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Preview.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Preview.Title.tint)
            }
            public enum Search {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Search.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Search.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Search.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Search.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Search.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Search.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Search.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Search.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Search.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Search.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Search.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Search.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Search.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Search.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Search.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Search.Title.tint)
            }
            public enum Square {
                public static var subtitle =
                    DNSThemeLabelStyle(styleName: "Button.Square.subtitle",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Square.Subtitle.text,
                                       font: DNSUIFont.DNSForm.Button.Square.subtitle,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Square.subtitle,
                                       shadow: DNSUIShadow.DNSForm.Button.Square.subtitle,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Square.Subtitle.background,
                                       border: DNSUIBorder.DNSForm.Button.Square.subtitle,
                                       tintColor: DNSUIColor.DNSForm.Button.Square.Subtitle.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Button.Square.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Button.Square.Title.text,
                                       font: DNSUIFont.DNSForm.Button.Square.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Button.Square.title,
                                       shadow: DNSUIShadow.DNSForm.Button.Square.title,
                                       backgroundColor: DNSUIColor.DNSForm.Button.Square.Title.background,
                                       border: DNSUIBorder.DNSForm.Button.Square.title,
                                       tintColor: DNSUIColor.DNSForm.Button.Square.Title.tint)
            }
        }
        public enum Field {
            public enum Default {
                public static var alert =
                    DNSThemeLabelStyle(styleName: "Field.Default.alert",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.Default.Alert.text,
                                       font: DNSUIFont.DNSForm.Field.Default.alert,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.Default.alert,
                                       shadow: DNSUIShadow.DNSForm.Field.Default.alert,
                                       backgroundColor: DNSUIColor.DNSForm.Field.Default.Alert.background,
                                       border: DNSUIBorder.DNSForm.Field.Default.alert,
                                       tintColor: DNSUIColor.DNSForm.Field.Default.Alert.tint)
                public static var counter =
                    DNSThemeLabelStyle(styleName: "Field.Default.counter",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.Default.Counter.text,
                                       font: DNSUIFont.DNSForm.Field.Default.counter,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.Default.counter,
                                       shadow: DNSUIShadow.DNSForm.Field.Default.counter,
                                       backgroundColor: DNSUIColor.DNSForm.Field.Default.Counter.background,
                                       border: DNSUIBorder.DNSForm.Field.Default.counter,
                                       tintColor: DNSUIColor.DNSForm.Field.Default.Counter.tint)
                public static var text =
                    DNSThemeLabelStyle(styleName: "Field.Default.text",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.Default.Text.text,
                                       font: DNSUIFont.DNSForm.Field.Default.text,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.Default.text,
                                       shadow: DNSUIShadow.DNSForm.Field.Default.text,
                                       backgroundColor: DNSUIColor.DNSForm.Field.Default.Text.background,
                                       border: DNSUIBorder.DNSForm.Field.Default.text,
                                       tintColor: DNSUIColor.DNSForm.Field.Default.Text.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Field.Default.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.Default.Title.text,
                                       font: DNSUIFont.DNSForm.Field.Default.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.Default.title,
                                       shadow: DNSUIShadow.DNSForm.Field.Default.title,
                                       backgroundColor: DNSUIColor.DNSForm.Field.Default.Title.background,
                                       border: DNSUIBorder.DNSForm.Field.Default.title,
                                       tintColor: DNSUIColor.DNSForm.Field.Default.Title.tint)
            }
            public enum TextView {
                public static var alert =
                    DNSThemeLabelStyle(styleName: "Field.TextView.alert",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.TextView.Alert.text,
                                       font: DNSUIFont.DNSForm.Field.TextView.alert,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.TextView.alert,
                                       shadow: DNSUIShadow.DNSForm.Field.TextView.alert,
                                       backgroundColor: DNSUIColor.DNSForm.Field.TextView.Alert.background,
                                       border: DNSUIBorder.DNSForm.Field.TextView.alert,
                                       tintColor: DNSUIColor.DNSForm.Field.TextView.Alert.tint)
                public static var counter =
                    DNSThemeLabelStyle(styleName: "Field.TextView.counter",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.TextView.Counter.text,
                                       font: DNSUIFont.DNSForm.Field.TextView.counter,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.TextView.counter,
                                       shadow: DNSUIShadow.DNSForm.Field.TextView.counter,
                                       backgroundColor: DNSUIColor.DNSForm.Field.TextView.Counter.background,
                                       border: DNSUIBorder.DNSForm.Field.TextView.counter,
                                       tintColor: DNSUIColor.DNSForm.Field.TextView.Counter.tint)
                public static var text =
                    DNSThemeLabelStyle(styleName: "Field.TextView.text",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.TextView.Text.text,
                                       font: DNSUIFont.DNSForm.Field.TextView.text,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.TextView.text,
                                       shadow: DNSUIShadow.DNSForm.Field.TextView.text,
                                       backgroundColor: DNSUIColor.DNSForm.Field.TextView.Text.background,
                                       border: DNSUIBorder.DNSForm.Field.TextView.text,
                                       tintColor: DNSUIColor.DNSForm.Field.TextView.Text.tint)
                public static var title =
                    DNSThemeLabelStyle(styleName: "Field.TextView.title",
                                       styleSetName: "DNSForm",
                                       color: DNSUIColor.DNSForm.Field.TextView.Title.text,
                                       font: DNSUIFont.DNSForm.Field.TextView.title,
                                       strikeThru: DNSUIStrikeThru.DNSForm.Field.TextView.title,
                                       shadow: DNSUIShadow.DNSForm.Field.TextView.title,
                                       backgroundColor: DNSUIColor.DNSForm.Field.TextView.Title.background,
                                       border: DNSUIBorder.DNSForm.Field.TextView.title,
                                       tintColor: DNSUIColor.DNSForm.Field.TextView.Title.tint)
            }
        }
    }
}
