//
//  DNSUIColor+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Default.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Default.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Default.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Default.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Default.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Default.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Default.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Default.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Default.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Default.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Action.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Action.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Action.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Action.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Action.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Action.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Action.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Action.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Action.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Action.Title.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Tint.normal,
                               disabled: UIColor.DNSForm.Button.ActionLeft.Tint.disabled,
                               focused: UIColor.DNSForm.Button.ActionLeft.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.ActionLeft.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.ActionLeft.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.ActionLeft.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.ActionLeft.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.ActionLeft.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionLeft.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionLeft.Title.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.ActionRight.Tint.normal,
                               disabled: UIColor.DNSForm.Button.ActionRight.Tint.disabled,
                               focused: UIColor.DNSForm.Button.ActionRight.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.ActionRight.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.ActionRight.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.ActionRight.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.ActionRight.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.ActionRight.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.ActionRight.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.ActionRight.Title.Tint.selected)
                }
            }
            public enum Clear {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Clear.Background.normal,
                               disabled: UIColor.DNSForm.Button.Clear.Background.disabled,
                               focused: UIColor.DNSForm.Button.Clear.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Clear.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Clear.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Clear.Border.normal,
                               disabled: UIColor.DNSForm.Button.Clear.Border.disabled,
                               focused: UIColor.DNSForm.Button.Clear.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Clear.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Clear.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Clear.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Clear.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Clear.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Clear.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Clear.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Clear.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Clear.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Clear.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Clear.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Clear.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Clear.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Clear.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Clear.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Clear.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Clear.Title.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Destructive.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Destructive.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Destructive.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Destructive.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Destructive.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Destructive.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Destructive.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Destructive.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Destructive.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Destructive.Title.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.IndexTab.Tint.normal,
                               disabled: UIColor.DNSForm.Button.IndexTab.Tint.disabled,
                               focused: UIColor.DNSForm.Button.IndexTab.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.IndexTab.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.IndexTab.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.IndexTab.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.IndexTab.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.IndexTab.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.IndexTab.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.IndexTab.Title.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Preview.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Preview.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Preview.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Preview.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Preview.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Preview.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Preview.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Preview.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Preview.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Preview.Title.Tint.selected)
                }
            }
            public enum Search {
                public static var background =
                    DNSUIColor(UIColor.DNSForm.Button.Search.Background.normal,
                               disabled: UIColor.DNSForm.Button.Search.Background.disabled,
                               focused: UIColor.DNSForm.Button.Search.Background.focused,
                               highlighted: UIColor.DNSForm.Button.Search.Background.highlighted,
                               selected: UIColor.DNSForm.Button.Search.Background.selected)
                public static var border =
                    DNSUIColor(UIColor.DNSForm.Button.Search.Border.normal,
                               disabled: UIColor.DNSForm.Button.Search.Border.disabled,
                               focused: UIColor.DNSForm.Button.Search.Border.focused,
                               highlighted: UIColor.DNSForm.Button.Search.Border.highlighted,
                               selected: UIColor.DNSForm.Button.Search.Border.selected)
                public static var shadow =
                    DNSUIColor(UIColor.DNSForm.Button.Search.Shadow.normal,
                               disabled: UIColor.DNSForm.Button.Search.Shadow.disabled,
                               focused: UIColor.DNSForm.Button.Search.Shadow.focused,
                               highlighted: UIColor.DNSForm.Button.Search.Shadow.highlighted,
                               selected: UIColor.DNSForm.Button.Search.Shadow.selected)
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Search.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Search.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Search.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Search.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Search.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Search.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Search.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Search.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Search.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Search.Title.Tint.selected)
                }
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
                public static var tint =
                    DNSUIColor(UIColor.DNSForm.Button.Square.Tint.normal,
                               disabled: UIColor.DNSForm.Button.Square.Tint.disabled,
                               focused: UIColor.DNSForm.Button.Square.Tint.focused,
                               highlighted: UIColor.DNSForm.Button.Square.Tint.highlighted,
                               selected: UIColor.DNSForm.Button.Square.Tint.selected)
                public enum Subtitle {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Subtitle.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Subtitle.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Subtitle.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Subtitle.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Subtitle.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Subtitle.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Subtitle.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Subtitle.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Subtitle.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Subtitle.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Subtitle.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Subtitle.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Subtitle.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Subtitle.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Subtitle.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Subtitle.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Subtitle.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Subtitle.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Subtitle.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Subtitle.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Subtitle.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Subtitle.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Subtitle.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Subtitle.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Subtitle.Tint.selected)
                }
                public enum Title {
                    public static var background =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Title.Background.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Title.Background.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Title.Background.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Title.Background.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Title.Background.selected)
                    public static var border =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Title.Border.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Title.Border.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Title.Border.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Title.Border.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Title.Border.selected)
                    public static var shadow =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Title.Shadow.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Title.Shadow.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Title.Shadow.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Title.Shadow.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Title.Shadow.selected)
                    public static var strikeThru =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Title.StrikeThru.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Title.StrikeThru.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Title.StrikeThru.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Title.StrikeThru.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Title.StrikeThru.selected)
                    public static var text =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Title.Text.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Title.Text.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Title.Text.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Title.Text.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Title.Text.selected)
                    public static var tint =
                        DNSUIColor(UIColor.DNSForm.Button.Square.Title.Tint.normal,
                                   disabled: UIColor.DNSForm.Button.Square.Title.Tint.disabled,
                                   focused: UIColor.DNSForm.Button.Square.Title.Tint.focused,
                                   highlighted: UIColor.DNSForm.Button.Square.Title.Tint.highlighted,
                                   selected: UIColor.DNSForm.Button.Square.Title.Tint.selected)
                }
            }
        }
        public enum Field {
            public enum Default {
                public static var background = DNSUIColor(UIColor.DNSForm.Field.Default.background)
                public static var border = DNSUIColor(UIColor.DNSForm.Field.Default.border)
                public static var line = DNSUIColor(UIColor.DNSForm.Field.Default.line)
                public static var shadow = DNSUIColor(UIColor.DNSForm.Field.Default.shadow)
                public static var tint = DNSUIColor(UIColor.DNSForm.Field.Default.tint)
                public enum Alert {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.Default.Alert.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.Default.Alert.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.Default.Alert.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.Default.Alert.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.Default.Alert.text)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.Default.Alert.tint)
                }
                public enum Counter {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.Default.Counter.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.Default.Counter.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.Default.Counter.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.Default.Counter.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.Default.Counter.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.Default.Counter.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.Default.Counter.tint)
                }
                public enum Text {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.Default.Text.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.Default.Text.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.Default.Text.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.Default.Text.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.Default.Text.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.Default.Text.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.Default.Text.tint)
                }
                public enum Title {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.Default.Title.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.Default.Title.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.Default.Title.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.Default.Title.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.Default.Title.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.Default.Title.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.Default.Title.tint)
                }
            }
            public enum TextView {
                public static var background = DNSUIColor(UIColor.DNSForm.Field.TextView.background)
                public static var border = DNSUIColor(UIColor.DNSForm.Field.TextView.border)
                public static var line = DNSUIColor(UIColor.DNSForm.Field.TextView.line)
                public static var shadow = DNSUIColor(UIColor.DNSForm.Field.TextView.shadow)
                public static var tint = DNSUIColor(UIColor.DNSForm.Field.TextView.tint)
                public enum Alert {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.TextView.Alert.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.TextView.Alert.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.TextView.Alert.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.TextView.Alert.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.TextView.Title.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.tint)
                }
                public enum Counter {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.TextView.Counter.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.TextView.Counter.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.TextView.Counter.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.TextView.Counter.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.TextView.Counter.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.TextView.Counter.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.TextView.Counter.tint)
                }
                public enum Text {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.TextView.Text.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.TextView.Text.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.TextView.Text.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.TextView.Text.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.TextView.Text.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.TextView.Text.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.TextView.Text.tint)
                }
                public enum Title {
                    public static var background = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.background)
                    public static var border = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.border)
                    public static var shadow = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.shadow)
                    public static var strikeThru = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.strikeThru)
                    public static var text = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.Text.normal,
                                                        disabled: UIColor.DNSForm.Field.TextView.Title.Text.disabled)
                    public static var tint = DNSUIColor(UIColor.DNSForm.Field.TextView.Title.tint)
                }
            }
        }
        public enum Label {
            public static var `default` = DNSUIColor(UIColor.DNSForm.Label.default)
            public static var body = DNSUIColor(UIColor.DNSForm.Label.body)
            public static var bodyTight = DNSUIColor(UIColor.DNSForm.Label.bodyTight)
            public static var field = DNSUIColor(UIColor.DNSForm.Label.field)
            public static var fieldHeader = DNSUIColor(UIColor.DNSForm.Label.fieldHeader)
            public static var header = DNSUIColor(UIColor.DNSForm.Label.header)
            public static var sectionFrameTitle = DNSUIColor(UIColor.DNSForm.Label.sectionFrameTitle)
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
                public static var background = DNSUIColor(UIColor.DNSForm.View.Clear.Background.normal,
                                                          selected: UIColor.DNSForm.View.Clear.Background.selected)
                public static var border = DNSUIColor(UIColor.DNSForm.View.Clear.border)
                public static var tint = DNSUIColor(UIColor.DNSForm.View.Clear.tint)
            }
            public enum SectionFrame {
                public static var background = DNSUIColor(UIColor.DNSForm.View.SectionFrame.background)
                public static var border = DNSUIColor(UIColor.DNSForm.View.SectionFrame.border)
                public static var tint = DNSUIColor(UIColor.DNSForm.View.SectionFrame.tint)
            }
            public enum SectionFrameTitle {
                public static var background = DNSUIColor(UIColor.DNSForm.View.SectionFrameTitle.background)
                public static var border = DNSUIColor(UIColor.DNSForm.View.SectionFrameTitle.border)
                public static var tint = DNSUIColor(UIColor.DNSForm.View.SectionFrameTitle.tint)
            }
        }
    }
}   // swiftlint:disable:this file_length
