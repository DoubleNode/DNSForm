//
//  DNSFormDetailTextEditorCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

//import AnimatedField
import Combine
import DNSBaseStage
import DNSCore
import DNSCoreThreading
import DNSProtocols
import DNSThemeObjects
import DNSThemeTypes
import Proton
import UIKit

public protocol DNSFormDetailTextEditorCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeTextPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTextEditorCell: DNSBaseStageCollectionViewCell, DNSFormDetailTextEditorCellLogic /*,
                                            AnimatedFieldDelegate, AnimatedFieldDataSource */ {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 257)
    static public let heightForSection: Double = recommendedContentSize.height

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
//                editorView.hideAlert()
//                editorView.placeholder = ""
//                editorView.title = ""
                editorView?.attributedText = NSAttributedString(string: "")
                return
            }
            backView.style = data.styleBackground
//            editorView.style = data.style
//            self.utilityDisplayAlert(data.alertMessage, for: editorView)
            self.lineView.backgroundColor = data.readonly ? UIColor.lightGray : UIColor.black
//            let languageLabel = data.languageCode.isEmpty ? "" : " (\(data.languageCode))"
//            editorView.isEnabled = !data.readonly
//            editorView.placeholder = data.placeholder + languageLabel
//            editorView.title = data.label + languageLabel
            editorView?.autocapitalizationType = data.autocapitalizationType
//            if editorView.text != data.text {
                editorView?.attributedText = NSAttributedString(string: data.text)
//                self.utilityDisplayAlert(data.alertMessage, for: editorView)
//            }
        }
    }

    var editorView: EditorView?

    @IBOutlet var backView: DNSUIView!
    @IBOutlet var lineView: DNSUIView!
    @IBOutlet var placeHolderView: DNSUIView!

    // MARK: - Outgoing Pipelines -
    public var changeTextPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
//        editorView.type = .multiline
//        editorView.placeholder = ""
//        editorView.title = ""
        editorView?.keyboardType = .default
//        editorView.isSecure = false
//        editorView.dataSource = self
//        editorView.delegate = self
        editorView?.returnKeyType = UIReturnKeyType.done
    }
    override open func contentInit() {
        super.contentInit()
        editorView = EditorView(frame: placeHolderView.frame)
        self.editorView?.setFocus()
//        lineView.backgroundColor = editorView.format.lineColor
        data = nil
    }

//    // MARK: - AnimatedFieldDataSource methods
//    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
//        _ = animatedField.resignFirstResponder()
//        return true
//    }
//    public func animatedFieldLimit(_ animatedField: AnimatedField) -> Int? {
//        return 300
//    }
//
//    // MARK: - AnimatedFieldDelegate methods
//    public func animatedFieldDidBeginEditing(_ animatedField: AnimatedField) {
//        self.utilityAutoTrack("\(#function)")
//        lineView.backgroundColor = editorView.format.lineColor
//    }
//    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
//        self.utilityAutoTrack("\(#function)")
//        lineView.backgroundColor = editorView.format.lineColor
//        guard let data = self.data else { return }
//        guard editorView.isValid else {
//            editorView.showAlert()
//            let text = editorView.text
//            let request = Stage.Models.Field.Request(field: data.field,
//                                                     languageCode: data.languageCode,
//                                                     value: text)
//            changeTextPublisher.send(request)
//            return
//        }
//        editorView.hideAlert()
//        guard editorView.text != data.text else { return }
//        let text = editorView.text
//        let request = Stage.Models.Field.Request(field: data.field,
//                                                 languageCode: data.languageCode,
//                                                 value: text)
//        changeTextPublisher.send(request)
//    }
    
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
