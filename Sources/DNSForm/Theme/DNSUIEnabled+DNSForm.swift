//
//  DNSUIEnabled+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore

public extension DNSUIEnabled {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public enum Default {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum Action {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum ActionLeft {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum ActionRight {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum Destructive {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum IndexTab {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum Preview {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum Square {
                public static var subtitle = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
        }
        public enum Field {
            public enum Default {
                public static var alert = DNSUIEnabled(false)
                public static var counter = DNSUIEnabled(false)
                public static var text = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
            public enum TextView {
                public static var alert = DNSUIEnabled(false)
                public static var counter = DNSUIEnabled(false)
                public static var text = DNSUIEnabled(false)
                public static var title = DNSUIEnabled(false)
            }
        }
    }
}
