//
//  DNSFormDetailImageSelectorCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import AnimatedField
import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCore
import DNSCoreThreading
import DNSDataObjects
import DNSProtocols
import UIKit

public protocol DNSFormDetailImageSelectorCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var imageDeleteActionPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var imagePopupActionPublisher: PassthroughSubject<Stage.Models.ImagePopup.Request, Never> { get }
    var imageSelectActionPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailImageSelectorCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailImageSelectorCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 100)

    var lastMedia: DAOMedia?

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var media: DAOMedia?
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var alertMessage: String = ""

        public init(field: String, label: String, languageCode: String, media: DAOMedia? = nil, placeholder: String, readonly: Bool, required: Bool) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.media = media
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
        }
    }
    public var data: Data? {
        didSet {
            self.activityIndicator.stopAnimating()
            guard let data = self.data else {
                self.deleteButton.isEnabled = false
                self.selectButton.isEnabled = false
                self.progressView.setProgress(0.0, animated: false)
                self.progressView.isHidden = true
                self.imageView.image = nil
                self.lastMedia = nil
                return
            }
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
            self.alertLabel.style = data.style.alertStyle
            self.alertLabel.text = data.alertMessage

            self.titleLabel.style = data.style.titleStyle
            self.titleLabel.text = data.label + languageLabel

            self.progressView.setProgress(0.0, animated: false)
            self.progressView.isHidden = true

            let lastUrl = self.lastMedia?.url.asURL(for: data.languageCode)
            let mediaUrl = data.media?.url.asURL(for: data.languageCode)
            guard mediaUrl != lastUrl else {
                return
            }

            self.deleteButton.isEnabled = !data.readonly
            self.selectButton.isEnabled = !data.readonly

            self.lastMedia = data.media
            self.imageView.image = nil
            self.progressView.isHidden = false
            if let mediaUrl {
                self.deleteButton.isEnabled = data.readonly ? false : true
                self.selectButton.isEnabled = false
                self.imageView.af
                    .setImage(withURL: mediaUrl,
                              cacheKey: mediaUrl.absoluteString,
                              progress: { (progress) in
                        self.progressView.setProgress(Float(progress.fractionCompleted),
                                                      animated: true)
                        self.progressView.isHidden = (progress.fractionCompleted >= 1.0)
                    },
                              imageTransition: UIImageView.ImageTransition.crossDissolve(0.2))
            } else {
                self.deleteButton.isEnabled = false
                self.selectButton.isEnabled = data.readonly ? false : true
            }
        }
    }

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var alertLabel: DNSUILabel!
    @IBOutlet var deleteButton: DNSUIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: DNSUILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var selectButton: DNSUIButton!

    // MARK: - Outgoing Pipelines -
    public var imageDeleteActionPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var imagePopupActionPublisher = PassthroughSubject<Stage.Models.ImagePopup.Request, Never>()
    public var imageSelectActionPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - Action Methods -
    @IBAction func deleteButtonAction(_ sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        self.activityIndicator.stopAnimating()
        imageDeleteActionPublisher
            .send(DNSFormStage.Models.Field.Request(field: data.field,
                                                    languageCode: data.languageCode))
    }
    @IBAction func imagePopupButtonAction(_ sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        guard let image = self.imageView.image else { return }
        imagePopupActionPublisher
            .send(DNSFormStage.Models.ImagePopup.Request(field: data.field,
                                                         image: image,
                                                         message: data.placeholder,
                                                         title: data.label))
    }
    @IBAction func selectButtonAction(_ sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        self.activityIndicator.startAnimating()
        imageSelectActionPublisher
            .send(DNSFormStage.Models.Field.Request(field: data.field,
                                                    languageCode: data.languageCode))
    }
}
