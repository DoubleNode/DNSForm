//
//  DNSUIBorder+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore

public extension DNSUIBorder {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public static var `default` =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Default.border,
                            cornerRadius: 10)
            public static var action =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Action.border,
                            cornerRadius: 10)
            public static var actionLeft =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.ActionLeft.border,
                            cornerRadiusMulti: true,
                            cornerTopLeftRadius: 10,
                            cornerBottomLeftRadius: 10)
            public static var actionRight =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.ActionRight.border,
                            cornerRadiusMulti: true,
                            cornerTopRightRadius: 10,
                            cornerBottomRightRadius: 10)
            public static var clear =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Clear.border,
                            cornerRadius: 0)
            public static var destructive =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Destructive.border,
                            cornerRadius: 10)
            public static var indexTab =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.IndexTab.border,
                            cornerRadius: 0,
                            cornerRadiusMulti: true,
                            cornerTopLeftRadius: 10,
                            cornerTopRightRadius: 10,
                            width: 1)
            public static var preview = DNSUIBorder(color: DNSUIColor.DNSForm.Button.Preview.border,
                                                    cornerRadius: 10)
            public static var search = DNSUIBorder(color: DNSUIColor.DNSForm.Button.Search.border,
                                                    cornerRadius: 10)
            public static var square = DNSUIBorder(color: DNSUIColor.DNSForm.Button.Square.border,
                                                   cornerRadius: 0,
                                                   width: 1)
            public static var symbol =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Symbol.border,
                            cornerRadius: 0)
            public enum Default {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Default.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Default.Title.border,
                                cornerRadius: 0)
            }
            public enum Action {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Action.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Action.Title.border,
                                cornerRadius: 0)
            }
            public enum ActionLeft {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.ActionLeft.Title.border,
                                cornerRadius: 0)
            }
            public enum ActionRight {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.ActionRight.Title.border,
                                cornerRadius: 0)
            }
            public enum Clear {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Clear.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Clear.Title.border,
                                cornerRadius: 0)
            }
            public enum Destructive {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Destructive.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Destructive.Title.border,
                                cornerRadius: 0)
            }
            public enum IndexTab {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.IndexTab.Title.border,
                                cornerRadius: 0)
            }
            public enum Preview {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Preview.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Preview.Title.border,
                                cornerRadius: 0)
            }
            public enum Search {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Search.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Search.Title.border,
                                cornerRadius: 0)
            }
            public enum Square {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Square.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Square.Title.border,
                                cornerRadius: 0)
            }
            public enum Symbol {
                public static var subtitle =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Symbol.Subtitle.border,
                                cornerRadius: 0)
                public static var title =
                    DNSUIBorder(color: DNSUIColor.DNSForm.Button.Symbol.Title.border,
                                cornerRadius: 0)
            }
        }
        public enum Field {
            public static var `default` = DNSUIBorder(color: DNSUIColor.DNSForm.Field.Default.border)
            public static var datePicker = DNSUIBorder(color: DNSUIColor.DNSForm.Field.DatePicker.border)
            public static var numberPicker = DNSUIBorder(color: DNSUIColor.DNSForm.Field.NumberPicker.border)
            public static var stringPicker = DNSUIBorder(color: DNSUIColor.DNSForm.Field.StringPicker.border)
            public static var textView = DNSUIBorder(color: DNSUIColor.DNSForm.Field.TextView.border)
            public enum Default {
                public static var alert = DNSUIBorder(color: DNSUIColor.DNSForm.Field.Default.Alert.border)
                public static var counter = DNSUIBorder(color: DNSUIColor.DNSForm.Field.Default.Counter.border)
                public static var text = DNSUIBorder(color: DNSUIColor.DNSForm.Field.Default.Text.border)
                public static var title = DNSUIBorder(color: DNSUIColor.DNSForm.Field.Default.Title.border)
            }
            public enum DatePicker {
                public static var alert = DNSUIBorder(color: DNSUIColor.DNSForm.Field.DatePicker.Alert.border)
                public static var counter = DNSUIBorder(color: DNSUIColor.DNSForm.Field.DatePicker.Counter.border)
                public static var text = DNSUIBorder(color: DNSUIColor.DNSForm.Field.DatePicker.Text.border)
                public static var title = DNSUIBorder(color: DNSUIColor.DNSForm.Field.DatePicker.Title.border)
            }
            public enum NumberPicker {
                public static var alert = DNSUIBorder(color: DNSUIColor.DNSForm.Field.NumberPicker.Alert.border)
                public static var counter = DNSUIBorder(color: DNSUIColor.DNSForm.Field.NumberPicker.Counter.border)
                public static var text = DNSUIBorder(color: DNSUIColor.DNSForm.Field.NumberPicker.Text.border)
                public static var title = DNSUIBorder(color: DNSUIColor.DNSForm.Field.NumberPicker.Title.border)
            }
            public enum StringPicker {
                public static var alert = DNSUIBorder(color: DNSUIColor.DNSForm.Field.StringPicker.Alert.border)
                public static var counter = DNSUIBorder(color: DNSUIColor.DNSForm.Field.StringPicker.Counter.border)
                public static var text = DNSUIBorder(color: DNSUIColor.DNSForm.Field.StringPicker.Text.border)
                public static var title = DNSUIBorder(color: DNSUIColor.DNSForm.Field.StringPicker.Title.border)
            }
            public enum TextView {
                public static var alert = DNSUIBorder(color: DNSUIColor.DNSForm.Field.TextView.Alert.border)
                public static var counter = DNSUIBorder(color: DNSUIColor.DNSForm.Field.TextView.Counter.border)
                public static var text = DNSUIBorder(color: DNSUIColor.DNSForm.Field.TextView.Text.border)
                public static var title = DNSUIBorder(color: DNSUIColor.DNSForm.Field.TextView.Title.border)
            }
        }
        public enum View {
            public static var `default` =
                DNSUIBorder(color: DNSUIColor.DNSForm.View.Default.border,
                            cornerRadius: 10,
                            width: 1)
            public static var actionControlTitle =
                DNSUIBorder(color: DNSUIColor.DNSForm.View.ActionControlTitle.border,
                            cornerRadiusMulti: true,
                            cornerTopRightRadius: 10,
                            cornerBottomLeftRadius: 7)
            public static var clear =
                DNSUIBorder(color: DNSUIColor.DNSForm.View.Clear.border,
                            cornerRadius: 10,
                            width: 1)
            public static var sectionFrame =
                DNSUIBorder(color: DNSUIColor.DNSForm.View.SectionFrame.border,
                            cornerRadius: 10,
                            width: 3)
            public static var sectionFrameTitle =
                DNSUIBorder(color: DNSUIColor.DNSForm.View.SectionFrameTitle.border,
                            cornerRadiusMulti: true,
                            cornerTopRightRadius: 10,
                            cornerBottomLeftRadius: 10)
        }
    }
}
