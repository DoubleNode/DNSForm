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

    public lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter
    }()
    public lazy var timeFormatter: DateFormatter = {
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
        public var timeLabel: String
        public var timePlaceholder: String
        public var dateAlertMessage: String = ""
        public var timeAlertMessage: String = ""

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
            self.utilityDisplayAlert(data.dateAlertMessage, for: dateTextField)
            self.utilityDisplayAlert(data.timeAlertMessage, for: timeTextField)
            self.dateLabel.text = data.dateLabel
            self.datePicker.date = data.date
            self.datePicker.isEnabled = !data.readonly
            self.dateTextField.placeholder = data.datePlaceholder
            self.dateTextField.title = data.dateLabel
            self.dateTextField.text = dateFormatter.string(from: data.date)
            self.dateTextField.type = .datepicker(.date, datePicker.date, data.minimumDate,
                                                  data.maximumDate, data.datePlaceholder,
                                                  dateFormatter.dateFormat)

            self.timeLabel.text = data.timeLabel
            self.timePicker.date = data.date
            self.timePicker.isEnabled = !data.readonly
            self.timeTextField.placeholder = data.timePlaceholder
            self.timeTextField.title = data.timeLabel

            let timeOfDay = DNSTimeOfDay(hour: data.date.dnsHour,
                                         minute: data.date.dnsMinute)
            self.timeZeroLabel.isHidden = (timeOfDay != Date.zeroTime)
            self.timeTextField.text = timeFormatter.string(from: data.date)
        }
    }

    @IBOutlet var dateLabel: DNSUILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var datePickerLineView: UIView!
    @IBOutlet var dateTextField: DNSUIAnimatedField!
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
        let date = dateFormatter.date(from: dateTextField.text!) ?? Date()
        var time = timeFormatter.date(from: timeTextField.text!) ?? Date()
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
