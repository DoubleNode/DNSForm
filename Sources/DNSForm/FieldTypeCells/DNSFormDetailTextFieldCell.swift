//
//  DNSFormDetailTextFieldCell.swift
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

public protocol DNSFormDetailTextFieldCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTextFieldCell: DNSBaseStageCollectionViewCell,
   DNSFormDetailTextFieldCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 74)
    static public let heightForSection: Double = recommendedContentSize.height

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
        public var alertMessage: String = ""

        public init(field: String, formatPattern: String = "", label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, text: String, type: DNSFormFieldType = .none) {
            self.field = field
            self.formatPattern = formatPattern
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.text = text
            self.type = type
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                textField.hideAlert()
                textField.isEnabled = false
                textField.formatPattern = ""
                textField.keyboardType = .default
                textField.returnKeyType = .next
                textField.type = .none
                textField.placeholder = ""
                textField.title = ""
                textField.text = ""
                return
            }
            textField.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: textField)
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
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
                self.utilityDisplayAlert(data.alertMessage, for: textField)
            }
        }
    }

    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

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
