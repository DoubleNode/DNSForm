//
//  DNSFormDetailSearchButtonCell.swift
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

public protocol DNSFormDetailSearchButtonCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var pushActionPublisher: PassthroughSubject<Stage.Models.Base.Request, Never> { get }
}
open class DNSFormDetailSearchButtonCell: DNSBaseStageCollectionViewCell, DNSFormDetailSearchButtonCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 72)
    static public let heightForSection: Double = recommendedContentSize.height

    static public var defaultImage = UIImage(dnsSymbol: SFSymbol.magnifyingglass)
    public struct Data: Hashable {
        public var enabled: Bool
        public var label: String
        public var image: UIImage? = DNSFormDetailSearchButtonCell.defaultImage

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
            self.button.setImage(data.image, for: .normal)
            self.button.setTitle(data.label, for: .normal)
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
        data = nil
    }

    // MARK: - Action Methods -
    @IBAction func selectButtonAction(_ sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        pushActionPublisher.send(Stage.Models.Base.Request())
    }
}
