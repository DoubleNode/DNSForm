//
//  DNSFormStageModels.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseStage
import DNSCore
import DNSDataObjects
import DNSError
import UIKit

open class DNSFormStageModels: DNSBaseStageModels {
    public enum AppAction {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var appAction: DAOAppAction?

            public init(field: String, appAction: DAOAppAction? = nil) {
                self.field = field
                self.appAction = appAction
            }
        }
    }
    public enum Field {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var subfield: String
            public var languageCode: String
            public var value: Any?

            public init(field: String, subfield: String = "", languageCode: String, value: Any? = nil) {
                self.field = field
                self.subfield = subfield
                self.languageCode = languageCode
                self.value = value
            }
        }
        public struct Response: DNSBaseStageBaseResponse {
            public var field: String
            public var error: DNSError?

            public init(field: String, error: DNSError? = nil) {
                self.field = field
                self.error = error
            }
        }
        public struct ViewModel: DNSBaseStageBaseViewModel {
            public var field: String
            public var alertMessage: String

            public init(field: String, alertMessage: String = "") {
                self.field = field
                self.alertMessage = alertMessage
            }
        }
    }
    public enum ImagePopup {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var image: UIImage
            public var message: String
            public var title: String

            public init(field: String, image: UIImage, message: String, title: String) {
                self.field = field
                self.image = image
                self.message = message
                self.title = title
            }
        }
    }
    public enum Language {
        public struct Request: DNSBaseStageBaseRequest {
            public var languageCode: String
            public init(languageCode: String) {
                self.languageCode = languageCode
            }
        }
        public struct Response: DNSBaseStageBaseResponse {
            public var languageCode: String
            public init(languageCode: String) {
                self.languageCode = languageCode
            }
        }
        public struct ViewModel: DNSBaseStageBaseViewModel {
            public var languageCode: String
            public init(languageCode: String) {
                self.languageCode = languageCode
            }
        }
    }
    public enum Tab {
        public struct Request: DNSBaseStageBaseRequest {
            public var selectedTabCode: String
            public var tabsCode: String
            public init(selectedTabCode: String, tabsCode: String) {
                self.selectedTabCode = selectedTabCode
                self.tabsCode = tabsCode
            }
        }
        public struct Response: DNSBaseStageBaseResponse {
            public var selectedTabCode: String
            public var tabsCode: String
            public init(selectedTabCode: String, tabsCode: String) {
                self.selectedTabCode = selectedTabCode
                self.tabsCode = tabsCode
            }
        }
        public struct ViewModel: DNSBaseStageBaseViewModel {
            public var selectedTabCode: String
            public var tabsCode: String
            public init(selectedTabCode: String, tabsCode: String) {
                self.selectedTabCode = selectedTabCode
                self.tabsCode = tabsCode
            }
        }
    }
    public enum Weblink {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var weblink: URL?

            public init(field: String, weblink: URL? = nil) {
                self.field = field
                self.weblink = weblink
            }
        }
    }
}
