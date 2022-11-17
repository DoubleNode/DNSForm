//
//  DNSFormDetailTimeOfDayCell.swift
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

public protocol DNSFormDetailTimeOfDayCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var changePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTimeOfDayCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailTimeOfDayCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 76)

    public lazy var timeFormatter: DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        return timeFormatter
    }()

    public struct Data: Hashable {
        public var field: String
        public var languageCode: String
        public var readonly: Bool
        public var required: Bool
        public var style: DNSThemeFieldStyle = .DNSForm.default
        public var timeOfDay: DNSTimeOfDay
        public var timeLabel: String
        public var timePlaceholder: String
        public var alertMessage: String = ""

        public init(field: String, languageCode: String, readonly: Bool, required: Bool, timeOfDay: DNSTimeOfDay, timeLabel: String, timePlaceholder: String) {
            self.field = field
            self.languageCode = languageCode
            self.readonly = readonly
            self.required = required
            self.timeOfDay = timeOfDay
            self.timeLabel = timeLabel
            self.timePlaceholder = timePlaceholder
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                timeTextField.hideAlert()
                self.timePicker.date = Date()
                self.timeZeroLabel.isHidden = true
                return
            }
            timeTextField.style = data.style
            self.utilityDisplayAlert(data.alertMessage, for: timeTextField)
            self.timeIcon.tintColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.timeLabel.text = data.timeLabel
            self.timeLabel.isEnabled = !data.readonly
            self.timePicker.date = data.timeOfDay.today
            self.timePicker.isEnabled = !data.readonly
            let timePickerColor = data.readonly ? data.style.textStyle.color.disabled : data.style.textStyle.color.normal
            self.timePicker.setValue(timePickerColor, forKey: "textColor")
            self.timePickerLineView.backgroundColor = data.readonly ? UIColor.lightGray : UIColor.darkGray
            self.timeTextField.placeholder = data.timePlaceholder
            self.timeTextField.isEnabled = !data.readonly
            self.timeTextField.title = data.timeLabel

            let timeOfDay = DNSTimeOfDay(hour: data.timeOfDay.hour,
                                         minute: data.timeOfDay.minute)
            self.timeZeroLabel.isHidden = (timeOfDay != Date.zeroTime)
            self.timeZeroLabel.isEnabled = !data.readonly
            self.timeTextField.text = timeFormatter.string(from: data.timeOfDay.today)
        }
    }

    @IBOutlet var timeIcon: UIImageView!
    @IBOutlet var timeLabel: DNSUILabel!
    @IBOutlet var timeZeroLabel: UILabel!
    @IBOutlet var timePicker: UIDatePicker!
    @IBOutlet var timePickerLineView: UIView!
    @IBOutlet var timeTextField: DNSUIAnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    // MARK: - Incoming Pipelines -
    var subscribers: [AnyCancellable] = []

    override open func awakeFromNib() {
        super.awakeFromNib()
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
        self.contentInitTimePicker()
        self.data = nil
    }
    open func contentInitTimePicker() {
        timePicker.contentHorizontalAlignment = .left
        timePicker.date = Date()
        timePicker.timeZone = NSTimeZone.local
        timePicker.tintColor = timeTextField.format.highlightColor

        timeTextField.keyboardAppearance = .dark
        timeTextField.type = .datepicker(.time, timePicker.date, nil, nil, "", timeFormatter.dateFormat)
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
        var time = timeFormatter.date(from: timeTextField.text!) ?? Date()
        let timeOfDay = DNSTimeOfDay(hour: time.dnsHour,
                                     minute: time.dnsMinute)
        time = timeOfDay.today
        timeTextField.hideAlert()
        changePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                        languageCode: "",
                                                        value: time))
    }

    // MARK: - Action methods -
    @IBAction func dateValueChangedAction(sender: UIDatePicker) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        _ = timeTextField.becomeFirstResponder()
        _ = timeTextField.resignFirstResponder()
        var time = timePicker.date
        let timeOfDay = DNSTimeOfDay(hour: time.dnsHour,
                                     minute: time.dnsMinute)
        time = timeOfDay.today
        changePublisher.send(Stage.Models.Field.Request(field: data.field,
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
