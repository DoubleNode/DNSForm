//
//  DNSThemeLabelStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme

public extension DNSThemeLabelStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static var `default` = DNSThemeLabelStyle(styleName: "default",
                                                         color: DNSUIColor.DNSForm.Label.tag,
                                                         font: DNSUIFont.DNSForm.Label.default)
        public static var body = DNSThemeLabelStyle(styleName: "body",
                                                    color: DNSUIColor.DNSForm.Label.tag,
                                                    font: DNSUIFont.DNSForm.Label.body,
                                                    zeplinLineHeight: 21)
        public static var bodyTight = DNSThemeLabelStyle(styleName: "bodyTight",
                                                         color: DNSUIColor.DNSForm.Label.tag,
                                                         font: DNSUIFont.DNSForm.Label.body,
                                                         zeplinLineHeight: 14)
        public static var tag = DNSThemeLabelStyle(styleName: "tag",
                                                   color: DNSUIColor.DNSForm.Label.tag,
                                                   font: DNSUIFont.DNSForm.Label.tag)
        public static var title = DNSThemeLabelStyle(styleName: "title",
                                                     color: DNSUIColor.DNSForm.Label.tag,
                                                     font: DNSUIFont.DNSForm.Label.title)
    }
}
