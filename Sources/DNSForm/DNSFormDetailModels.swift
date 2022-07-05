//
//  DNSFormDetailModels.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseStage
import DNSDataObjects
import UIKit

open class DNSFormDetailModels: DNSBaseStageModels {
    public enum AppAction {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var appAction: DAOAppAction?
        }
    }
    public enum Field {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var languageCode: String
            public var value: Any?
        }
    }
    public enum Image {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var image: UIImage
        }
    }
    public enum Language {
        public struct Request: DNSBaseStageBaseRequest {
            public var languageCode: String
        }
        public struct Response: DNSBaseStageBaseResponse {
            public var languageCode: String
        }
        public struct ViewModel: DNSBaseStageBaseViewModel {
            public var languageCode: String
        }
    }
    public enum Weblink {
        public struct Request: DNSBaseStageBaseRequest {
            public var field: String
            public var weblink: URL?
        }
    }
}
