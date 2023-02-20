//
//  DNSFormDetailSectionFooterCell.swift
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

public protocol DNSFormDetailSectionFooterCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var actionPublisher: PassthroughSubject<Stage.Models.Section.Request, Never> { get }
}
open class DNSFormDetailSectionFooterCell: DNSBaseStageCollectionViewCell,
                                           DNSFormDetailSectionFooterCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 34)
    
    public struct Data: Hashable {
        public var actionLabel: String = ""
        public var actionLabelWidth: Double = -1
        public var readonly = false
        public var section: Int

        public init(actionLabel: String = "", actionLabelWidth: Double = -1, section: Int) {
            self.actionLabel = actionLabel
            self.actionLabelWidth = actionLabelWidth
            self.section = section
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                actionLabel.text = ""
                actionLabel.textColor = UIColor.white
                actionLabelWidthConstraint.isActive = true
                actionView.isHidden = true
                return
            }
            if data.readonly {
                actionView.isHidden = true
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
            }
        }
    }

    @IBOutlet var actionButton: UIButton!
    @IBOutlet var actionLabel: DNSUILabel!
    @IBOutlet var actionLabelWidthConstraint: NSLayoutConstraint!
    @IBOutlet var actionView: DNSUIView!

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
