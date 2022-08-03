//
//  DNSFormDetailTextSelectionFieldCell.swift
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

public protocol DNSFormDetailTextSelectionFieldCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTextSelectionFieldCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailTextSelectionFieldCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 64)

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var selectionStrings: [String]
        public var text: String

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, selectionStrings: [String], text: String) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.selectionStrings = selectionStrings
            self.text = text
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                textField.isEnabled = false
                textField.type = .stringpicker("", [], "")
                textField.placeholder = ""
                textField.text = ""
                return
            }
            textField.isEnabled = !data.readonly
            textField.type = .stringpicker(data.text, data.selectionStrings, data.label)
            textField.placeholder = data.placeholder

            if textField.text != data.text {
                textField.text = data.text
                if !textField.isValid {
                    textField.showAlert()
                }
            }
        }
    }

    @IBOutlet var textField: AnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.format = Stage.AnimatedField.Format.default
        textField.keyboardType = .namePhonePad
        textField.isSecure = false
        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next
    }
    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.clear
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
        self.analyticsWorker.doAutoTrack(class: String(describing: self), method: "\(#function)")
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
    public func animatedField(_ animatedField: AnimatedField,
                              didChangePickerValue value: String) {
        self.analyticsWorker.doAutoTrack(class: String(describing: self), method: "\(#function)")
//        self.textField.text = value
    }
}
