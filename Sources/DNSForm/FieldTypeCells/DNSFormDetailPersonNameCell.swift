//
//  DNSFormDetailPersonNameCell.swift
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

public protocol DNSFormDetailPersonNameCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeValuePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailPersonNameCell: DNSBaseStageCollectionViewCell,
                                        DNSFormDetailPersonNameCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 256)
    public enum CodingKeys: String, CodingKey {
        case familyName, givenName, middleName, nickname
    }

    public struct Data: Hashable {
        public var field: String
        public var labels: [CodingKeys: String]
        public var placeholders: [CodingKeys: String]
        public var readonly: Bool
        public var required: Bool
        public var returnKeyType: UIReturnKeyType = .next
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var value: AnyHashable
        public var alertMessages: [CodingKeys: String] = [
            .familyName: "", .givenName: "", .middleName: "", .nickname: "",
        ]

        public init(field: String, labels: [CodingKeys: String], placeholders: [CodingKeys: String],
                    readonly: Bool, required: Bool, value: AnyHashable) {
            self.field = field
            self.labels = labels
            self.placeholders = placeholders
            self.readonly = readonly
            self.required = required
            self.value = value
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data,
                  let value = data.value as? PersonNameComponents else {
                utilityClearTextField(familyNameTextField)
                utilityClearTextField(givenNameTextField)
                utilityClearTextField(middleNameTextField)
                utilityClearTextField(nicknameTextField)
                return
            }
            familyNameTextField.style = data.style
            givenNameTextField.style = data.style
            middleNameTextField.style = data.style
            nicknameTextField.style = data.style

//            self.utilityDisplayAlert(data.alertMessages[.familyName], for: familyNameTextField)
//            self.utilityDisplayAlert(data.alertMessages[.givenName], for: givenNameTextField)
//            self.utilityDisplayAlert(data.alertMessages[.middleName], for: middleNameTextField)
//            self.utilityDisplayAlert(data.alertMessages[.nickname], for: nicknameTextField)

            familyNameTextField.keyboardType = .namePhonePad
            familyNameTextField.returnKeyType = .next
            familyNameTextField.isEnabled = !data.readonly
            familyNameTextField.type = .text(data.labels[.familyName] ?? "", data.required ? 1 : 0, 128)
            familyNameTextField.placeholder = data.placeholders[.familyName] ?? ""
            familyNameTextField.title = data.labels[.familyName] ?? ""
            if familyNameTextField.text != value.familyName {
                familyNameTextField.text = value.familyName ?? ""
                self.utilityDisplayAlert(data.alertMessages[.familyName], for: familyNameTextField)
            }
            familyNameTextField.autocapitalizationType = .words

            givenNameTextField.keyboardType = .namePhonePad
            givenNameTextField.returnKeyType = .next
            givenNameTextField.isEnabled = !data.readonly
            givenNameTextField.type = .text(data.labels[.givenName] ?? "", data.required ? 1 : 0, 128)
            givenNameTextField.placeholder = data.placeholders[.givenName] ?? ""
            givenNameTextField.title = data.labels[.givenName] ?? ""
            if givenNameTextField.text != value.givenName {
                givenNameTextField.text = value.givenName ?? ""
                self.utilityDisplayAlert(data.alertMessages[.givenName], for: givenNameTextField)
            }
            givenNameTextField.autocapitalizationType = .words

            middleNameTextField.keyboardType = .namePhonePad
            middleNameTextField.returnKeyType = .next
            middleNameTextField.isEnabled = !data.readonly
            middleNameTextField.type = .text(data.labels[.middleName] ?? "", 0, 128)
            middleNameTextField.placeholder = data.placeholders[.middleName] ?? ""
            middleNameTextField.title = data.labels[.middleName] ?? ""
            if middleNameTextField.text != value.middleName {
                middleNameTextField.text = value.middleName ?? ""
                self.utilityDisplayAlert(data.alertMessages[.middleName], for: middleNameTextField)
            }
            middleNameTextField.autocapitalizationType = .words

            nicknameTextField.keyboardType = .namePhonePad
            nicknameTextField.returnKeyType = data.returnKeyType
            nicknameTextField.isEnabled = !data.readonly
            nicknameTextField.type = .text(data.labels[.nickname] ?? "", 0, 128)
            nicknameTextField.placeholder = data.placeholders[.nickname] ?? ""
            nicknameTextField.title = data.labels[.nickname] ?? ""
            if nicknameTextField.text != value.nickname {
                nicknameTextField.text = value.nickname ?? ""
                self.utilityDisplayAlert(data.alertMessages[.nickname], for: nicknameTextField)
            }
            nicknameTextField.autocapitalizationType = .words
        }
    }

    @IBOutlet var familyNameTextField: DNSUIAnimatedField!
    @IBOutlet var givenNameTextField: DNSUIAnimatedField!
    @IBOutlet var middleNameTextField: DNSUIAnimatedField!
    @IBOutlet var nicknameTextField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeValuePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        familyNameTextField.dataSource = self
        familyNameTextField.delegate = self
        givenNameTextField.dataSource = self
        givenNameTextField.delegate = self
        middleNameTextField.dataSource = self
        middleNameTextField.delegate = self
        nicknameTextField.dataSource = self
        nicknameTextField.delegate = self
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        if animatedField.returnKeyType == .done {
            _ = animatedField.resignFirstResponder()
            return true
        }
        if animatedField.returnKeyType == .next {
            if animatedField == givenNameTextField {
                _ = familyNameTextField.becomeFirstResponder()
            } else if animatedField == familyNameTextField {
                _ = middleNameTextField.becomeFirstResponder()
            } else if animatedField == middleNameTextField {
                _ = nicknameTextField.becomeFirstResponder()
            } else if animatedField == nicknameTextField {
                _ = animatedField.resignFirstResponder()
            }
            return true
        }
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data,
              let oldValue = data.value as? PersonNameComponents else { return }
        var newValue = oldValue
        newValue.familyName = familyNameTextField.text?.trimmingCharacters(in: [" "]) ?? ""
        newValue.givenName = givenNameTextField.text?.trimmingCharacters(in: [" "]) ?? ""
        newValue.middleName = middleNameTextField.text?.trimmingCharacters(in: [" "]) ?? ""
        newValue.nickname = nicknameTextField.text?.trimmingCharacters(in: [" "]) ?? ""
        
        if familyNameTextField.isValid { familyNameTextField.hideAlert() } else { familyNameTextField.showAlert() }
        if givenNameTextField.isValid { givenNameTextField.hideAlert() } else { givenNameTextField.showAlert() }
        if middleNameTextField.isValid { middleNameTextField.hideAlert() } else { middleNameTextField.showAlert() }
        if nicknameTextField.isValid { nicknameTextField.hideAlert() } else { nicknameTextField.showAlert() }
        guard newValue != oldValue else { return }
        let request = Stage.Models.Field
            .Request(field: data.field, languageCode: DNSCore.languageCode, value: newValue)
        changeValuePublisher.send(request)
    }

    // MARK: - Utility methods -
    func utilityClearTextField(_ textField: DNSUIAnimatedField) {
        textField.hideAlert()
        textField.isEnabled = false
        textField.isSecure = false
        textField.formatPattern = ""
        textField.keyboardType = .namePhonePad
        textField.returnKeyType = .next
        textField.lowercased = false
        textField.uppercased = false
        textField.autocapitalizationType = .words
        textField.type = .none
        textField.placeholder = ""
        textField.title = ""
        textField.text = ""
    }

    func utilityDisplayAlert(_ alertMessage: String?,
                             for field: DNSUIAnimatedField) {
        let alertMessage = alertMessage ?? ""
        if alertMessage.isEmpty {
            if field.isValid { field.hideAlert() }
        } else {
            field.showAlert(alertMessage)
        }
    }
}
