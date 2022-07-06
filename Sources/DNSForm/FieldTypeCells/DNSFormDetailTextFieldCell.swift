//
//  DNSFormDetailTextFieldCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
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
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var text: String

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, text: String) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.text = text
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                textField.isEnabled = false
                textField.type = .text("field", 0, 64)
                textField.placeholder = ""
                textField.text = ""
                return
            }
            textField.isEnabled = !data.readonly
            textField.type = .text(data.label, data.required ? 1 : 0, 64)
            textField.placeholder = data.placeholder + " (\(data.languageCode))"

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
        textField.type = .text("field", 0, 64)
        textField.placeholder = "field"
        textField.keyboardType = .default
        textField.isSecure = false
        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next
    }
    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.default
        data = nil
    }

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        try? self.analyticsWorker?.doAutoTrack(class: String(describing: self), method: "\(#function)")
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
