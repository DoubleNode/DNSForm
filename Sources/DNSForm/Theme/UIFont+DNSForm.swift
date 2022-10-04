//
//  UIFont+DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import UIKit

public extension UIFont {
    enum DNSForm {  // swiftlint:disable:this type_name
        public enum Button {
            public enum Default {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .semibold)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .bold)
                }
            }
            public enum Action {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .semibold)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .bold)
                }
            }
            public enum ActionLeft {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .semibold)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .bold)
                }
            }
            public enum ActionRight {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .semibold)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .bold)
                }
            }
            public enum Clear {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .light)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var focused = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var highlighted = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var normal = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var selected = UIFont.systemFont(ofSize: 15, weight: .regular)
                }
            }
            public enum Destructive {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .semibold)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .bold)
                }
            }
            public enum IndexTab {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .thin)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .regular)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .regular)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .regular)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .regular)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .regular)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .semibold)
                }
            }
            public enum Preview {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .semibold)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .semibold)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var focused = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var highlighted = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var normal = UIFont.systemFont(ofSize: 18, weight: .bold)
                    public static var selected = UIFont.systemFont(ofSize: 18, weight: .bold)
                }
            }
            public enum Square {
                public enum Subtitle {
                    public static var disabled = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var focused = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var highlighted = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var normal = UIFont.systemFont(ofSize: 12, weight: .light)
                    public static var selected = UIFont.systemFont(ofSize: 12, weight: .light)
                }
                public enum Title {
                    public static var disabled = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var focused = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var highlighted = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var normal = UIFont.systemFont(ofSize: 15, weight: .regular)
                    public static var selected = UIFont.systemFont(ofSize: 15, weight: .regular)
                }
            }
        }
        public enum Field {
            public enum Default {
                public static var alert = UIFont.systemFont(ofSize: 13, weight: .bold)
                public static var counter = UIFont.systemFont(ofSize: 11, weight: .regular)
                public static var text = UIFont.systemFont(ofSize: 16, weight: .regular)
                public static var title = UIFont.systemFont(ofSize: 13, weight: .regular)
            }
            public enum TextView {
                public static var alert = UIFont.systemFont(ofSize: 13, weight: .bold)
                public static var counter = UIFont.systemFont(ofSize: 11, weight: .regular)
                public static var text = UIFont.systemFont(ofSize: 16, weight: .regular)
                public static var title = UIFont.systemFont(ofSize: 13, weight: .regular)
            }
        }
        public enum Label {
            public static var `default` = UIFont.systemFont(ofSize: 18, weight: .regular)
            public static var body = UIFont.systemFont(ofSize: 14, weight: .regular)
            public static var bodyTight = UIFont.systemFont(ofSize: 9, weight: .semibold)
            public static var field = UIFont.systemFont(ofSize: 11, weight: .regular)
            public static var fieldHeader = UIFont.systemFont(ofSize: 13, weight: .semibold)
            public static var header = UIFont.systemFont(ofSize: 28, weight: .bold)
            public static var sectionFrameTitle = UIFont.systemFont(ofSize: 10, weight: .semibold)
            public static var tag = UIFont.systemFont(ofSize: 9, weight: .semibold)
            public static var title = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
    }
}
