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
            public enum Action {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Background.normal,
                               disabled: UIColor.DNSForm.Button.Action.Background.disabled,
                               focused: UIColor.DNSForm.Button.Action.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Border.normal,
                               disabled: UIColor.DNSForm.Button.Action.Border.disabled,
                               focused: UIColor.DNSForm.Button.Action.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Action.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Action.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.Action.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.Action.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Action.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Action.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Action.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Action.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Title.normal,
                               disabled: UIColor.DNSForm.Button.Action.Title.disabled,
                               focused: UIColor.DNSForm.Button.Action.Title.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Title.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Action.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Action.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Title.Shadow.selected)
            }
            public enum ActionLeft {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Background.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Background.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Background.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Background.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Border.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Border.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Border.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Border.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Tint.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Tint.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Title.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Title.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Title.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.selected)
            }
            public enum ActionRight {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Background.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Background.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Background.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Background.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Border.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Border.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Border.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Border.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Tint.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Tint.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Title.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Title.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Title.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Title.Shadow.selected)
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
            public enum Preview {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Background.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Background.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Border.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Border.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Shadow.selected)
                public static var subtitle =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Subtitle.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Subtitle.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Subtitle.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Subtitle.selected)
                public static var subtitleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Tint.selected)
                public static var title =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Title.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Title.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Title.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Title.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Title.selected)
                public static var titleShadow =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Title.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Title.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Title.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Title.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Title.Shadow.selected)
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
        public enum Field {
            public enum Default {
                public static var alert = DNSUIColor(UIColor.DNSForm.Field.Default.alert)
                public static var background = DNSUIColor(UIColor.DNSForm.Field.Default.background)
                public static var border = DNSUIColor(UIColor.DNSForm.Field.Default.border)
                public static var counter = DNSUIColor(UIColor.DNSForm.Field.Default.counter)
                public static var highlight = DNSUIColor(UIColor.DNSForm.Field.Default.highlight)
                public static var line = DNSUIColor(UIColor.DNSForm.Field.Default.line)
                public static var shadow = DNSUIColor(UIColor.DNSForm.Field.Default.shadow)
                public static var text = DNSUIColor(UIColor.DNSForm.Field.Default.text)
                public static var tint = DNSUIColor(UIColor.DNSForm.Field.Default.tint)
                public static var title = DNSUIColor(UIColor.DNSForm.Field.Default.title)
            }
            public enum TextView {
                public static var alert = DNSUIColor(UIColor.DNSForm.Field.TextView.alert)
                public static var background = DNSUIColor(UIColor.DNSForm.Field.TextView.background)
                public static var border = DNSUIColor(UIColor.DNSForm.Field.TextView.border)
                public static var counter = DNSUIColor(UIColor.DNSForm.Field.TextView.counter)
                public static var highlight = DNSUIColor(UIColor.DNSForm.Field.TextView.highlight)
                public static var line = DNSUIColor(UIColor.DNSForm.Field.TextView.line)
                public static var shadow = DNSUIColor(UIColor.DNSForm.Field.TextView.shadow)
                public static var text = DNSUIColor(UIColor.DNSForm.Field.TextView.text)
                public static var tint = DNSUIColor(UIColor.DNSForm.Field.TextView.tint)
                public static var title = DNSUIColor(UIColor.DNSForm.Field.TextView.title)
            }
        }
        public enum Label {
            public static var `default` = DNSUIColor(UIColor.DNSForm.Label.default)
            public static var body = DNSUIColor(UIColor.DNSForm.Label.body)
            public static var bodyTight = DNSUIColor(UIColor.DNSForm.Label.bodyTight)
            public static var field = DNSUIColor(UIColor.DNSForm.Label.field)
            public static var fieldHeader = DNSUIColor(UIColor.DNSForm.Label.fieldHeader)
            public static var header = DNSUIColor(UIColor.DNSForm.Label.header)
            public static var section = DNSUIColor(UIColor.DNSForm.Label.section)
            public static var tag = DNSUIColor(UIColor.DNSForm.Label.tag)
            public static var title = DNSUIColor(UIColor.DNSForm.Label.title)
        }
        public enum View {
            public enum Default {
                public static var background = DNSUIColor(UIColor.DNSForm.View.Default.background)
                public static var border = DNSUIColor(UIColor.DNSForm.View.Default.border)
                public static var tint = DNSUIColor(UIColor.DNSForm.View.Default.tint)
            }
            public enum Clear {
                public static var background = DNSUIColor(UIColor.DNSForm.View.Clear.background)
                public static var border = DNSUIColor(UIColor.DNSForm.View.Clear.border)
                public static var tint = DNSUIColor(UIColor.DNSForm.View.Clear.tint)
            }
        }
    }
}   // swiftlint:disable:this file_length
