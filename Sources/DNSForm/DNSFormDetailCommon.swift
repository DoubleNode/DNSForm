//
//  DNSFormDetailCommon.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSBaseTheme
import DNSCore
import SFSymbol
import UIKit

public enum DNSFormDetailStage {
    public typealias Models = DNSFormDetailModels
    public enum FormState {
        case none
        case cancelling
        case copyAppAction
        case removed
        case removing
        case selectAppAction
        case updated
        case updating
        case verified
        case verifying
    }

    static public func register(to collectionView: UICollectionView) {
        DNSFormDetailActionButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailAppActionCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailCheckboxCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailDateCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailDateTimeCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailDayOfWeekCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailDeleteButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailHoursCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailImageUrlCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailLanguageSelectionCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailPreviewButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSaveButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSearchButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSectionHeaderCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextFieldCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextSelectionFieldCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextViewCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTimeOfDayCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailWeblinkCell.register(to: collectionView, from: Bundle.module)

        DNSFormDetailHeaderView.register(to: collectionView,
                                         for: UICollectionView.elementKindSectionHeader,
                                         from: Bundle.module)
    }

    // swiftlint:disable line_length
    public enum Localizations {
        public enum DayOfWeekCell {
            static public let mondayLabel = NSLocalizedString("FormDetailDayOfWeekCellMondayLabel", comment: "FormDetailDayOfWeekCellMondayLabel")
            static public let tuesdayLabel = NSLocalizedString("FormDetailDayOfWeekCellTuesdayLabel", comment: "FormDetailDayOfWeekCellTuesdayLabel")
            static public let wednesdayLabel = NSLocalizedString("FormDetailDayOfWeekCellWednesdayLabel", comment: "FormDetailDayOfWeekCellWednesdayLabel")
            static public let thursdayLabel = NSLocalizedString("FormDetailDayOfWeekCellThursdayLabel", comment: "FormDetailDayOfWeekCellThursdayLabel")
            static public let fridayLabel = NSLocalizedString("FormDetailDayOfWeekCellFridayLabel", comment: "FormDetailDayOfWeekCellFridayLabel")
            static public let saturdayLabel = NSLocalizedString("FormDetailDayOfWeekCellSaturdayLabel", comment: "FormDetailDayOfWeekCellSaturdayLabel")
            static public let sundayLabel = NSLocalizedString("FormDetailDayOfWeekCellSundayLabel", comment: "FormDetailDayOfWeekCellSundayLabel")
        }
        public enum ImagePopup {
            static public let closeButton = NSLocalizedString("FormDetailImagePopupCloseButton", comment: "FormDetailImagePopupCloseButton")
        }
    }
    // swiftlint:enable line_length
}
