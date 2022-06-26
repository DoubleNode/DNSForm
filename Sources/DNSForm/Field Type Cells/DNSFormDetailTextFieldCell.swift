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
    static let recommendedContentSize = CGSize(width: 414, height: 64)

    public struct Data: Hashable {
        var field: String
        var label: String
        var languageCode: String
        var placeholder: String
        var readonly: Bool
        var required: Bool
        var text: String
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
