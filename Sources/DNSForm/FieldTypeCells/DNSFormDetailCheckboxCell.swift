//
//  DNSFormDetailCheckboxCell.swift
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

public protocol DNSFormDetailCheckboxCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var selectedPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailCheckboxCell: DNSBaseStageCollectionViewCell,
                                      DNSFormDetailCheckboxCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 52)
    static public let heightForSection: Double = recommendedContentSize.height
    static public var defaultImageChecked = UIImage(dnsSymbol: SFSymbol.Checkmark.squareFill)
    static public var defaultImageUnchecked = UIImage(dnsSymbol: SFSymbol.square)

    public struct Data: Hashable {
        public var checked: Bool
        public var detailText: String
        public var field: String
        public var readonly: Bool
        public var required: Bool
        public var titleText: String
        public var imageChecked: UIImage? = DNSFormDetailCheckboxCell.defaultImageChecked
        public var imageUnchecked: UIImage? = DNSFormDetailCheckboxCell.defaultImageUnchecked

        public init(checked: Bool, detailText: String, field: String, readonly: Bool, required: Bool, titleText: String) {
            self.checked = checked
            self.detailText = detailText
            self.field = field
            self.readonly = readonly
            self.required = required
            self.titleText = titleText
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.checkImageView.image = DNSFormDetailCheckboxCell.defaultImageUnchecked
                return
            }
            self.checkImageView.image = data.checked ? data.imageChecked : data.imageUnchecked
            self.checkImageView.tintColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.detailLabel.isEnabled = !data.readonly
            self.detailLabel.text = data.detailText
            self.titleLabel.isEnabled = !data.readonly
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
        data = nil
    }

    // MARK: - Action methods -
    @IBAction func selectAction(sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        selectedPublisher.send(Stage.Models.Field.Request(field: data.field,
                                                          languageCode: "",
                                                          value: !data.checked))
    }
}
