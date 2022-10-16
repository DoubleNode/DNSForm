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
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTextFieldCell: DNSBaseStageCollectionViewCell,
   DNSFormDetailTextFieldCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 64)

    public struct Data: Hashable {
        public var field: String
        public var formatPattern: String
        public var keyboardType: UIKeyboardType = .default
        public var label: String
        public var languageCode: String
        public var lowercaseOnly = false
        public var maximumLength: Int = 128
        public var maximumPrice: Double = 999999.00
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var returnKeyType: UIReturnKeyType = .next
        public var text: String
        public var type: DNSFormFieldType = .none
        public var uppercaseOnly = false

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
                textField.isEnabled = false
                textField.formatPattern = ""
                textField.keyboardType = .default
                textField.returnKeyType = .next
                textField.type = .text("field", 0, 128)
                textField.placeholder = ""
                textField.text = ""
                return
            }
            textField.isEnabled = !data.readonly
            textField.isSecure = false
            textField.formatPattern = data.formatPattern
            textField.keyboardType = data.keyboardType
            textField.returnKeyType = data.returnKeyType
            textField.lowercased = data.lowercaseOnly
            textField.uppercased = data.uppercaseOnly
            switch data.type {
            case .none, .text:
                textField.type = .text(data.label, data.required ? 1 : 0, data.maximumLength)
            case .email:
                textField.type = .email
            case .password:
                textField.type = .password(data.required ? 1 : 0, data.maximumLength)
                textField.isSecure = true
            case .price:
                textField.type = .price(data.maximumPrice, 2)
            case .url:
                textField.type = .url(data.label, data.required ? 1 : 0)
            case .username:
                textField.type = .username(data.required ? 1 : 0, data.maximumLength)
            }
            textField.placeholder = data.placeholder + " (\(data.languageCode))"
            
            if textField.text != data.text {
                textField.text = data.text
                if !textField.isValid {
                    textField.showAlert()
                }
            }
        }
    }

    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.type = .text("field", 0, 128)
        textField.placeholder = "field"
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
        guard textField.text != data.text else { return }
        let text = textField.text
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: data.languageCode,
                                                 value: text)
        changeTextPublisher.send(request)
    }
}
