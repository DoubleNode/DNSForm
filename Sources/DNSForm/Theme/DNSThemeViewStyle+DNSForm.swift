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
    }
}
