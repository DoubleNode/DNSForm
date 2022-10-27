//
//  DNSFormDetailAppActionCell.swift
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
import DNSDataObjects
import DNSProtocols
import UIKit

public protocol DNSFormDetailAppActionCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var actionEditActionPublisher: PassthroughSubject<Stage.Models.AppAction.Request, Never> { get }
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var selectActionPublisher: PassthroughSubject<Stage.Models.AppAction.Request, Never> { get }
}
open class DNSFormDetailAppActionCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailAppActionCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 80)

    public struct Data: Hashable {
        public var field: String
        public var label: String
        public var languageCode: String
        public var placeholder: String
        public var readonly: Bool
        public var required: Bool
        public var selectMode: Bool
        public var appAction: DAOAppAction?

        public init(field: String, label: String, languageCode: String, placeholder: String, readonly: Bool, required: Bool, selectMode: Bool, appAction: DAOAppAction? = nil) {
            self.field = field
            self.label = label
            self.languageCode = languageCode
            self.placeholder = placeholder
            self.readonly = readonly
            self.required = required
            self.selectMode = selectMode
            self.appAction = appAction
        }
    }
    public var selectMode: Bool {
        guard let data = self.data else { return false }
        guard data.appAction != nil else { return false }
        return data.selectMode
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                textField.isEnabled = false
                textField.type = .text("field", 0, 64)
                textField.title = ""
                textField.placeholder = ""
                textField.text = ""
                self.progressView.setProgress(0.0, animated: false)
                self.progressView.isHidden = true
                self.imageView.image = nil
                self.selectModeView?.backgroundColor = UIColor.clear
                return
            }
            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
            self.selectModeView.isSelected = self.selectMode

            textField.isEnabled = false
            textField.type = .text(data.label, data.required ? 1 : 0, 64)
            textField.title = data.label + languageLabel
            textField.placeholder = data.placeholder + languageLabel

            textField.text = data.appAction?.title.asString(for: data.languageCode)

            self.progressView.setProgress(0.0, animated: false)
            self.progressView.isHidden = true
            self.imageView.image = nil
            if let imageUrl = data.appAction?.topImageUrl.asURL {
                self.progressView.isHidden = false
                self.imageView.af
                    .setImage(withURL: imageUrl,
                              cacheKey: imageUrl.absoluteString,
                              progress: { (progress) in
                        self.progressView.setProgress(Float(progress.fractionCompleted),
                                                      animated: true)
                        self.progressView.isHidden = (progress.fractionCompleted >= 1.0)
                    },
                              imageTransition: UIImageView.ImageTransition.crossDissolve(0.2))
            }
        }
    }

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var selectModeView: DNSUIView!
    @IBOutlet var textField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var actionEditActionPublisher = PassthroughSubject<Stage.Models.AppAction.Request, Never>()
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var selectActionPublisher = PassthroughSubject<Stage.Models.AppAction.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        textField.type = .url("field", 0)
        textField.placeholder = "field"
        textField.title = "field"
        textField.keyboardType = .URL
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
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
    }

    // MARK: - Action Methods -
    @IBAction func actionEditButtonAction(_ sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        if data.selectMode {
            guard self.selectMode else { return }
            selectActionPublisher
                .send(Stage.Models.AppAction.Request(field: data.field,
                                                     appAction: data.appAction))
            return
        }
        actionEditActionPublisher
            .send(Stage.Models.AppAction.Request(field: data.field,
                                                 appAction: data.appAction))
    }
}
