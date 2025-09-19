//
//  DNSThemeViewStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import DNSCore
import DNSCoreThreading
import DNSThemeTypes

public extension DNSThemeViewStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static func initThemes() {
            DNSThemeViewStyle.initThemes(block: createThemes)
        }
        public static let createThemes: DNSBlock = {
            _ = Self.default
            _ = Self.actionControlTitle
            _ = Self.clear
            _ = Self.sectionFrame
            _ = Self.sectionFrameTitle
            _ = Self.textViewBackground
        }
        public static var `default` = DNSThemeViewStyle(styleName: "default",
                                                        styleSetName: "DNSForm",
                                                        backgroundColor: DNSUIColor.DNSForm.View.Default.background,
                                                        border: DNSUIBorder(),
                                                        shadow: DNSUIShadow(),
                                                        tintColor: DNSUIColor.DNSForm.View.Default.tint)
        public static var actionControlTitle =
            DNSThemeViewStyle(styleName: "actionControlTitle",
                              styleSetName: "DNSForm",
                              backgroundColor: DNSUIColor.DNSForm.View.ActionControlTitle.background,
                              border: DNSUIBorder.DNSForm.View.actionControlTitle,
                              shadow: DNSUIShadow(),
                              tintColor: DNSUIColor.DNSForm.View.ActionControlTitle.tint)
        public static var clear = DNSThemeViewStyle(styleName: "clear",
                                                    styleSetName: "DNSForm",
                                                    backgroundColor: DNSUIColor.DNSForm.View.Clear.background,
                                                    border: DNSUIBorder(),
                                                    shadow: DNSUIShadow(),
                                                    tintColor: DNSUIColor.DNSForm.View.Clear.tint)
        public static var sectionFrame =
            DNSThemeViewStyle(styleName: "sectionFrame",
                              styleSetName: "DNSForm",
                              backgroundColor: DNSUIColor.DNSForm.View.SectionFrame.background,
                              border: DNSUIBorder.DNSForm.View.sectionFrame,
                              shadow: DNSUIShadow(),
                              tintColor: DNSUIColor.DNSForm.View.SectionFrame.tint)
        public static var sectionFrameTitle =
            DNSThemeViewStyle(styleName: "sectionFrameTitle",
                              styleSetName: "DNSForm",
                              backgroundColor: DNSUIColor.DNSForm.View.SectionFrameTitle.background,
                              border: DNSUIBorder.DNSForm.View.sectionFrameTitle,
                              shadow: DNSUIShadow(),
                              tintColor: DNSUIColor.DNSForm.View.SectionFrameTitle.tint)
        public static var textViewBackground =
            DNSThemeViewStyle(styleName: "textViewBackground",
                              styleSetName: "DNSForm",
                              backgroundColor: DNSUIColor.DNSForm.View.TextViewBackground.background,
                              border: DNSUIBorder(),
                              shadow: DNSUIShadow(),
                              tintColor: DNSUIColor.DNSForm.View.TextViewBackground.tint)
    }
}
