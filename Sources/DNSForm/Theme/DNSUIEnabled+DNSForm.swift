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
            public enum Clear {
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
            public enum Search {
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
                public static var alertEnabled = DNSUIEnabled(true)
                public static var alertFieldActive = DNSUIEnabled(true)
                public static var alertLineActive = DNSUIEnabled(true)
                public static var alertTitleActive = DNSUIEnabled(true)
                public static var countDown = DNSUIEnabled(false)
                public static var counterAnimation = DNSUIEnabled(false)
                public static var counterEnabled = DNSUIEnabled(false)
                public static var titleAlwaysVisible = DNSUIEnabled(false)
                public enum Alert {
                    public static var strikeThru = DNSUIEnabled(false)
                }
                public enum Counter {
                    public static var strikeThru = DNSUIEnabled(false)
                }
                public enum Text {
                    public static var strikeThru = DNSUIEnabled(false)
                }
                public enum Title {
                    public static var strikeThru = DNSUIEnabled(false)
                }
            }
            public enum TextView {
                public static var alertEnabled = DNSUIEnabled(true)
                public static var alertFieldActive = DNSUIEnabled(false)
                public static var alertLineActive = DNSUIEnabled(true)
                public static var alertTitleActive = DNSUIEnabled(false)
                public static var countDown = DNSUIEnabled(false)
                public static var counterAnimation = DNSUIEnabled(true)
                public static var counterEnabled = DNSUIEnabled(true)
                public static var titleAlwaysVisible = DNSUIEnabled(true)
                public enum Alert {
                    public static var strikeThru = DNSUIEnabled(false)
                }
                public enum Counter {
                    public static var strikeThru = DNSUIEnabled(false)
                }
                public enum Text {
                    public static var strikeThru = DNSUIEnabled(false)
                }
                public enum Title {
                    public static var strikeThru = DNSUIEnabled(false)
                }
            }
        }
    }
}
