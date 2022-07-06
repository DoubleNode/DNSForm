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
            public static var action = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Action.shadow)
            public static var actionLeft = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionLeft.shadow)
            public static var actionRight = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionRight.shadow)
            public static var destructive = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.shadow)
            public static var indexTab = DNSUIShadow(color: DNSUIColor.DNSForm.Button.IndexTab.shadow)
            public static var preview = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Preview.shadow)
            public static var square = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Square.shadow)
            public enum Default {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Default.titleShadow)
            }
            public enum Action {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Action.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Action.titleShadow)
            }
            public enum ActionLeft {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionLeft.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionLeft.titleShadow)
            }
            public enum ActionRight {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionRight.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.ActionRight.titleShadow)
            }
            public enum Destructive {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Destructive.titleShadow)
            }
            public enum IndexTab {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.IndexTab.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.IndexTab.titleShadow)
            }
            public enum Preview {
                public static var subtitle = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Preview.subtitleShadow)
                public static var title = DNSUIShadow(color: DNSUIColor.DNSForm.Button.Preview.titleShadow)
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
