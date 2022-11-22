//
//  DNSFormDetailTextViewCell.swift
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

public protocol DNSFormDetailTextViewCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTextViewCell: DNSBaseStageCollectionViewCell,
                                 DNSFormDetailTextViewCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 257)

    public struct Data: Hashable {
        public var autocapitalizationType: UITextAutocapitalizationType = .none
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var style: DNSThemeFieldStyle = .DNSForm.textView
        public var styleBackground: DNSThemeViewStyle = .DNSForm.textViewBackground
        public var text: String
        public var alertMessage: String = ""

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
                textView.hideAlert()
                textView.placeholder = ""
                textView.title = ""
                textView.text = ""
                return
            }
            backView.style = data.styleBackground
            textView.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: textView)
            self.lineView.backgroundColor = data.readonly ? UIColor.lightGray : UIColor.black
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
            textView.isEnabled = !data.readonly
            textView.placeholder = data.placeholder + languageLabel
            textView.title = data.label + languageLabel
            textView.autocapitalizationType = data.autocapitalizationType
            if textView.text != data.text {
                textView.text = data.text
                self.utilityDisplayAlert(data.alertMessage, for: textView)
            }
        }
    }

    @IBOutlet var backView: DNSUIView!
    @IBOutlet var lineView: DNSUIView!
    @IBOutlet var textView: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textView.type = .multiline
        textView.placeholder = ""
        textView.title = ""
        textView.keyboardType = .default
        textView.isSecure = false
        textView.dataSource = self
        textView.delegate = self
        textView.returnKeyType = UIReturnKeyType.done
    }
    override open func contentInit() {
        super.contentInit()
        lineView.backgroundColor = textView.format.lineColor
        data = nil
    }

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }
    public func animatedFieldLimit(_ animatedField: AnimatedField) -> Int? {
        return 300
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidBeginEditing(_ animatedField: AnimatedField) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        lineView.backgroundColor = textView.format.lineColor
    }
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        lineView.backgroundColor = textView.format.lineColor
        guard let data = self.data else { return }
        guard textView.isValid else {
            textView.showAlert()
            let text = textView.text
            let request = Stage.Models.Field.Request(field: data.field,
                                                     languageCode: data.languageCode,
                                                     value: text)
            changeTextPublisher.send(request)
            return
        }
        textView.hideAlert()
        guard textView.text != data.text else { return }
        let text = textView.text
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
