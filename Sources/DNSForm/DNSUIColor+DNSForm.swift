//
//  DNSUIColor+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import UIKit

public extension DNSUIColor {
    enum DNSForm {  // swiftlint:disable:this type_name type_body_length
        public enum Button {    // swiftlint:disable:this type_body_length
            public enum Default {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Background.normal,
                               disabled: UIColor.DNSForm.Button.Default.Background.disabled,
                               focused: UIColor.DNSForm.Button.Default.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Border.normal,
                               disabled: UIColor.DNSForm.Button.Default.Border.disabled,
                               focused: UIColor.DNSForm.Button.Default.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Default.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Default.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.Default.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.Default.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Default.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Default.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Default.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Default.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Title.normal,
                               disabled: UIColor.DNSForm.Button.Default.Title.disabled,
                               focused: UIColor.DNSForm.Button.Default.Title.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Title.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Default.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Default.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Title.Shadow.selected)
            }
            public enum Destructive {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Background.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Background.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Border.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Border.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Title.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Title.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Title.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Title.Shadow.selected)
            }
            public enum IndexTab {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Background.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Background.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Background.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Background.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Border.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Border.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Border.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Border.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Tint.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Tint.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Title.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Title.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Title.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Title.Shadow.selected)
            }
            public enum Square {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Background.normal,
                               disabled: UIColor.DNSForm.Button.Square.Background.disabled,
                               focused: UIColor.DNSForm.Button.Square.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Border.normal,
                               disabled: UIColor.DNSForm.Button.Square.Border.disabled,
                               focused: UIColor.DNSForm.Button.Square.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Square.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Square.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.Square.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.Square.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Square.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Square.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Square.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Square.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Title.normal,
                               disabled: UIColor.DNSForm.Button.Square.Title.disabled,
                               focused: UIColor.DNSForm.Button.Square.Title.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Title.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Square.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Square.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Title.Shadow.selected)
            }
        }
        public enum Label {
            public static var `default` = DNSUIColor(UIColor.DNSForm.Label.default)
            public static var body = DNSUIColor(UIColor.DNSForm.Label.body)
            public static var tag = DNSUIColor(UIColor.DNSForm.Label.tag)
            public static var title = DNSUIColor(UIColor.DNSForm.Label.title)
        }
        public enum View {
        }
    }
}   // swiftlint:disable:this file_length
