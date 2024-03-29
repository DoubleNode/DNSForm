//
//  DNSFormDetailActionButtonCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCoreThreading
import SFSymbol
import UIKit

public protocol DNSFormDetailActionButtonCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var pushActionPublisher: PassthroughSubject<Stage.Models.Base.Request, Never> { get }
}

open class DNSFormDetailActionButtonCell: DNSBaseStageCollectionViewCell, DNSFormDetailActionButtonCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 72)
    static public let heightForSection: Double = recommendedContentSize.height

    public struct Data: Hashable {
        public var enabled: Bool
        public var label: String

        public init(enabled: Bool, label: String) {
            self.enabled = enabled
            self.label = label
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.iconButton.isEnabled = false
                self.textButton.isEnabled = false
                return
            }
            self.iconButton.isEnabled = data.enabled
            self.textButton.isEnabled = data.enabled
            self.textButton.setTitle(data.label, for: UIControl.State.normal)
            self.textButton.accessibilityLabel = data.label
        }
    }

    @IBOutlet public var iconButton: DNSUIButton!
    @IBOutlet var textButton: DNSUIButton!

    // MARK: - Outgoing Pipelines -
    public let pushActionPublisher = PassthroughSubject<Stage.Models.Base.Request, Never>()

    override open func contentInit() {
        super.contentInit()
        textButton.setTitle("", for: UIControl.State.normal)
        self.textButton.accessibilityLabel = ""
        data = nil
    }

    // MARK: - Action Methods -
    @IBAction func selectButtonAction(_ sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        pushActionPublisher.send(Stage.Models.Base.Request())
    }
}
