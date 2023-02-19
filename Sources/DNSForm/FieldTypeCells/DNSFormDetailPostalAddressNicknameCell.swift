//
//  DNSFormDetailPostalAddressNicknameCell.swift
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

public protocol DNSFormDetailPostalAddressNicknameCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeValuePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailPostalAddressNicknameCell: DNSBaseStageCollectionViewCell,
                           DNSFormDetailPostalAddressNicknameCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 192)
    public enum CodingKeys: String, CodingKey {
        case city, nickname, postalCode, state, street
    }

    public struct Data: Hashable {
        public var field: String
        public var subfield: String = ""
        public var labels: [CodingKeys: String]
        public var placeholders: [CodingKeys: String]
        public var readonly: Bool
        public var required: Bool
        public var returnKeyType: UIReturnKeyType = .next
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var value: AnyHashable
        public var alertMessages: [CodingKeys: String] = [
            .city: "", .nickname: "", .postalCode: "", .state: "", .street: "",
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
                  let value = data.value as? DNSPostalAddress else {
                nicknameTextField.hideAlert()
                streetTextField.hideAlert()
                cityTextField.hideAlert()
                stateTextField.hideAlert()
                postalCodeTextField.hideAlert()
                utilityClearTextField(nicknameTextField)
                utilityClearTextField(streetTextField)
                utilityClearTextField(cityTextField)
                utilityClearTextField(stateTextField)
                utilityClearTextField(postalCodeTextField)
                return
            }
            if nicknameTextField.style != data.style {
                nicknameTextField.style = data.style
            }
            if streetTextField.style != data.style {
                streetTextField.style = data.style
            }
            if cityTextField.style != data.style {
                cityTextField.style = data.style
            }
            if stateTextField.style != data.style {
                stateTextField.style = data.style
            }
            if postalCodeTextField.style != data.style {
                postalCodeTextField.style = data.style
            }

            nicknameTextField.autocapitalizationType = .words
            nicknameTextField.keyboardType = .default
            nicknameTextField.returnKeyType = .next
            nicknameTextField.autocapitalizationType = .words
            nicknameTextField.isEnabled = !data.readonly
            nicknameTextField.type = .text(data.labels[.nickname] ?? "", data.required ? 1 : 0, 128)
            nicknameTextField.placeholder = data.placeholders[.nickname] ?? ""
            nicknameTextField.title = data.labels[.nickname] ?? ""

            streetTextField.autocapitalizationType = .words
            streetTextField.keyboardType = .default
            streetTextField.returnKeyType = .next
            streetTextField.autocapitalizationType = .words
            streetTextField.isEnabled = !data.readonly
            streetTextField.type = .text(data.labels[.street] ?? "", data.required ? 1 : 0, 128)
            streetTextField.placeholder = data.placeholders[.street] ?? ""
            streetTextField.title = data.labels[.street] ?? ""

            cityTextField.autocapitalizationType = .words
            cityTextField.keyboardType = .namePhonePad
            cityTextField.returnKeyType = .next
            cityTextField.isEnabled = !data.readonly
            cityTextField.type = .text(data.labels[.city] ?? "", data.required ? 1 : 0, 128)
            cityTextField.placeholder = data.placeholders[.city] ?? ""
            cityTextField.title = data.labels[.city] ?? ""

            stateTextField.autocapitalizationType = .words
            stateTextField.keyboardType = .namePhonePad
            stateTextField.returnKeyType = .next
            stateTextField.uppercased = true
            stateTextField.isEnabled = !data.readonly
            stateTextField.type = .text(data.labels[.state] ?? "", data.required ? 1 : 0, 32)
            stateTextField.placeholder = data.placeholders[.state] ?? ""
            stateTextField.title = data.labels[.state] ?? ""

            postalCodeTextField.autocapitalizationType = .words
            postalCodeTextField.keyboardType = .namePhonePad
            postalCodeTextField.returnKeyType = data.returnKeyType
            postalCodeTextField.uppercased = true
            postalCodeTextField.isEnabled = !data.readonly
            postalCodeTextField.type = .text(data.labels[.postalCode] ?? "", data.required ? 1 : 0, 16)
            postalCodeTextField.placeholder = data.placeholders[.postalCode] ?? ""
            postalCodeTextField.title = data.labels[.postalCode] ?? ""

            if data.subfield == CodingKeys.nickname.rawValue {
                self.utilityUpdateText(value.street, for: .street, and: streetTextField)
                self.utilityUpdateText(value.city, for: .city, and: cityTextField)
                self.utilityUpdateText(value.state, for: .state, and: stateTextField)
                self.utilityUpdateText(value.postalCode, for: .postalCode, and: postalCodeTextField)
                self.utilityUpdateText(value.nickname, for: .nickname, and: nicknameTextField)
            } else if data.subfield == CodingKeys.street.rawValue {
                self.utilityUpdateText(value.nickname, for: .nickname, and: nicknameTextField)
                self.utilityUpdateText(value.city, for: .city, and: cityTextField)
                self.utilityUpdateText(value.state, for: .state, and: stateTextField)
                self.utilityUpdateText(value.postalCode, for: .postalCode, and: postalCodeTextField)
                self.utilityUpdateText(value.street, for: .street, and: streetTextField)
            } else if data.subfield == CodingKeys.city.rawValue {
                self.utilityUpdateText(value.nickname, for: .nickname, and: nicknameTextField)
                self.utilityUpdateText(value.street, for: .street, and: streetTextField)
                self.utilityUpdateText(value.state, for: .state, and: stateTextField)
                self.utilityUpdateText(value.postalCode, for: .postalCode, and: postalCodeTextField)
                self.utilityUpdateText(value.city, for: .city, and: cityTextField)
            } else if data.subfield == CodingKeys.state.rawValue {
                self.utilityUpdateText(value.nickname, for: .nickname, and: nicknameTextField)
                self.utilityUpdateText(value.street, for: .street, and: streetTextField)
                self.utilityUpdateText(value.city, for: .city, and: cityTextField)
                self.utilityUpdateText(value.postalCode, for: .postalCode, and: postalCodeTextField)
                self.utilityUpdateText(value.state, for: .state, and: stateTextField)
            } else /* if data.subfield == CodingKeys.postalCode.rawValue */ {
                self.utilityUpdateText(value.nickname, for: .nickname, and: nicknameTextField)
                self.utilityUpdateText(value.street, for: .street, and: streetTextField)
                self.utilityUpdateText(value.city, for: .city, and: cityTextField)
                self.utilityUpdateText(value.state, for: .state, and: stateTextField)
                self.utilityUpdateText(value.postalCode, for: .postalCode, and: postalCodeTextField)
            }
        }
    }

    @IBOutlet var nicknameTextField: DNSUIAnimatedField!
    @IBOutlet var streetTextField: DNSUIAnimatedField!
    @IBOutlet var cityTextField: DNSUIAnimatedField!
    @IBOutlet var stateTextField: DNSUIAnimatedField!
    @IBOutlet var postalCodeTextField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeValuePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        nicknameTextField.dataSource = self
        nicknameTextField.delegate = self
        streetTextField.dataSource = self
        streetTextField.delegate = self
        cityTextField.dataSource = self
        cityTextField.delegate = self
        stateTextField.dataSource = self
        stateTextField.delegate = self
        postalCodeTextField.dataSource = self
        postalCodeTextField.delegate = self
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
//        if animatedField.returnKeyType == .done {
            _ = animatedField.resignFirstResponder()
            return true
//        }
//        if animatedField.returnKeyType == .next {
//            if animatedField == streetTextField {
//                _ = cityTextField.becomeFirstResponder()
//            } else if animatedField == cityTextField {
//                _ = stateTextField.becomeFirstResponder()
//            } else if animatedField == stateTextField {
//                _ = postalCodeTextField.becomeFirstResponder()
//            } else if animatedField == postalCodeTextField {
//                _ = animatedField.resignFirstResponder()
//            }
//            return true
//        }
//        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        if animatedField == nicknameTextField {
            nicknameAnimatedFieldDidEndEditing(animatedField)
        } else if animatedField == streetTextField {
            streetAnimatedFieldDidEndEditing(animatedField)
        } else if animatedField == cityTextField {
            cityAnimatedFieldDidEndEditing(animatedField)
        } else if animatedField == stateTextField {
            stateAnimatedFieldDidEndEditing(animatedField)
        } else if animatedField == postalCodeTextField {
            postalCodeAnimatedFieldDidEndEditing(animatedField)
        }
    }
    public func nicknameAnimatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        guard let data = self.data,
              let oldValue = data.value as? DNSPostalAddress else { return }
        let newValue = oldValue.copy() as! DNSPostalAddress
        newValue.nickname = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        if animatedField.isValid { animatedField.hideAlert() } else { animatedField.showAlert() }
        guard newValue != oldValue else { return }
        var request = Stage.Models.Field
            .Request(field: data.field, languageCode: DNSCore.languageCode, value: newValue)
        request.subfield = CodingKeys.nickname.rawValue
        changeValuePublisher.send(request)
    }
    public func streetAnimatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        guard let data = self.data,
              let oldValue = data.value as? DNSPostalAddress else { return }
        let newValue = oldValue.copy() as! DNSPostalAddress
        newValue.street = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        if animatedField.isValid { animatedField.hideAlert() } else { animatedField.showAlert() }
        guard newValue != oldValue else { return }
        var request = Stage.Models.Field
            .Request(field: data.field, languageCode: DNSCore.languageCode, value: newValue)
        request.subfield = CodingKeys.street.rawValue
        changeValuePublisher.send(request)
    }
    public func cityAnimatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        guard let data = self.data,
              let oldValue = data.value as? DNSPostalAddress else { return }
        let newValue = oldValue.copy() as! DNSPostalAddress
        newValue.city = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        if animatedField.isValid { animatedField.hideAlert() } else { animatedField.showAlert() }
        guard newValue != oldValue else { return }
        var request = Stage.Models.Field
            .Request(field: data.field, languageCode: DNSCore.languageCode, value: newValue)
        request.subfield = CodingKeys.city.rawValue
        changeValuePublisher.send(request)
    }
    public func stateAnimatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        guard let data = self.data,
              let oldValue = data.value as? DNSPostalAddress else { return }
        let newValue = oldValue.copy() as! DNSPostalAddress
        newValue.state = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        if animatedField.isValid { animatedField.hideAlert() } else { animatedField.showAlert() }
        guard newValue != oldValue else { return }
        var request = Stage.Models.Field
            .Request(field: data.field, languageCode: DNSCore.languageCode, value: newValue)
        request.subfield = CodingKeys.state.rawValue
        changeValuePublisher.send(request)
    }
    public func postalCodeAnimatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        guard let data = self.data,
              let oldValue = data.value as? DNSPostalAddress else { return }
        let newValue = oldValue.copy() as! DNSPostalAddress
        newValue.postalCode = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        if animatedField.isValid { animatedField.hideAlert() } else { animatedField.showAlert() }
        guard newValue != oldValue else { return }
        var request = Stage.Models.Field
            .Request(field: data.field, languageCode: DNSCore.languageCode, value: newValue)
        request.subfield = CodingKeys.postalCode.rawValue
        changeValuePublisher.send(request)
    }

    // MARK: - Utility methods -
    func utilityClearTextField(_ textField: DNSUIAnimatedField) {
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
    func utilityUpdateText(_ text: String?, for field: CodingKeys, and textField: DNSUIAnimatedField) {
        if textField.text != text {
            textField.text = text ?? ""
            guard let data else { return }
            self.utilityDisplayAlert(data.alertMessages[field], for: textField)
        }
    }
}
