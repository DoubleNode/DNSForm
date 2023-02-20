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
        public var errored = false
        public var label: String
        public var lineBottomOffset: Double
        public var readonly = false
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
                lineView.layer.borderColor = UIColor.DNSForm.Field.Default.Line.normal.cgColor
                lineViewBottomConstraint.constant = 0
                sectionLabel.text = ""
                sectionLabel.textColor = UIColor.white
                sectionLabelWidthConstraint.isActive = true
                titleView.backgroundColor = UIColor.DNSForm.Field.Default.Line.normal
                titleView.layer.borderColor = UIColor.DNSForm.Field.Default.Line.normal.cgColor
                return
            }
            if data.readonly {
                lineView.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
                sectionLabel.textColor = UIColor.systemGray
                titleView.backgroundColor =  UIColor(white: 0.8, alpha: 1.0)
                titleView.layer.borderColor =  UIColor(white: 0.8, alpha: 1.0).cgColor
            } else {
                lineView.layer.borderColor = UIColor.DNSForm.Field.Default.Line.normal.cgColor
                sectionLabel.textColor = UIColor.white
                titleView.backgroundColor = UIColor.DNSForm.Field.Default.Line.normal
                titleView.layer.borderColor = UIColor.DNSForm.Field.Default.Line.normal.cgColor
            }
            if data.errored {
                lineView.layer.borderColor = UIColor.DNSForm.Field.Default.Alert.text.cgColor
                titleView.backgroundColor = UIColor.DNSForm.Field.Default.Alert.text
                titleView.layer.borderColor = UIColor.DNSForm.Field.Default.Alert.text.cgColor
            }
            lineViewBottomConstraint.constant = data.lineBottomOffset   // - 23
            sectionLabel.text = data.label
            if data.sectionLabelWidth == -1 {
                sectionLabelWidthConstraint.isActive = false
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
    @IBOutlet var titleView: UIView!

    // MARK: - Outgoing Pipelines -

    override open func contentInit() {
        super.contentInit()
        data = nil
    }
}
