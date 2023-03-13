//
//  DNSFormDetailTextSelectionCell.swift
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

public protocol DNSFormDetailTextSelectionCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTextSelectionCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailTextSelectionCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
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
        public var resultStrings: [String: String]
        public var selectionStrings: [String]
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var text: String
        public var selectedText = ""
        public var alertMessage: String = ""

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, resultStrings: [String: String], text: String) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.resultStrings = resultStrings
            self.selectionStrings = resultStrings.values.map { $0 }
            self.selectedText = resultStrings[text] ?? text
            self.text = text
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
                return
            }
            textField.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: textField)
            textField.type = .stringpicker(data.selectedText,
                                           data.selectionStrings,
                                           data.label)
            textField.placeholder = data.placeholder
            textField.isEnabled = !data.readonly
            textField.title = data.label

            if textField.text != data.selectedText {
                textField.text = data.selectedText
                self.utilityDisplayAlert(data.alertMessage, for: textField)
            }
        }
    }

    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.keyboardType = .namePhonePad
        textField.isSecure = false
        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next
    }
    override open func contentInit() {
        super.contentInit()
        textField.keyboardAppearance = .dark
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
            let text = data.resultStrings.keys.reduce("") { (textField.text == data.resultStrings[$1]) ? $1 : $0 }
            let request = Stage.Models.Field.Request(field: data.field,
                                                     languageCode: data.languageCode,
                                                     value: text)
            changeTextPublisher.send(request)
            return
        }
        textField.hideAlert()
        guard textField.text != data.selectedText else { return }
        let text = data.resultStrings.keys.reduce("") { (textField.text == data.resultStrings[$1]) ? $1 : $0 }
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: data.languageCode,
                                                 value: text)
        changeTextPublisher.send(request)
    }
    public func animatedField(_ animatedField: AnimatedField,
                              didChangePickerValue value: String) {
        self.utilityAutoTrack("\(#function)")
//        self.textField.text = value
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
