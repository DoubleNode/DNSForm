//
//  DNSFormDetailSaveButtonCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCoreThreading
import UIKit

public protocol DNSFormDetailSaveButtonCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var pushActionPublisher: PassthroughSubject<Stage.Models.Base.Request, Never> { get }
}
open class DNSFormDetailSaveButtonCell: DNSBaseStageCollectionViewCell,
                                        DNSFormDetailSaveButtonCellLogic {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 72)

    public struct Data: Hashable {
        public var enabled: Bool
        public var label: String
        public var newObject: Bool
        public var newObjectLabel: String

        public init(enabled: Bool, label: String, newObject: Bool, newObjectLabel: String) {
            self.enabled = enabled
            self.label = label
            self.newObject = newObject
            self.newObjectLabel = newObjectLabel
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.button.isEnabled = false
                return
            }
            let label = data.newObject ? data.newObjectLabel : data.label
            self.button.setTitle(label,
                                 for: UIControl.State.normal)
            self.button.isEnabled = data.enabled
        }
    }

    @IBOutlet var button: DNSUIButton!

    // MARK: - Outgoing Pipelines -
    public let pushActionPublisher = PassthroughSubject<Stage.Models.Base.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        button.style = DNSThemeButtonStyle.DNSForm.default
        button.setTitle("", for: UIControl.State.normal)
    }

    // MARK: - Action Methods -
    @IBAction func selectButtonAction(_ sender: UIButton) {
        try? self.analyticsWorker?.doAutoTrack(class: String(describing: self), method: "\(#function)")
        pushActionPublisher.send(Stage.Models.Base.Request())
    }
}
