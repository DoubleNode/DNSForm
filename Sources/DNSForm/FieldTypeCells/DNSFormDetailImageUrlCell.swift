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
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var imagePopupActionPublisher: PassthroughSubject<Stage.Models.Image.Request, Never> { get }
}
open class DNSFormDetailImageUrlCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailImageUrlCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 80)

    var lastURL: URL?

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var url: URL?

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
                textField.isEnabled = false
                textField.type = .url("field", 0)
                textField.placeholder = ""
                textField.text = ""
                self.progressView.setProgress(0.0, animated: false)
                self.progressView.isHidden = true
                self.imageView.image = nil
                self.lastURL = nil
                return
            }
            textField.isEnabled = !data.readonly
            textField.type = .url(data.label, data.required ? 1 : 0)
            textField.placeholder = data.placeholder + " (\(data.languageCode))"

            let lastString = self.lastURL?.absoluteString ?? ""
            let string = data.url?.absoluteString ?? ""
            if string != lastString {
                textField.text = string
                if !textField.isValid {
                    textField.showAlert()
                }

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
    public var imagePopupActionPublisher = PassthroughSubject<Stage.Models.Image.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.style = DNSThemeFieldStyle.DNSForm.default
        textField.type = .url("field", 0)
        textField.placeholder = "field"
        textField.keyboardType = .URL
        textField.isSecure = false
        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next
    }
    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.clear
        data = nil
    }

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
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
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        guard let image = self.imageView.image else { return }
        imagePopupActionPublisher
            .send(Stage.Models.Image.Request(field: data.field,
                                             image: image))
    }
}
