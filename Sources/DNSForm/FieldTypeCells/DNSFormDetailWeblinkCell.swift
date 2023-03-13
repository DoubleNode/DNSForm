//
//  DNSFormDetailWeblinkCell.swift
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

public protocol DNSFormDetailWeblinkCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var weblinkActionPublisher: PassthroughSubject<Stage.Models.Weblink.Request, Never> { get }
}
open class DNSFormDetailWeblinkCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailWeblinkCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 64)
    static public let heightForSection: Double = recommendedContentSize.height

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var weblink: URL?
        public var alertMessage: String = ""

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, weblink: URL? = nil) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.weblink = weblink
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
                previewButton.isHidden = true
                previewImageView.isHidden = true
                return
            }
            textField.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: textField)
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
            textField.type = .text(data.label, data.required ? 1 : 0, 64)
            textField.placeholder = data.placeholder + languageLabel
            textField.isEnabled = !data.readonly
            textField.title = data.label + languageLabel

            let text = data.weblink?.absoluteString ?? ""
            previewButton.isHidden = !text.contains("https://")
            previewImageView.isHidden = !text.contains("https://")

            if textField.text != text {
                textField.text = text
                self.utilityDisplayAlert(data.alertMessage, for: textField)
            }
        }
    }

    @IBOutlet var previewButton: UIButton!
    @IBOutlet var previewImageView: UIImageView!
    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var weblinkActionPublisher = PassthroughSubject<Stage.Models.Weblink.Request, Never>()

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

        previewButton.isHidden = true
        previewImageView.isHidden = true
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
            let text = textField.text
            let request = Stage.Models.Field.Request(field: data.field,
                                                     languageCode: data.languageCode,
                                                     value: text)
            changeTextPublisher.send(request)
            return
        }
        textField.hideAlert()
        let origText = data.weblink?.absoluteString ?? ""
        guard textField.text != origText else { return }
        let text = textField.text
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: data.languageCode,
                                                 value: text)
        changeTextPublisher.send(request)
    }

    // MARK: - Action Methods -
    @IBAction func weblinkButtonAction(_ sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        guard let data = self.data else { return }
        guard let weblink = data.weblink else { return }
        weblinkActionPublisher
            .send(Stage.Models.Weblink.Request(field: data.field,
                                               weblink: weblink))
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
