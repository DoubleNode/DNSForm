//
//  DNSUIStrikeThru+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore

public extension DNSUIStrikeThru {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public enum Default {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Default.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Default.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Default.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Default.subtitle)
            }
            public enum Action {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Action.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Action.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Action.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Action.subtitle)
            }
            public enum ActionLeft {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.ActionLeft.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.ActionLeft.subtitle)
            }
            public enum ActionRight {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.ActionRight.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.ActionRight.subtitle)
            }
            public enum Clear {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Clear.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Clear.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Clear.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Clear.subtitle)
            }
            public enum Destructive {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Destructive.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Destructive.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Destructive.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Destructive.subtitle)
            }
            public enum IndexTab {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.IndexTab.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.IndexTab.subtitle)
            }
            public enum Preview {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Preview.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Preview.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Preview.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Preview.subtitle)
            }
            public enum Search {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Search.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Search.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Search.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Search.subtitle)
            }
            public enum Square {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Square.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Square.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Square.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Square.subtitle)
            }
            public enum Symbol {
                public static var subtitle =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Symbol.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Symbol.subtitle)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Button.Symbol.Subtitle.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Button.Symbol.subtitle)
            }
        }
        public enum Field {
            public enum Default {
                public static var alert =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.Default.Alert.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.Default.Alert.strikeThru)
                public static var counter =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.Default.Counter.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.Default.Counter.strikeThru)
                public static var text =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.Default.Text.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.Default.Text.strikeThru)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.Default.Title.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.Default.Title.strikeThru)
            }
            public enum DatePicker {
                public static var alert =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.DatePicker.Alert.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.DatePicker.Alert.strikeThru)
                public static var counter =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.DatePicker.Counter.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.DatePicker.Counter.strikeThru)
                public static var text =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.DatePicker.Text.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.DatePicker.Text.strikeThru)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.DatePicker.Title.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.DatePicker.Title.strikeThru)
            }
            public enum NumberPicker {
                public static var alert =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.NumberPicker.Alert.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.NumberPicker.Alert.strikeThru)
                public static var counter =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.NumberPicker.Counter.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.NumberPicker.Counter.strikeThru)
                public static var text =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.NumberPicker.Text.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.NumberPicker.Text.strikeThru)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.NumberPicker.Title.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.NumberPicker.Title.strikeThru)
            }
            public enum StringPicker {
                public static var alert =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.StringPicker.Alert.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.StringPicker.Alert.strikeThru)
                public static var counter =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.StringPicker.Counter.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.StringPicker.Counter.strikeThru)
                public static var text =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.StringPicker.Text.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.StringPicker.Text.strikeThru)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.StringPicker.Title.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.StringPicker.Title.strikeThru)
            }
            public enum TextView {
                public static var alert =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.TextView.Alert.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.TextView.Alert.strikeThru)
                public static var counter =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.TextView.Counter.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.TextView.Counter.strikeThru)
                public static var text =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.TextView.Text.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.TextView.Text.strikeThru)
                public static var title =
                    DNSUIStrikeThru(color: DNSUIColor.DNSForm.Field.TextView.Title.strikeThru,
                                    enabled: DNSUIEnabled.DNSForm.Field.TextView.Title.strikeThru)
            }
        }
    }
}
