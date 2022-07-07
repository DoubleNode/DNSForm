//
//  DNSUIFont+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import UIKit

public extension DNSUIFont {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public enum Default {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.Default.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.Default.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.Default.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.Default.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.Default.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.Default.Title.normal,
                              disabled: UIFont.DNSForm.Button.Default.Title.disabled,
                              focused: UIFont.DNSForm.Button.Default.Title.focused,
                              highlighted: UIFont.DNSForm.Button.Default.Title.highlighted,
                              selected: UIFont.DNSForm.Button.Default.Title.selected)
            }
            public enum Action {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.Action.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.Action.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.Action.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.Action.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.Action.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.Action.Title.normal,
                              disabled: UIFont.DNSForm.Button.Action.Title.disabled,
                              focused: UIFont.DNSForm.Button.Action.Title.focused,
                              highlighted: UIFont.DNSForm.Button.Action.Title.highlighted,
                              selected: UIFont.DNSForm.Button.Action.Title.selected)
            }
            public enum ActionLeft {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.ActionLeft.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.ActionLeft.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.ActionLeft.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.ActionLeft.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.ActionLeft.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.ActionLeft.Title.normal,
                              disabled: UIFont.DNSForm.Button.ActionLeft.Title.disabled,
                              focused: UIFont.DNSForm.Button.ActionLeft.Title.focused,
                              highlighted: UIFont.DNSForm.Button.ActionLeft.Title.highlighted,
                              selected: UIFont.DNSForm.Button.ActionLeft.Title.selected)
            }
            public enum ActionRight {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.ActionRight.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.ActionRight.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.ActionRight.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.ActionRight.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.ActionRight.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.ActionRight.Title.normal,
                              disabled: UIFont.DNSForm.Button.ActionRight.Title.disabled,
                              focused: UIFont.DNSForm.Button.ActionRight.Title.focused,
                              highlighted: UIFont.DNSForm.Button.ActionRight.Title.highlighted,
                              selected: UIFont.DNSForm.Button.ActionRight.Title.selected)
            }
            public enum Destructive {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.Destructive.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.Destructive.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.Destructive.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.Destructive.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.Destructive.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.Destructive.Title.normal,
                              disabled: UIFont.DNSForm.Button.Destructive.Title.disabled,
                              focused: UIFont.DNSForm.Button.Destructive.Title.focused,
                              highlighted: UIFont.DNSForm.Button.Destructive.Title.highlighted,
                              selected: UIFont.DNSForm.Button.Destructive.Title.selected)
            }
            public enum IndexTab {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.IndexTab.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.IndexTab.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.IndexTab.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.IndexTab.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.IndexTab.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.IndexTab.Title.normal,
                              disabled: UIFont.DNSForm.Button.IndexTab.Title.disabled,
                              focused: UIFont.DNSForm.Button.IndexTab.Title.focused,
                              highlighted: UIFont.DNSForm.Button.IndexTab.Title.highlighted,
                              selected: UIFont.DNSForm.Button.IndexTab.Title.selected)
            }
            public enum Preview {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.Preview.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.Preview.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.Preview.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.Preview.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.Preview.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.Preview.Title.normal,
                              disabled: UIFont.DNSForm.Button.Preview.Title.disabled,
                              focused: UIFont.DNSForm.Button.Preview.Title.focused,
                              highlighted: UIFont.DNSForm.Button.Preview.Title.highlighted,
                              selected: UIFont.DNSForm.Button.Preview.Title.selected)
            }
            public enum Square {
                public static var subtitle =
                    DNSUIFont(UIFont.DNSForm.Button.Square.Subtitle.normal,
                              disabled: UIFont.DNSForm.Button.Square.Subtitle.disabled,
                              focused: UIFont.DNSForm.Button.Square.Subtitle.focused,
                              highlighted: UIFont.DNSForm.Button.Square.Subtitle.highlighted,
                              selected: UIFont.DNSForm.Button.Square.Subtitle.selected)
                public static var title =
                    DNSUIFont(UIFont.DNSForm.Button.Square.Title.normal,
                              disabled: UIFont.DNSForm.Button.Square.Title.disabled,
                              focused: UIFont.DNSForm.Button.Square.Title.focused,
                              highlighted: UIFont.DNSForm.Button.Square.Title.highlighted,
                              selected: UIFont.DNSForm.Button.Square.Title.selected)
            }
        }
        public enum Field {
            public enum Default {
                public static var alert = DNSUIFont(UIFont.DNSForm.Field.Default.alert)
                public static var counter = DNSUIFont(UIFont.DNSForm.Field.Default.counter)
                public static var text = DNSUIFont(UIFont.DNSForm.Field.Default.text)
                public static var title = DNSUIFont(UIFont.DNSForm.Field.Default.title)
            }
            public enum TextView {
                public static var alert = DNSUIFont(UIFont.DNSForm.Field.TextView.alert)
                public static var counter = DNSUIFont(UIFont.DNSForm.Field.TextView.counter)
                public static var text = DNSUIFont(UIFont.DNSForm.Field.TextView.text)
                public static var title = DNSUIFont(UIFont.DNSForm.Field.TextView.title)
            }
        }
        public enum Label {
            public static var `default` = DNSUIFont(UIFont.DNSForm.Label.default)
            public static var body = DNSUIFont(UIFont.DNSForm.Label.body)
            public static var bodyTight = DNSUIFont(UIFont.DNSForm.Label.bodyTight)
            public static var field = DNSUIFont(UIFont.DNSForm.Label.field)
            public static var fieldHeader = DNSUIFont(UIFont.DNSForm.Label.fieldHeader)
            public static var header = DNSUIFont(UIFont.DNSForm.Label.header)
            public static var section = DNSUIFont(UIFont.DNSForm.Label.section)
            public static var tag = DNSUIFont(UIFont.DNSForm.Label.tag)
            public static var title = DNSUIFont(UIFont.DNSForm.Label.title)
        }
    }
}
