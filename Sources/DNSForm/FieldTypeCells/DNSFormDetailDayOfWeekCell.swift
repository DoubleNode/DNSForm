//
//  DNSFormDetailDayOfWeekCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCore
import DNSDataObjects
import DNSProtocols
import SFSymbol
import UIKit

public protocol DNSFormDetailDayOfWeekCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var changePublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
}
open class DNSFormDetailDayOfWeekCell: DNSBaseStageCollectionViewCell,
                                       DNSFormDetailDayOfWeekCellLogic {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 67)

    public struct Data: Hashable {
        public var dayOfWeek: DNSDayOfWeekFlags
        public var field: String
        public var label: String

        public var monday: Bool = true
        public var tuesday: Bool = true
        public var wednesday: Bool = true
        public var thursday: Bool = true
        public var friday: Bool = true
        public var saturday: Bool = true
        public var sunday: Bool = true

        public init(dayOfWeek: DNSDayOfWeekFlags,
                    field: String,
                    label: String) {
            self.dayOfWeek = dayOfWeek
            self.field = field
            self.label = label
            monday = dayOfWeek.monday
            tuesday = dayOfWeek.tuesday
            wednesday = dayOfWeek.wednesday
            thursday = dayOfWeek.thursday
            friday = dayOfWeek.friday
            saturday = dayOfWeek.saturday
            sunday = dayOfWeek.sunday
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                monButton.isEnabled = false
                monButton.alpha = 0.3
                tueButton.isEnabled = false
                tueButton.alpha = 0.3
                wedButton.isEnabled = false
                wedButton.alpha = 0.3
                thrButton.isEnabled = false
                thrButton.alpha = 0.3
                friButton.isEnabled = false
                friButton.alpha = 0.3
                satButton.isEnabled = false
                satButton.alpha = 0.3
                sunButton.isEnabled = false
                sunButton.alpha = 0.3
                return
            }
            label.text = data.label
            monButton.isEnabled = true
            monButton.alpha = data.dayOfWeek.monday ? 1.0: 0.3
            tueButton.isEnabled = true
            tueButton.alpha = data.dayOfWeek.tuesday ? 1.0: 0.3
            wedButton.isEnabled = true
            wedButton.alpha = data.dayOfWeek.wednesday ? 1.0: 0.3
            thrButton.isEnabled = true
            thrButton.alpha = data.dayOfWeek.thursday ? 1.0: 0.3
            friButton.isEnabled = true
            friButton.alpha = data.dayOfWeek.friday ? 1.0: 0.3
            satButton.isEnabled = true
            satButton.alpha = data.dayOfWeek.saturday ? 1.0: 0.3
            sunButton.isEnabled = true
            sunButton.alpha = data.dayOfWeek.sunday ? 1.0: 0.3
        }
    }

    @IBOutlet var label: DNSUILabel!
    @IBOutlet var monButton: DNSUIButton!
    @IBOutlet var tueButton: DNSUIButton!
    @IBOutlet var wedButton: DNSUIButton!
    @IBOutlet var thrButton: DNSUIButton!
    @IBOutlet var friButton: DNSUIButton!
    @IBOutlet var satButton: DNSUIButton!
    @IBOutlet var sunButton: DNSUIButton!

    // MARK: - Outgoing Pipelines -
    public var changePublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        monButton.setTitle(Stage.Localizations.DayOfWeekCell.mondayLabel,
                           for: UIControl.State.normal)
        tueButton.setTitle(Stage.Localizations.DayOfWeekCell.tuesdayLabel,
                           for: UIControl.State.normal)
        wedButton.setTitle(Stage.Localizations.DayOfWeekCell.wednesdayLabel,
                           for: UIControl.State.normal)
        thrButton.setTitle(Stage.Localizations.DayOfWeekCell.thursdayLabel,
                           for: UIControl.State.normal)
        friButton.setTitle(Stage.Localizations.DayOfWeekCell.fridayLabel,
                           for: UIControl.State.normal)
        satButton.setTitle(Stage.Localizations.DayOfWeekCell.saturdayLabel,
                           for: UIControl.State.normal)
        sunButton.setTitle(Stage.Localizations.DayOfWeekCell.sundayLabel,
                           for: UIControl.State.normal)
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - Action methods -
    @IBAction func selectAction(sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard let data = self.data else { return }
        let dayOfWeek = data.dayOfWeek
        if sender == monButton {
            dayOfWeek.monday = !dayOfWeek.monday
        } else if sender == tueButton {
            dayOfWeek.tuesday = !dayOfWeek.tuesday
        } else if sender == wedButton {
            dayOfWeek.wednesday = !dayOfWeek.wednesday
        } else if sender == thrButton {
            dayOfWeek.thursday = !dayOfWeek.thursday
        } else if sender == friButton {
            dayOfWeek.friday = !dayOfWeek.friday
        } else if sender == satButton {
            dayOfWeek.saturday = !dayOfWeek.saturday
        } else if sender == sunButton {
            dayOfWeek.sunday = !dayOfWeek.sunday
        }
        let request = Stage.Models.Field.Request(field: data.field,
                                                 languageCode: "",
                                                 value: dayOfWeek)
        changePublisher.send(request)
    }
}
