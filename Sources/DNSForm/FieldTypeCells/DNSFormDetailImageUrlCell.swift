//
//  DNSFormDetailImageUrlCell.swift
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
import DNSProtocols
import UIKit

public protocol DNSFormDetailImageUrlCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var imagePopupActionPublisher: PassthroughSubject<Stage.Models.ImagePopup.Request, Never> { get }
}
open class DNSFormDetailImageUrlCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailImageUrlCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 74)
    static public let heightForSection: Double = recommendedContentSize.height

    var lastURL: URL?

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var url: URL?
        public var alertMessage: String = ""

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, url: URL? = nil) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.url = url
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                textField.hideAlert()
                textField.isEnabled = false
                textField.type = .none
                textField.placeholder = ""
                textField.title = ""
                textField.text = ""
                self.progressView.setProgress(0.0, animated: false)
                self.progressView.isHidden = true
                self.imageView.image = nil
                self.lastURL = nil
                return
            }
            textField.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: textField)
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
            textField.isEnabled = !data.readonly
            textField.type = .url(data.label, data.required ? 1 : 0)
            textField.placeholder = data.placeholder + languageLabel
            textField.title = data.label + languageLabel

            let lastString = self.lastURL?.absoluteString ?? ""
            let string = data.url?.absoluteString ?? ""
            textField.text = string
            self.utilityDisplayAlert(data.alertMessage, for: textField)

            if string != lastString {
                self.progressView.setProgress(0.0, animated: false)
                self.progressView.isHidden = true
                self.imageView.image = nil
                self.lastURL = nil
                if let imageUrl = data.url {
                    self.lastURL = imageUrl
                    self.progressView.isHidden = false
                    self.imageView.af
                        .setImage(withURL: imageUrl,
                                  cacheKey: imageUrl.absoluteString,
                                  progress: { (progress) in
                            self.progressView.setProgress(Float(progress.fractionCompleted),
                                                          animated: true)
                            self.progressView.isHidden = (progress.fractionCompleted >= 1.0)
                        },
                                  imageTransition: UIImageView.ImageTransition.crossDissolve(0.2))
                }
            }
        }
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var imagePopupActionPublisher = PassthroughSubject<Stage.Models.ImagePopup.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.type = .none
        textField.placeholder = "field"
        textField.title = "field"
        textField.keyboardType = .URL
        textField.isSecure = false
        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.utilityAutoTrack("\(#function)")
        guard let data = self.data else { return }
        guard textField.isValid else {
            textField.showAlert()
            let url = URL(string: textField.text ?? "")
            let request = Stage.Models.Field.Request(field: data.field,
                                                     languageCode: data.languageCode,
                                                     value: url)
            changeTextPublisher.send(request)
            return
        }
        textField.hideAlert()
        let string = data.url?.absoluteString ?? ""
        guard textField.text != string else { return }
        let url = URL(string: textField.text ?? "")
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: data.languageCode,
                                                 value: url)
        changeTextPublisher.send(request)
    }

    // MARK: - Action Methods -
    @IBAction func imagePopupButtonAction(_ sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        guard let data = self.data else { return }
        guard let image = self.imageView.image else { return }
        let request = Stage.Models.ImagePopup.Request(field: data.field,
                                                      image: image,
                                                      message: data.placeholder,
                                                      title: data.label)
        imagePopupActionPublisher.send(request)
    }
    
    // MARK: - Utility methods -
    func utilityDisplayAlert(_ alertMessage: String,
                             for field: DNSUIAnimatedField) {
        if alertMessage.isEmpty {
            if field.isValid { field.hideAlert() }
        } else {
            field.showAlert(alertMessage)
        }
    }
}
