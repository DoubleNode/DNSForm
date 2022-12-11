//
//  DNSFormDetailImageSelectorPlusCell.swift
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

public protocol DNSFormDetailImageSelectorPlusCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var imageDeleteActionPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var imagePopupActionPublisher: PassthroughSubject<Stage.Models.ImagePopup.Request, Never> { get }
    var imageSelectActionPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailImageSelectorPlusCell: DNSBaseStageCollectionViewCell,
                                               DNSFormDetailImageSelectorPlusCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 148)
    
    var lastURL: URL?
    
    public struct Data: Hashable {
        public var autocapitalizationType: UITextAutocapitalizationType = .none
        public var field: String
        public var formatPattern: String
        public var keyboardType: UIKeyboardType = .default
        public var label: String
        public var languageCode: String
        public var lowercaseOnly = false
        public var maximumLength: Int = 128
        public var maximumPrice: Double = 999999.00
        public var minimumLength: Int = 1
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var returnKeyType: UIReturnKeyType = .next
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var text: String
        public var type: DNSFormFieldType = .none
        public var uppercaseOnly = false
        public var url: URL?
        public var imageAlertMessage: String = ""
        public var textAlertMessage: String = ""
        
        public init(field: String, formatPattern: String = "", label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, text: String, type: DNSFormFieldType = .none, url: URL? = nil) {
            self.field = field
            self.formatPattern = formatPattern
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.text = text
            self.type = type
            self.url = url
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
                self.lastURL = nil
                
                self.textField.hideAlert()
                self.textField.isEnabled = false
                self.textField.formatPattern = ""
                self.textField.keyboardType = .default
                self.textField.returnKeyType = .next
                self.textField.type = .none
                self.textField.placeholder = ""
                self.textField.title = ""
                self.textField.text = ""
                return
            }
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
            self.alertLabel.style = data.style.alertStyle
            self.alertLabel.text = data.imageAlertMessage
            
            self.titleLabel.style = data.style.titleStyle
            self.titleLabel.text = data.label + languageLabel
            
            self.deleteButton.isEnabled = !data.readonly
            self.selectButton.isEnabled = !data.readonly
            
            self.progressView.setProgress(0.0, animated: false)
            self.progressView.isHidden = true
            
            let lastString = self.lastURL?.absoluteString ?? ""
            let string = data.url?.absoluteString ?? ""
            if let imageUrl = data.url {
                self.deleteButton.isEnabled = data.readonly ? false : true
                self.selectButton.isEnabled = false
                if string != lastString {
                    self.lastURL = imageUrl
                    self.progressView.isHidden = false
                    self.imageView.image = nil
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
            } else {
                self.deleteButton.isEnabled = false
                self.selectButton.isEnabled = data.readonly ? false : true
                if string != lastString {
                    self.lastURL = nil
                    self.imageView.image = nil
                }
            }
            
            textField.style = data.style
            self.utilityDisplayAlert(data.textAlertMessage, for: textField)
            textField.isEnabled = !data.readonly
            textField.isSecure = false
            textField.formatPattern = data.formatPattern
            textField.keyboardType = data.keyboardType
            textField.returnKeyType = data.returnKeyType
            textField.lowercased = data.lowercaseOnly
            textField.uppercased = data.uppercaseOnly
            textField.autocapitalizationType = data.autocapitalizationType
            switch data.type {
            case .none, .text:
                if case .text = textField.type { break }
                textField.type = .text(data.label, data.required ? data.minimumLength : 0,
                                       data.maximumLength)
            case .email:
                if case .email = textField.type { break }
                textField.type = .email
            case .password:
                if case .password = textField.type { break }
                textField.type = .password(data.required ? data.minimumLength : 0,
                                           data.maximumLength)
                textField.isSecure = true
            case .price:
                if case .price = textField.type { break }
                textField.type = .price(data.maximumPrice, 2)
            case .url:
                if case .url = textField.type { break }
                textField.type = .url(data.label, data.required ? data.minimumLength : 0)
            case .username:
                if case .username = textField.type { break }
                textField.type = .username(data.required ? data.minimumLength : 0,
                                           data.maximumLength)
            }
            textField.placeholder = data.placeholder + languageLabel
            textField.title = data.label + languageLabel
            
            if textField.text != data.text {
                textField.text = data.text
                self.utilityDisplayAlert(data.textAlertMessage, for: textField)
            }
        }
    }
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var alertLabel: DNSUILabel!
    @IBOutlet var deleteButton: DNSUIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var selectButton: DNSUIButton!
    @IBOutlet var textField: DNSUIAnimatedField!
    @IBOutlet var titleLabel: DNSUILabel!
    
    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var imageDeleteActionPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var imagePopupActionPublisher = PassthroughSubject<Stage.Models.ImagePopup.Request, Never>()
    public var imageSelectActionPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.type = .none
        textField.placeholder = "field"
        textField.title = "field"
        textField.keyboardType = .default
        textField.isSecure = false
        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = .next
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
            let text = textField.text
            let request = Stage.Models.Field.Request(field: data.field,
                                                     languageCode: data.languageCode,
                                                     value: text)
            changeTextPublisher.send(request)
            return
        }
        textField.hideAlert()
        guard textField.text != data.text else { return }
        let text = textField.text
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: data.languageCode,
                                                 value: text)
        changeTextPublisher.send(request)
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