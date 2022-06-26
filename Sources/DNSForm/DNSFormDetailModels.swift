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
            var field: String
            var appAction: DAOAppAction?
        }
    }
    public enum Field {
        public struct Request: DNSBaseStageBaseRequest {
            var field: String
            var languageCode: String
            var value: Any?
        }
    }
    public enum Image {
        public struct Request: DNSBaseStageBaseRequest {
            var field: String
            var image: UIImage
        }
    }
    public enum Language {
        public struct Request: DNSBaseStageBaseRequest {
            var languageCode: String
        }
        public struct Response: DNSBaseStageBaseResponse {
            var languageCode: String
        }
        public struct ViewModel: DNSBaseStageBaseViewModel {
            var languageCode: String
        }
    }
    public enum Weblink {
        public struct Request: DNSBaseStageBaseRequest {
            var field: String
            var weblink: URL?
        }
    }
}
