//
//  DNSFormDetailHeaderView.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols
import UIKit

open class DNSFormDetailHeaderView: DNSBaseStageCollectionReusableView {
    public typealias Stage = DNSFormDetailStage
    static let recommendedContentSize = CGSize(width: 414, height: 90)

    public struct Data: Hashable {
        var section: Int
        var title: String
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
    @IBOutlet var titleLabel: UILabel!
}
