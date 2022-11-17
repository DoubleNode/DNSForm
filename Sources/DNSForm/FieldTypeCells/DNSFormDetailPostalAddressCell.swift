//
//  DNSFormDetailPostalAddressCell.swift
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

public protocol DNSFormDetailPostalAddressCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeValuePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailPostalAddressCell: DNSBaseStageCollectionViewCell,
                                           DNSFormDetailPostalAddressCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 128)
    public enum CodingKeys: String, CodingKey {
        case city, postalCode, state, street
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
            .city: "", .postalCode: "", .state: "", .street: "",
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
                utilityClearTextField(cityTextField)
                utilityClearTextField(postalCodeTextField)
                utilityClearTextField(stateTextField)
                utilityClearTextField(streetTextField)
                return
            }
            cityTextField.style = data.style
            postalCodeTextField.style = data.style
            stateTextField.style = data.style
            streetTextField.style = data.style

            self.utilityDisplayAlert(data.alertMessages[.city], for: cityTextField)
            self.utilityDisplayAlert(data.alertMessages[.postalCode], for: postalCodeTextField)
            self.utilityDisplayAlert(data.alertMessages[.state], for: stateTextField)
            self.utilityDisplayAlert(data.alertMessages[.street], for: streetTextField)

            cityTextField.keyboardType = .namePhonePad
            cityTextField.returnKeyType = .next
            cityTextField.autocapitalizationType = .words
            cityTextField.isEnabled = !data.readonly
            cityTextField.type = .text(data.labels[.city] ?? "", data.required ? 1 : 0, 128)
            cityTextField.placeholder = data.placeholders[.city] ?? ""
            cityTextField.title = data.labels[.city] ?? ""
            if cityTextField.text != value.city {
                cityTextField.text = value.city
                self.utilityDisplayAlert(data.alertMessages[.city], for: cityTextField)
            }

            postalCodeTextField.keyboardType = .namePhonePad
            postalCodeTextField.returnKeyType = data.returnKeyType
            postalCodeTextField.uppercased = true
            postalCodeTextField.isEnabled = !data.readonly
            postalCodeTextField.type = .text(data.labels[.postalCode] ?? "", data.required ? 1 : 0, 16)
            postalCodeTextField.placeholder = data.placeholders[.postalCode] ?? ""
            postalCodeTextField.title = data.labels[.postalCode] ?? ""
            if postalCodeTextField.text != value.postalCode {
                postalCodeTextField.text = value.postalCode
                self.utilityDisplayAlert(data.alertMessages[.postalCode], for: postalCodeTextField)
            }

            stateTextField.keyboardType = .namePhonePad
            stateTextField.returnKeyType = .next
            stateTextField.uppercased = true
            stateTextField.isEnabled = !data.readonly
            stateTextField.type = .text(data.labels[.state] ?? "", data.required ? 1 : 0, 32)
            stateTextField.placeholder = data.placeholders[.state] ?? ""
            stateTextField.title = data.labels[.state] ?? ""
            if stateTextField.text != value.state {
                stateTextField.text = value.state
                self.utilityDisplayAlert(data.alertMessages[.state], for: stateTextField)
            }

            streetTextField.keyboardType = .default
            streetTextField.returnKeyType = .next
            streetTextField.autocapitalizationType = .words
            streetTextField.isEnabled = !data.readonly
            streetTextField.type = .text(data.labels[.street] ?? "", 0, 128)
            streetTextField.placeholder = data.placeholders[.street] ?? ""
            streetTextField.title = data.labels[.street] ?? ""
            if streetTextField.text != value.street {
                streetTextField.text = value.street
                self.utilityDisplayAlert(data.alertMessages[.street], for: streetTextField)
            }
        }
    }

    @IBOutlet var cityTextField: DNSUIAnimatedField!
    @IBOutlet var postalCodeTextField: DNSUIAnimatedField!
    @IBOutlet var stateTextField: DNSUIAnimatedField!
    @IBOutlet var streetTextField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeValuePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        cityTextField.dataSource = self
        cityTextField.delegate = self
        postalCodeTextField.dataSource = self
        postalCodeTextField.delegate = self
        stateTextField.dataSource = self
        stateTextField.delegate = self
        streetTextField.dataSource = self
        streetTextField.delegate = self
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
        guard let data = self.data,
              let oldValue = data.value as? DNSPostalAddress else { return }
        let newValue = oldValue
        if animatedField == self.cityTextField {
            newValue.city = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        } else if animatedField == self.postalCodeTextField {
            newValue.postalCode = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        } else if animatedField == self.stateTextField {
            newValue.state = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        } else if animatedField == self.streetTextField {
            newValue.street = animatedField.text?.trimmingCharacters(in: [" "]) ?? ""
        }
        guard animatedField.isValid else {
            animatedField.showAlert()
            let request = Stage.Models.Field.Request(field: data.field,
                                                     languageCode: DNSCore.languageCode,
                                                     value: newValue)
            self.changeValuePublisher.send(request)
            return
        }
        animatedField.hideAlert()
        guard newValue != oldValue else { return }
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: DNSCore.languageCode,
                                                 value: newValue)
        changeValuePublisher.send(request)
    }

    // MARK: - Utility methods -
    func utilityClearTextField(_ textField: DNSUIAnimatedField) {
        textField.hideAlert()
        textField.isEnabled = false
        textField.isSecure = false
        textField.formatPattern = ""
        textField.keyboardType = .default
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
