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
        public enum Label {
            public static var `default` = DNSUIFont(UIFont.DNSForm.Label.default)
            public static var body = DNSUIFont(UIFont.DNSForm.Label.body)
            public static var tag = DNSUIFont(UIFont.DNSForm.Label.tag)
            public static var title = DNSUIFont(UIFont.DNSForm.Label.title)
        }
    }
}
