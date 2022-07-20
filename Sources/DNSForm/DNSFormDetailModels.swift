//
//  DNSFormDetailModels.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseStage
import DNSDataObjects
import UIKit

open class DNSFormDetailModels: DNSBaseStageModels {
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
            public var languageCode: String
            public var value: Any?

            public init(field: String, languageCode: String, value: Any? = nil) {
                self.field = field
                self.languageCode = languageCode
                self.value = value
            }
        }
    }
    public enum Image {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var image: UIImage

            public init(field: String, image: UIImage) {
                self.field = field
                self.image = image
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
