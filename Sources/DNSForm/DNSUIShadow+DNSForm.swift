//
//  DNSUIShadow+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import UIKit

public extension DNSUIShadow {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public static var `default` = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.shadow)
            public static var destructive = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.shadow)
            public static var square = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.shadow)
            public enum Default {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.titleShadow)
            }
            public enum Destructive {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.titleShadow)
            }
            public enum Square {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.titleShadow)
            }
        }
        public enum View {
        }
    }
}
