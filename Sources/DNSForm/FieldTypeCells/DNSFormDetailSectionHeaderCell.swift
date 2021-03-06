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
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
}
open class DNSFormDetailSectionHeaderCell: DNSBaseStageCollectionViewCell,
                                           DNSFormDetailSectionHeaderCellLogic {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 30)
    
    public struct Data: Hashable {
        public var label: String
        public var lineBottomOffset: Double
        public var section: Int
        
        public init(label: String, lineBottomOffset: Double, section: Int) {
            self.label = label
            self.lineBottomOffset = lineBottomOffset
            self.section = section
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                lineViewBottomConstraint.constant = 0
                sectionLabel.text = ""
                return
            }
            lineViewBottomConstraint.constant = data.lineBottomOffset
            sectionLabel.text = data.label
        }
    }
    
    @IBOutlet var lineView: UIView!
    @IBOutlet var lineViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var sectionLabel: DNSUILabel!
    
    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.clear
        sectionLabel.style = DNSThemeLabelStyle.DNSForm.section
        data = nil
    }
}
