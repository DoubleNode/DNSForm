//
//  DNSFormDetailHoursCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import AnimatedField
import Combine
import DNSBaseStage
import DNSCore
import DNSCoreThreading
import DNSDataObjects
import DNSProtocols
import UIKit

public protocol DNSFormDetailHoursCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailHoursCell: DNSBaseStageCollectionViewCell,
    DNSFormDetailHoursCellLogic, AnimatedFieldDelegate, AnimatedFieldDataSource {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 95)

    public lazy var timeFormatter: DateFormatter = {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        return timeFormatter
    }()

    public struct Data: Hashable {
        public var closeLabel: String
        public var closePlaceholder: String
        public var field: String
        public var hours: DAODayHours
        public var hoursLabel: String
        public var languageCode: String
        public var openLabel: String
        public var openPlaceholder: String
        public var readonly: Bool
        public var required: Bool

        public init(closeLabel: String, closePlaceholder: String, field: String, hours: DAODayHours, hoursLabel: String, languageCode: String, openLabel: String, openPlaceholder: String, readonly: Bool, required: Bool) {
            self.closeLabel = closeLabel
            self.closePlaceholder = closePlaceholder
            self.field = field
            self.hours = hours
            self.hoursLabel = hoursLabel
            self.languageCode = languageCode
            self.openLabel = openLabel
            self.openPlaceholder = openPlaceholder
            self.readonly = readonly
            self.required = required
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.closePicker.date = Date()
                self.openPicker.date = Date()
                return
            }
            self.hoursLabel.text = data.hoursLabel

            let openTimeOfDay = data.hours.open ?? DNSTimeOfDay()
            self.openLabel.text = data.openLabel
            self.openPicker.date = openTimeOfDay.today
            self.openPicker.isEnabled = !data.readonly
            self.openTextField.placeholder = data.openPlaceholder
            self.openTextField.text = timeFormatter.string(from: openTimeOfDay.today)

            let closeTimeOfDay = data.hours.close ?? DNSTimeOfDay()
            self.closeLabel.text = data.closeLabel
            self.closePicker.date = closeTimeOfDay.today
            self.closePicker.isEnabled = !data.readonly
            self.closeTextField.placeholder = data.closePlaceholder
            self.closeTextField.text = timeFormatter.string(from: closeTimeOfDay.today)
        }
    }

    @IBOutlet var closeLabel: UILabel!
    @IBOutlet var closePicker: UIDatePicker!
    @IBOutlet var closePickerLineView: UIView!
    @IBOutlet var closeTextField: AnimatedField!
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var openLabel: UILabel!
    @IBOutlet var openPicker: UIDatePicker!
    @IBOutlet var openPickerLineView: UIView!
    @IBOutlet var openTextField: AnimatedField!

    // MARK: - Outgoing Pipelines -
    public var changePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    // MARK: - Incoming Pipelines -
    var subscribers: [AnyCancellable] = []

    override open func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 14, *) {
            openPicker.alpha = 1
            openPickerLineView.alpha = 1
            openTextField.alpha = 0
        } else {
            openPicker.alpha = 0
            openPickerLineView.alpha = 0
            openTextField.alpha = 1

            openTextField.format = Stage.AnimatedField.Format.default
            openTextField.placeholder = "SELECT OPEN TIME"   // TODO: Localize

            openTextField.dataSource = self
            openTextField.delegate = self
        }

        if #available(iOS 14, *) {
            closePicker.alpha = 1
            closePickerLineView.alpha = 1
            closeTextField.alpha = 0
        } else {
            closePicker.alpha = 0
            closePickerLineView.alpha = 0
            closeTextField.alpha = 1

            closeTextField.format = Stage.AnimatedField.Format.default
            closeTextField.placeholder = "SELECT CLOSE TIME"   // TODO: Localize

            closeTextField.dataSource = self
            closeTextField.delegate = self
        }
    }
    override open func contentInit() {
        super.contentInit()
        self.contentInitOpenPicker()
        self.contentInitClosePicker()
        self.data = nil
    }
    func contentInitOpenPicker() {
        openPicker.date = Date()
        openPicker.timeZone = NSTimeZone.local
        openPicker.tintColor = openTextField.format.highlightColor

        openTextField.keyboardAppearance = .dark
        openTextField.type = .datepicker(.time, openPicker.date, nil, nil, "", timeFormatter.dateFormat)
    }
    func contentInitClosePicker() {
        closePicker.date = Date()
        closePicker.timeZone = NSTimeZone.local
        closePicker.tintColor = closeTextField.format.highlightColor

        closeTextField.keyboardAppearance = .dark
        closeTextField.type = .datepicker(.time, closePicker.date, nil, nil, "", timeFormatter.dateFormat)
    }

    // MARK: - Workers -

    // MARK: - AnimatedFieldDataSource methods
    public func animatedFieldShouldReturn(_ animatedField: AnimatedField) -> Bool {
        _ = animatedField.resignFirstResponder()
        return true
    }

    // MARK: - AnimatedFieldDelegate methods
    public func animatedFieldDidEndEditing(_ animatedField: AnimatedField) {
        try? self.analyticsWorker?.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        var open = timeFormatter.date(from: openTextField.text!) ?? Date()
        let openTimeOfDay = DNSTimeOfDay(hour: open.dnsHour,
                                         minute: open.dnsMinute)
        open = openTimeOfDay.today
        openTextField.hideAlert()

        var close = timeFormatter.date(from: closeTextField.text!) ?? Date()
        let closeTimeOfDay = DNSTimeOfDay(hour: close.dnsHour,
                                          minute: close.dnsMinute)
        close = closeTimeOfDay.today
        closeTextField.hideAlert()

        let hours = DAODayHours(open: openTimeOfDay, close: closeTimeOfDay)
        changePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                        languageCode: "",
                                                        value: hours))
    }

    // MARK: - Action methods -
    @IBAction func dateValueChangedAction(sender: UIDatePicker) {
        try? self.analyticsWorker?.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        let open = openPicker.date
        let openTimeOfDay = DNSTimeOfDay(hour: open.dnsHour,
                                         minute: open.dnsMinute)
        let close = closePicker.date
        let closeTimeOfDay = DNSTimeOfDay(hour: close.dnsHour,
                                          minute: close.dnsMinute)
        let hours = DAODayHours(open: openTimeOfDay, close: closeTimeOfDay)
        changePublisher.send(Stage.Models.Field.Request(field: data.field,
                                                        languageCode: "",
                                                        value: hours))
    }
}
