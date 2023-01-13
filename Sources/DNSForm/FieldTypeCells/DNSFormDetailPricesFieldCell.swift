//
//  DNSFormDetailPricesFieldCell.swift
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

public protocol DNSFormDetailPricesFieldCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailPricesFieldCell: DNSBaseStageCollectionViewCell,
   DNSFormDetailPricesFieldCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 64)

    public struct Data: Hashable {
        public struct FieldData: Hashable {
            public var field: String = ""
            public var label: String
            public var languageCode: String
            public var maximumPrice: Float = 999999.00
            public var placeholder: String
            public var readonly: Bool
            public var required: Bool
            public var returnKeyType: UIReturnKeyType = .next
            public var style: DNSThemeFieldStyle = .DNSForm.default
            public var price: Float

            public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool,
                        required: Bool, price: Float) {
                self.field = field
                self.label = label
                self.languageCode = languageCode
                self.placeholder = placeholder
                self.readonly = readonly
                self.required = required
                self.price = price
            }
        }
        public var alertMessage: String = ""
        public var fieldData1: Data.FieldData
        public var fieldData2: Data.FieldData

        public init(fieldData1: Data.FieldData, fieldData2: Data.FieldData) {
            self.fieldData1 = fieldData1
            self.fieldData2 = fieldData2
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                utilityReset(textField1)
                utilityReset(textField2)
                return
            }
            utilityUpdate(textField1, with: data.fieldData1)
            self.utilityDisplayAlert(data.alertMessage, for: textField1)

            utilityUpdate(textField2, with: data.fieldData2)
            self.utilityDisplayAlert(data.alertMessage, for: textField2)
        }
    }

    @IBOutlet var textField1: DNSUIAnimatedField!
    @IBOutlet var textField2: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField1.dataSource = self
        textField1.delegate = self
        textField2.dataSource = self
        textField2.delegate = self
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
        var fieldData: Data.FieldData? = nil
        if animatedField == textField1 {
            fieldData = data.fieldData1
        } else if animatedField == textField2 {
            fieldData = data.fieldData2
        }
        guard let fieldData else { return }
        guard animatedField.isValid else {
            animatedField.showAlert()
            let text = animatedField.text
            let request = Stage.Models.Field.Request(field: fieldData.field,
                                                     languageCode: fieldData.languageCode,
                                                     value: text)
            changeTextPublisher.send(request)
            return
        }
        animatedField.hideAlert()
        let newText = animatedField.text.orEmpty
        let newPrice = Float(newText)
        guard newPrice != fieldData.price else { return }
        let request = Stage.Models.Field.Request(field: fieldData.field,
                                                 languageCode: fieldData.languageCode,
                                                 value: newPrice)
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
    func utilityReset(_ textField: DNSUIAnimatedField) {
        textField.hideAlert()
        textField.isEnabled = false
        textField.formatPattern = ""
        textField.keyboardType = .default
        textField.returnKeyType = .next
        textField.type = .none
        textField.placeholder = ""
        textField.title = ""
        textField.text = ""
    }
    func utilityUpdate(_ textField: DNSUIAnimatedField,
                       with fieldData: Data.FieldData) {
        textField.style = fieldData.style
        let languageLabel = fieldData.languageCode.isEmpty ? "" : " (\(fieldData.languageCode))"
        textField.isEnabled = !fieldData.readonly
        textField.isSecure = false
        textField.keyboardType = .decimalPad
        textField.returnKeyType = fieldData.returnKeyType
        textField.type = .price(Double(fieldData.maximumPrice), 2)
        textField.placeholder = fieldData.placeholder + languageLabel
        textField.title = fieldData.label + languageLabel
        let newText = "\(fieldData.price)"
        if textField.text != newText {
            textField.text = newText
        }
    }
}
