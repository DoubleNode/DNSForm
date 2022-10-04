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
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailTimeOfDayCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailTimeOfDayCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
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
        public var timeOfDay: DNSTimeOfDay
        public var timeLabel: String
        public var timePlaceholder: String

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
                self.timePicker.date = Date()
                return
            }
            self.timeLabel.text = data.timeLabel
            self.timePicker.date = data.timeOfDay.today
            self.timePicker.isEnabled = !data.readonly
            self.timeTextField.placeholder = data.timePlaceholder
            self.timeTextField.text = timeFormatter.string(from: data.timeOfDay.today)
        }
    }

    @IBOutlet var timeLabel: DNSUILabel!
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
        var time = timePicker.date
        let timeOfDay = DNSTimeOfDay(hour: time.dnsHour,
                                     minute: time.dnsMinute)
        time = timeOfDay.today
        changePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                        languageCode: "",
                                                        value: time))
    }
}
