//
//  DNSFormDetailDateCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import AnimatedField
import Combine
import DNSBaseStage
import DNSCore
import DNSCoreThreading
import DNSProtocols
import DNSThemeObjects
import DNSThemeTypes
import SFSymbol
import UIKit

public protocol DNSFormDetailDateCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeDatePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailDateCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailDateCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 86)
    static public let heightForSection: Double = recommendedContentSize.height

    static public var defaultImage = UIImage(dnsSymbol: SFSymbol.calendar)
    static public var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        return dateFormatter
    }()

    public struct Data: Hashable {
        public var date: Date
        public var dateLabel: String
        public var datePlaceholder: String
        public var field: String
        public var languageCode: String
        public var minimumDate: Date?
        public var maximumDate: Date?
        public var readonly: Bool
        public var required: Bool
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var alertMessage: String = ""
        public var image: UIImage? = DNSFormDetailDateCell.defaultImage

        public init(date: Date, dateLabel: String, datePlaceholder: String, field: String, languageCode: String, readonly: Bool, required: Bool) {
            self.date = date
            self.dateLabel = dateLabel
            self.datePlaceholder = datePlaceholder
            self.field = field
            self.languageCode = languageCode
            self.readonly = readonly
            self.required = required
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                dateTextField.hideAlert()
                self.datePicker.date = Date()
                return
            }
            dateTextField.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: dateTextField)
            self.dateIcon.image = data.image
            self.dateIcon.tintColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.dateLabel.text = data.dateLabel
            self.dateLabel.isEnabled = !data.readonly
            self.datePicker.date = data.date
            self.datePicker.isEnabled = !data.readonly
            let datePickerColor = data.readonly ? data.style.pickerTextColor.disabled : data.style.pickerTextColor.normal
            self.datePicker.setValue(datePickerColor, forKey: "textColor")
            self.datePickerLineView.backgroundColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.dateTextField.placeholder = data.datePlaceholder
            self.dateTextField.isEnabled = !data.readonly
            self.dateTextField.title = data.dateLabel
            self.dateTextField.text = Self.dateFormatter.string(from: data.date)
            self.dateTextField.type = .datepicker(.date, datePicker.date, data.minimumDate,
                                                  data.maximumDate, data.datePlaceholder,
                                                  Self.dateFormatter.dateFormat)
        }
    }

    @IBOutlet var dateIcon: UIImageView!
    @IBOutlet var dateLabel: DNSUILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePickerLineView: UIView!
    @IBOutlet var dateTextField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changeDatePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    // MARK: - Incoming Pipelines -
    var subscribers: [AnyCancellable] = []

    override open func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 14, *) {
            datePicker.alpha = 1
            datePickerLineView.alpha = 1
            dateTextField.alpha = 0
        } else {
            datePicker.alpha = 0
            datePickerLineView.alpha = 0
            dateTextField.alpha = 1
            dateTextField.placeholder = "SELECT DATE"   // TODO: Localize
            dateTextField.title = "DATE"   // TODO: Localize
            dateTextField.dataSource = self
            dateTextField.delegate = self
        }
    }
    override open func contentInit() {
        super.contentInit()
        self.contentInitDatePicker()
        self.data = nil
    }
    func contentInitDatePicker() {
        datePicker.contentHorizontalAlignment = .left
        datePicker.date = Date()
        datePicker.timeZone = NSTimeZone.local
        datePicker.tintColor = dateTextField.format.highlightColor
        datePicker.setValue(dateTextField.format.pickerTextColor, forKey: "textColor")

        dateTextField.keyboardAppearance = .dark
        dateTextField.type = .none
    }

    // MARK: - Workers -

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.utilityAutoTrack("\(#function)")
        guard let data = self.data else { return }
        let date = Self.dateFormatter.date(from: dateTextField.text!) ?? Date()
        dateTextField.hideAlert()
        changeDatePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                            languageCode: "",
                                                            value: date))
    }

    // MARK: - Action methods -
    @IBAction func dateValueChangedAction(sender: UIDatePicker) {
        self.utilityAutoTrack("\(#function)")
        guard let data = self.data else { return }
        _ = dateTextField.becomeFirstResponder()
        _ = dateTextField.resignFirstResponder()
        let date = datePicker.date
        changeDatePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                            languageCode: "",
                                                            value: date))
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
