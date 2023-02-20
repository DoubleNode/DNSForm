//
//  DNSFormDetailDateTimeCell.swift
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
import SFSymbol
import UIKit

public protocol DNSFormDetailDateTimeCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changeDatePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailDateTimeCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailDateTimeCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 76)
    static public let heightForSection: Double = recommendedContentSize.height

    static public var defaultImageDate = UIImage(dnsSymbol: SFSymbol.calendar)
    static public var defaultImageTime = UIImage(dnsSymbol: SFSymbol.clock)
    static public var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter
    }()
    static public var timeFormatter: DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        return timeFormatter
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
        public var timeLabel: String
        public var timePlaceholder: String
        public var dateAlertMessage: String = ""
        public var timeAlertMessage: String = ""
        public var imageDate: UIImage? = DNSFormDetailDateTimeCell.defaultImageDate
        public var imageTime: UIImage? = DNSFormDetailDateTimeCell.defaultImageTime

        public init(date: Date, dateLabel: String, datePlaceholder: String, field: String, languageCode: String, readonly: Bool, required: Bool, timeLabel: String, timePlaceholder: String) {
            self.date = date
            self.dateLabel = dateLabel
            self.datePlaceholder = datePlaceholder
            self.field = field
            self.languageCode = languageCode
            self.readonly = readonly
            self.required = required
            self.timeLabel = timeLabel
            self.timePlaceholder = timePlaceholder
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                dateTextField.hideAlert()
                timeTextField.hideAlert()
                self.datePicker.date = Date()
                self.timePicker.date = Date()
                self.timeZeroLabel.isHidden = true
                return
            }
            dateTextField.style = data.style
            timeTextField.style = data.style
            self.utilityDisplayAlert(data.dateAlertMessage, for: dateTextField)
            self.utilityDisplayAlert(data.timeAlertMessage, for: timeTextField)

            self.dateIcon.image = data.imageDate
            self.dateIcon.tintColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.dateLabel.text = data.dateLabel
            self.dateLabel.isEnabled = !data.readonly
            self.datePicker.date = data.date
            self.datePicker.isEnabled = !data.readonly
            let datePickerColor = data.readonly ? data.style.textStyle.color.disabled : data.style.textStyle.color.normal
            self.datePicker.setValue(datePickerColor, forKey: "textColor")
            self.datePickerLineView.backgroundColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.dateTextField.placeholder = data.datePlaceholder
            self.dateTextField.isEnabled = !data.readonly
            self.dateTextField.title = data.dateLabel
            self.dateTextField.text = Self.dateFormatter.string(from: data.date)
            self.dateTextField.type = .datepicker(.date, datePicker.date, data.minimumDate,
                                                  data.maximumDate, data.datePlaceholder,
                                                  Self.dateFormatter.dateFormat)

            self.timeIcon.image = data.imageTime
            self.timeIcon.tintColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.timeLabel.text = data.timeLabel
            self.timeLabel.isEnabled = !data.readonly
            self.timePicker.date = data.date
            self.timePicker.isEnabled = !data.readonly
            let timePickerColor = data.readonly ? data.style.textStyle.color.disabled : data.style.textStyle.color.normal
            self.timePicker.setValue(timePickerColor, forKey: "textColor")
            self.timePickerLineView.backgroundColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.timeTextField.placeholder = data.timePlaceholder
            self.timeTextField.isEnabled = !data.readonly
            self.timeTextField.title = data.timeLabel

            let timeOfDay = DNSTimeOfDay(hour: data.date.dnsHour,
                                         minute: data.date.dnsMinute)
            self.timeZeroLabel.isHidden = (timeOfDay != Date.zeroTime)
            self.timeZeroLabel.isEnabled = !data.readonly
            self.timeTextField.text = Self.timeFormatter.string(from: data.date)
        }
    }

    @IBOutlet var dateIcon: UIImageView!
    @IBOutlet var dateLabel: DNSUILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePickerLineView: UIView!
    @IBOutlet var dateTextField: DNSUIAnimatedField!
    @IBOutlet var timeIcon: UIImageView!
    @IBOutlet var timeLabel: DNSUILabel!
    @IBOutlet var timeZeroLabel: UILabel!
    @IBOutlet var timePicker: UIDatePicker!
    @IBOutlet var timePickerLineView: UIView!
    @IBOutlet var timeTextField: DNSUIAnimatedField!

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
        if #available(iOS 14, *) {
            timePicker.alpha = 1
            timePickerLineView.alpha = 1
            timeTextField.alpha = 0
        } else {
            timePicker.alpha = 0
            timePickerLineView.alpha = 0
            timeTextField.alpha = 1
            timeTextField.placeholder = "SELECT TIME"   // TODO: Localize
            timeTextField.title = "TIME"   // TODO: Localize
            timeTextField.dataSource = self
            timeTextField.delegate = self
        }
    }
    override open func contentInit() {
        super.contentInit()
        self.contentInitDatePicker()
        self.contentInitTimePicker()
        self.data = nil
    }
    func contentInitDatePicker() {
        datePicker.contentHorizontalAlignment = .left
        datePicker.date = Date()
        datePicker.timeZone = NSTimeZone.local
        datePicker.tintColor = dateTextField.format.highlightColor

        dateTextField.keyboardAppearance = .dark
        dateTextField.type = .none
    }
    func contentInitTimePicker() {
        timePicker.contentHorizontalAlignment = .left
        timePicker.date = Date()
        timePicker.timeZone = NSTimeZone.local
        timePicker.tintColor = timeTextField.format.highlightColor

        timeTextField.keyboardAppearance = .dark
        timeTextField.type = .none
    }

    // MARK: - Workers -

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        let date = Self.dateFormatter.date(from: dateTextField.text!) ?? Date()
        var time = Self.timeFormatter.date(from: timeTextField.text!) ?? Date()
        let timeOfDay = DNSTimeOfDay(hour: time.dnsHour,
                                     minute: time.dnsMinute)
        time = timeOfDay.time(on: date)
        dateTextField.hideAlert()
        timeTextField.hideAlert()
        changeDatePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                            languageCode: "",
                                                            value: time))
    }

    // MARK: - Action methods -
    @IBAction func dateValueChangedAction(sender: UIDatePicker) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        _ = dateTextField.becomeFirstResponder()
        _ = dateTextField.resignFirstResponder()
        let date = datePicker.date
        var time = timePicker.date
        let timeOfDay = DNSTimeOfDay(hour: time.dnsHour,
                                     minute: time.dnsMinute)
        time = timeOfDay.time(on: date)
        changeDatePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                            languageCode: "",
                                                            value: time))
    }
    @IBAction func timeValueChangedAction(sender: UIDatePicker) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        _ = timeTextField.becomeFirstResponder()
        _ = timeTextField.resignFirstResponder()
        let date = datePicker.date
        var time = timePicker.date
        let timeOfDay = DNSTimeOfDay(hour: time.dnsHour,
                                     minute: time.dnsMinute)
        time = timeOfDay.time(on: date)
        changeDatePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                            languageCode: "",
                                                            value: time))
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
