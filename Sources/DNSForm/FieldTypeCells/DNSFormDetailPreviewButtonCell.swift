//
//  DNSFormDetailPreviewButtonCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCoreThreading
import UIKit

public protocol DNSFormDetailPreviewButtonCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var pushActionPublisher: PassthroughSubject<Stage.Models.Base.Request, Never> { get }
}
open class DNSFormDetailPreviewButtonCell: DNSBaseStageCollectionViewCell, DNSFormDetailPreviewButtonCellLogic {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 72)

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
                self.button.isEnabled = false
                self.button.setTitle("", for: UIControl.State.normal)
                return
            }
            self.button.setTitle(data.label, for: UIControl.State.normal)
            self.button.isEnabled = data.enabled
        }
    }

    @IBOutlet var button: DNSUIButton!

    // MARK: - Outgoing Pipelines -
    public let pushActionPublisher = PassthroughSubject<Stage.Models.Base.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        button.setTitle("", for: UIControl.State.normal)
    }
    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.clear
        button.style = DNSThemeButtonStyle.DNSForm.preview
        data = nil
    }

    // MARK: - Action Methods -
    @IBAction func selectButtonAction(_ sender: UIButton) {
        self.analyticsWorker.doAutoTrack(class: String(describing: self), method: "\(#function)")
        pushActionPublisher.send(Stage.Models.Base.Request())
    }
}
