//
//  DNSFormDetailCheckboxCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCore
import DNSProtocols
import SFSymbol
import UIKit

public protocol DNSFormDetailCheckboxCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var selectedPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailCheckboxCell: DNSBaseStageCollectionViewCell,
                                      DNSFormDetailCheckboxCellLogic {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 52)

    public struct Data: Hashable {
        public var checked: Bool
        public var detailText: String
        public var field: String
        public var titleText: String

        public init(checked: Bool, detailText: String, field: String, titleText: String) {
            self.checked = checked
            self.detailText = detailText
            self.field = field
            self.titleText = titleText
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.checkImageView.image = UIImage(dnsSystemSymbol: SFSymbol.square)
                return
            }
            let symbol = data.checked ? SFSymbol.checkmarkSquareFill : SFSymbol.square
            self.checkImageView.image = UIImage(dnsSystemSymbol: symbol)
            self.detailLabel.text = data.detailText
            self.titleLabel.text = data.titleText
        }
    }

    @IBOutlet var checkImageView: UIImageView!
    @IBOutlet var detailLabel: DNSUILabel!
    @IBOutlet var titleLabel: DNSUILabel!

    // MARK: - Outgoing Pipelines -
    public var selectedPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.clear
        detailLabel.style = DNSThemeLabelStyle.DNSForm.field
        titleLabel.style = DNSThemeLabelStyle.DNSForm.title
        data = nil
    }

    // MARK: - Action methods -
    @IBAction func selectAction(sender: UIButton) {
        try? self.analyticsWorker?.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        selectedPublisher.send(Stage.Models.Field.Request(field: data.field,
                                                          languageCode: "",
                                                          value: !data.checked))
    }
}
