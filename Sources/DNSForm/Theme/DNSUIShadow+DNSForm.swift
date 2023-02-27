//
//  DNSUIShadow+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore

public extension DNSUIShadow {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public static var `default` = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.shadow)
            public static var action = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Action.shadow)
            public static var actionLeft = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionLeft.shadow)
            public static var actionRight = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionRight.shadow)
            public static var clear = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Clear.shadow)
            public static var destructive = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.shadow)
            public static var indexTab = DNSUIShadow(color: DNSUIColor.DNSForm.Button.IndexTab.shadow)
            public static var preview = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Preview.shadow)
            public static var search = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Search.shadow)
            public static var square = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.shadow)
            public enum Default {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.Title.shadow)
            }
            public enum Action {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Action.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Action.Title.shadow)
            }
            public enum ActionLeft {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionLeft.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionLeft.Title.shadow)
            }
            public enum ActionRight {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionRight.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionRight.Title.shadow)
            }
            public enum Clear {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Clear.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Clear.Title.shadow)
            }
            public enum Destructive {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.Title.shadow)
            }
            public enum IndexTab {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.IndexTab.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.IndexTab.Title.shadow)
            }
            public enum Preview {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Preview.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Preview.Title.shadow)
            }
            public enum Search {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Search.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Search.Title.shadow)
            }
            public enum Square {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.Subtitle.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.Title.shadow)
            }
        }
        public enum Field {
            public static var `default` = DNSUIShadow(color: DNSUIColor.DNSForm.Field.Default.shadow)
            public static var datePicker = DNSUIShadow(color: DNSUIColor.DNSForm.Field.DatePicker.shadow)
            public static var numberPicker = DNSUIShadow(color: DNSUIColor.DNSForm.Field.NumberPicker.shadow)
            public static var stringPicker = DNSUIShadow(color: DNSUIColor.DNSForm.Field.StringPicker.shadow)
            public static var textView = DNSUIShadow(color: DNSUIColor.DNSForm.Field.TextView.shadow)
            public enum Default {
                public static var alert = DNSUIShadow(color: DNSUIColor.DNSForm.Field.Default.Alert.shadow)
                public static var counter = DNSUIShadow(color: DNSUIColor.DNSForm.Field.Default.Counter.shadow)
                public static var text = DNSUIShadow(color: DNSUIColor.DNSForm.Field.Default.Text.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Field.Default.Title.shadow)
            }
            public enum DatePicker {
                public static var alert = DNSUIShadow(color: DNSUIColor.DNSForm.Field.DatePicker.Alert.shadow)
                public static var counter = DNSUIShadow(color: DNSUIColor.DNSForm.Field.DatePicker.Counter.shadow)
                public static var text = DNSUIShadow(color: DNSUIColor.DNSForm.Field.DatePicker.Text.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Field.DatePicker.Title.shadow)
            }
            public enum NumberPicker {
                public static var alert = DNSUIShadow(color: DNSUIColor.DNSForm.Field.NumberPicker.Alert.shadow)
                public static var counter = DNSUIShadow(color: DNSUIColor.DNSForm.Field.NumberPicker.Counter.shadow)
                public static var text = DNSUIShadow(color: DNSUIColor.DNSForm.Field.NumberPicker.Text.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Field.NumberPicker.Title.shadow)
            }
            public enum StringPicker {
                public static var alert = DNSUIShadow(color: DNSUIColor.DNSForm.Field.StringPicker.Alert.shadow)
                public static var counter = DNSUIShadow(color: DNSUIColor.DNSForm.Field.StringPicker.Counter.shadow)
                public static var text = DNSUIShadow(color: DNSUIColor.DNSForm.Field.StringPicker.Text.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Field.StringPicker.Title.shadow)
            }
            public enum TextView {
                public static var alert = DNSUIShadow(color: DNSUIColor.DNSForm.Field.TextView.Alert.shadow)
                public static var counter = DNSUIShadow(color: DNSUIColor.DNSForm.Field.TextView.Counter.shadow)
                public static var text = DNSUIShadow(color: DNSUIColor.DNSForm.Field.TextView.Text.shadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Field.TextView.Title.shadow)
            }
        }
        public enum View {
        }
    }
}
