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
    var actionPublisher: PassthroughSubject<Stage.Models.Section.Request, Never> { get }
}
open class DNSFormDetailSectionHeaderCell: DNSBaseStageCollectionViewCell,
                                           DNSFormDetailSectionHeaderCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 42)
    
    public struct Data: Hashable {
        public var actionLabel: String = ""
        public var actionLabelWidth: Double = -1
        public var errored = false
        public var label: String
        public var lineBottomOffset: Double
        public var readonly = false
        public var section: Int
        public var sectionLabelWidth: Double

        public init(actionLabel: String = "", actionLabelWidth: Double = -1,
                    label: String, lineBottomOffset: Double, section: Int,
                    sectionLabelWidth: Double = 120) {
            self.actionLabel = actionLabel
            self.actionLabelWidth = actionLabelWidth
            self.label = label
            self.lineBottomOffset = lineBottomOffset
            self.section = section
            self.sectionLabelWidth = sectionLabelWidth
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                actionLabel.text = ""
                actionLabel.textColor = UIColor.white
                actionLabelWidthConstraint.isActive = true
                actionView.isHidden = true
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
                actionView.isHidden = true
                lineView.layer.borderColor = UIColor(white: 0.8, alpha: 1.0).cgColor
                sectionLabel.textColor = UIColor.systemGray
                titleView.backgroundColor =  UIColor(white: 0.8, alpha: 1.0)
                titleView.layer.borderColor =  UIColor(white: 0.8, alpha: 1.0).cgColor
            } else {
                actionLabel.text = data.actionLabel
                actionLabel.textColor = UIColor.white
                actionView.isHidden = false
                if data.actionLabelWidth == -1 {
                    actionLabelWidthConstraint.isActive = false
                } else {
                    actionLabelWidthConstraint.isActive = true
                    actionLabelWidthConstraint.constant = data.actionLabelWidth
                }
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
            lineViewBottomConstraint.constant = data.lineBottomOffset - 20
            sectionLabel.text = data.label
            if data.sectionLabelWidth == -1 {
                sectionLabelWidthConstraint.isActive = false
            } else {
                sectionLabelWidthConstraint.isActive = true
                sectionLabelWidthConstraint.constant = data.sectionLabelWidth
            }
        }
    }

    @IBOutlet var actionButton: UIButton!
    @IBOutlet var actionLabel: DNSUILabel!
    @IBOutlet var actionLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet var actionView: DNSUIView!
    @IBOutlet var lineView: UIView!
    @IBOutlet var lineViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var sectionLabel: DNSUILabel!
    @IBOutlet var sectionLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet var titleView: UIView!

    // MARK: - Outgoing Pipelines -
    public var actionPublisher = PassthroughSubject<Stage.Models.Section.Request, Never>()

    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - Action Methods -
    @IBAction func buttonAction(_ sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data else { return }
        let request = Stage.Models.Section.Request(section: data.section,
                                                   languageCode: DNSCore.languageCode)
        actionPublisher.send(request)
    }
}
