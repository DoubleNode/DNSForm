//
//  DNSThemeViewStyle+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import UIKit

public extension DNSThemeViewStyle {
    enum DNSForm {  // swiftlint:disable:this type_name
        public static var `default` = DNSThemeViewStyle(styleName: "default",
                                                        styleDescription: "DNSForm.default",
                                                        backgroundColor: DNSUIColor(UIColor.DNSForm.View.background),
                                                        border: DNSUIBorder(),
                                                        shadow: DNSUIShadow(),
                                                        tintColor: DNSUIColor(UIColor.DNSForm.View.tint))
    }
}
