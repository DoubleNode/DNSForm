//
//  DNSThemeViewStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore
import DNSCoreThreading

public extension DNSThemeViewStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static func initThemes() {
            DNSThemeViewStyle.initThemes(block: createThemes)
        }
        public static let createThemes: DNSBlock = {
            _ = Self.default
            _ = Self.clear
            _ = Self.sectionFrame
            _ = Self.sectionFrameTitle
        }
        public static var `default` = DNSThemeViewStyle(styleName: "default",
                                                        styleSetName: "DNSForm",
                                                        backgroundColor: DNSUIColor.DNSForm.View.Default.background,
                                                        border: DNSUIBorder(),
                                                        shadow: DNSUIShadow(),
                                                        tintColor: DNSUIColor.DNSForm.View.Default.tint)
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
    }
}
