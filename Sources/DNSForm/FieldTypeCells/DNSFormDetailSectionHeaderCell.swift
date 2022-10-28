//
//  DNSFormDetailSectionHeaderCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCore
import DNSProtocols
import SFSymbol
import UIKit

public protocol DNSFormDetailSectionHeaderCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
}
open class DNSFormDetailSectionHeaderCell: DNSBaseStageCollectionViewCell,
                                           DNSFormDetailSectionHeaderCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 42)
    
    public struct Data: Hashable {
        public var label: String
        public var lineBottomOffset: Double
        public var section: Int
        public var sectionLabelWidth: Double

        public init(label: String, lineBottomOffset: Double, section: Int,
                    sectionLabelWidth: Double = 120) {
            self.label = label
            self.lineBottomOffset = lineBottomOffset
            self.section = section
            self.sectionLabelWidth = sectionLabelWidth
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                lineViewBottomConstraint.constant = 0
                sectionLabel.text = ""
                sectionLabelWidthConstraint.isActive = true
                return
            }
            lineViewBottomConstraint.constant = data.lineBottomOffset
            sectionLabel.text = data.label
            if data.sectionLabelWidth == -1 {
                sectionLabelWidthConstraint.isActive = true
            } else {
                sectionLabelWidthConstraint.isActive = true
                sectionLabelWidthConstraint.constant = data.sectionLabelWidth
            }
        }
    }
    
    @IBOutlet var lineView: UIView!
    @IBOutlet var lineViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var sectionLabel: DNSUILabel!
    @IBOutlet var sectionLabelWidthConstraint: NSLayoutConstraint!

    override open func contentInit() {
        super.contentInit()
        data = nil
    }
}
