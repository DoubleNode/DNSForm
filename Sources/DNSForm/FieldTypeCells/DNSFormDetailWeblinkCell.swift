//
//  DNSFormDetailWeblinkCell.swift
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

public protocol DNSFormDetailWeblinkCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var weblinkActionPublisher: PassthroughSubject<Stage.Models.Weblink.Request, Never> { get }
}
open class DNSFormDetailWeblinkCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailWeblinkCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 64)

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var weblink: URL?

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, weblink: URL? = nil) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.weblink = weblink
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                textField.isEnabled = false
                textField.type = .text("field", 0, 64)
                textField.placeholder = ""
                textField.title = ""
                textField.text = ""
                previewButton.isHidden = true
                previewImageView.isHidden = true
                return
            }
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"

            textField.isEnabled = !data.readonly
            textField.type = .text(data.label, data.required ? 1 : 0, 64)
            textField.placeholder = data.placeholder + languageLabel
            textField.title = data.label + languageLabel

            let text = data.weblink?.absoluteString ?? ""
            previewButton.isHidden = !text.contains("https://")
            previewImageView.isHidden = !text.contains("https://")

            if textField.text != text {
                textField.text = text
                if !textField.isValid {
                    textField.showAlert()
                }
            }
        }
    }

    @IBOutlet var previewButton: UIButton!
    @IBOutlet var previewImageView: UIImageView!
    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var weblinkActionPublisher = PassthroughSubject<Stage.Models.Weblink.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.type = .text("field", 0, 64)
        textField.placeholder = "field"
        textField.title = "field"
        textField.keyboardType = .URL
        textField.isSecure = false

        textField.dataSource = self
        textField.delegate = self
        textField.returnKeyType = UIReturnKeyType.next

        previewButton.isHidden = true
        previewImageView.isHidden = true
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
//    public func animatedFieldDidChange(_ animatedField: AnimatedField) {
//        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
//        guard let data = self.data else { return }
//        let origText = data.weblink?.absoluteString ?? ""
//        guard textField.text != origText else { return }
//        let text = textField.text
//        let request = Stage.Models.Field.Request(field: data.field,
//                                                 languageCode: data.languageCode,
//                                                 value: text)
//        DNSThread.run {
//            self.changeTextPublisher.send(request)
//        }
//    }
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
        let origText = data.weblink?.absoluteString ?? ""
        guard textField.text != origText else { return }
        let text = textField.text
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: data.languageCode,
                                                 value: text)
        changeTextPublisher.send(request)
    }

    // MARK: - Action Methods -
    @IBAction func weblinkButtonAction(_ sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        guard let weblink = data.weblink else { return }
        weblinkActionPublisher
            .send(Stage.Models.Weblink.Request(field: data.field,
                                               weblink: weblink))
    }
}
