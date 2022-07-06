//
//  DNSFormDetailActionButtonCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCoreThreading
import SFSymbol
import UIKit

public protocol DNSFormDetailActionButtonCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var pushActionPublisher: PassthroughSubject<Stage.Models.Base.Request, Never> { get }
}

class DNSFormDetailActionButtonCell: DNSBaseStageCollectionViewCell, DNSFormDetailActionButtonCellLogic {
    public typealias Stage = DNSFormDetailStage
    static let recommendedContentSize = CGSize(width: 414, height: 72)

    public struct Data: Hashable {
        var enabled: Bool
        var label: String
        var style: DNSThemeButtonStyle
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.iconButton.isEnabled = false
                self.textButton.isEnabled = false
                return
            }
            let iconImage = UIImage(dnsSystemSymbol: .arrowshapeTurnUpRightFill)
            self.iconButton.style = data.style
            self.iconButton.setImage(iconImage, for: UIControl.State.normal)
            self.iconButton.isEnabled = data.enabled

            self.textButton.style = data.style
            self.textButton.setTitle(data.label, for: UIControl.State.normal)
            self.textButton.isEnabled = data.enabled
        }
    }

    @IBOutlet var iconButton: DNSUIButton!
    @IBOutlet var textButton: DNSUIButton!

    // MARK: - Outgoing Pipelines -
    public let pushActionPublisher = PassthroughSubject<Stage.Models.Base.Request, Never>()

    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.default

        let iconImage = UIImage(dnsSystemSymbol: .arrowshapeTurnUpRightFill)
        iconButton.style = DNSThemeButtonStyle.DNSForm.actionRight
        iconButton.setImage(iconImage, for: UIControl.State.normal)

        textButton.style = DNSThemeButtonStyle.DNSForm.actionLeft
        textButton.setTitle("", for: UIControl.State.normal)
        data = nil
    }

    // MARK: - Action Methods -
    @IBAction func selectButtonAction(_ sender: UIButton) {
        try? self.analyticsWorker?.doAutoTrack(class: String(describing: self), method: "\(#function)")
        pushActionPublisher.send(Stage.Models.Base.Request())
    }
}
