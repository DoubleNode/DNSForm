//
//  DNSFormDetailSubHeaderView.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols
import DNSThemeObjects
import UIKit

open class DNSFormDetailSubHeaderView: DNSBaseStageCollectionReusableView {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 71)
    static public let heightForSection: Double = recommendedContentSize.height

    public struct Data: Hashable {
        public var section: Int
        public var title: String

        public init(section: Int, title: String) {
            self.section = section
            self.title = title
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                titleLabel.text = ""
                return
            }
            titleLabel.text = data.title
        }
    }
    @IBOutlet var titleLabel: DNSUILabel!
    
    override open func contentInit() {
        super.contentInit()
        data = nil
    }
}
