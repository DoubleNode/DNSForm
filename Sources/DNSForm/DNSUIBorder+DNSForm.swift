//
//  DNSUIBorder+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import UIKit

public extension DNSUIBorder {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public static var `default` =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Default.border,
                            cornerRadius: 10)
            public static var destructive =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Destructive.border,
                            cornerRadius: 10)
            public static var square =
                DNSUIBorder(color: DNSUIColor.DNSForm.Button.Square.border,
                            cornerRadius: 0,
                            width: 1)
        }
    }
}
