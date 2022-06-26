//
//  DNSFormDetailCommon.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import AnimatedField
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
    }

    static public func register(to collectionView: UICollectionView) {
        DNSFormDetailAppActionCell.register(to: collectionView)
        DNSFormDetailCheckboxCell.register(to: collectionView)
        DNSFormDetailDateCell.register(to: collectionView)
        DNSFormDetailDateTimeCell.register(to: collectionView)
        DNSFormDetailDayOfWeekCell.register(to: collectionView)
        DNSFormDetailDeleteButtonCell.register(to: collectionView)
        DNSFormDetailHoursCell.register(to: collectionView)
        DNSFormDetailImageUrlCell.register(to: collectionView)
        DNSFormDetailLanguageSelectionCell.register(to: collectionView)
        DNSFormDetailPreviewButtonCell.register(to: collectionView)
        DNSFormDetailSaveButtonCell.register(to: collectionView)
        DNSFormDetailSectionHeaderCell.register(to: collectionView)
        DNSFormDetailTextFieldCell.register(to: collectionView)
        DNSFormDetailTextSelectionFieldCell.register(to: collectionView)
        DNSFormDetailTextViewCell.register(to: collectionView)
        DNSFormDetailTimeOfDayCell.register(to: collectionView)
        DNSFormDetailWeblinkCell.register(to: collectionView)

        DNSFormDetailHeaderView.register(to: collectionView,
                                         for: UICollectionView.elementKindSectionHeader)
    }

    // swiftlint:disable line_length
    enum Localizations {
        enum DayOfWeekCell {
            static let mondayLabel = NSLocalizedString("FormDetailDayOfWeekCellMondayLabel", comment: "FormDetailDayOfWeekCellMondayLabel")
            static let tuesdayLabel = NSLocalizedString("FormDetailDayOfWeekCellTuesdayLabel", comment: "FormDetailDayOfWeekCellTuesdayLabel")
            static let wednesdayLabel = NSLocalizedString("FormDetailDayOfWeekCellWednesdayLabel", comment: "FormDetailDayOfWeekCellWednesdayLabel")
            static let thursdayLabel = NSLocalizedString("FormDetailDayOfWeekCellThursdayLabel", comment: "FormDetailDayOfWeekCellThursdayLabel")
            static let fridayLabel = NSLocalizedString("FormDetailDayOfWeekCellFridayLabel", comment: "FormDetailDayOfWeekCellFridayLabel")
            static let saturdayLabel = NSLocalizedString("FormDetailDayOfWeekCellSaturdayLabel", comment: "FormDetailDayOfWeekCellSaturdayLabel")
            static let sundayLabel = NSLocalizedString("FormDetailDayOfWeekCellSundayLabel", comment: "FormDetailDayOfWeekCellSundayLabel")
        }
        enum ImagePopup {
            static let closeButton = NSLocalizedString("FormDetailImagePopupCloseButton", comment: "FormDetailImagePopupCloseButton")
        }
    }
    // swiftlint:enable line_length
    
    public enum AnimatedField {
        public enum Format {
            static var `default`: AnimatedFieldFormat {
                var format = AnimatedFieldFormat()
                format.dnsApply(DNSThemeFieldStyle.DNSForm.default)
                format.alertEnabled = true
                format.alertFieldActive = false
                format.alertLineActive = true
                format.alertTitleActive = false
                format.alertPosition = .bottom
                format.counterEnabled = false
                format.countDown = false
                format.counterAnimation = false
                format.invalidCharacters = ""
                format.titleAlwaysVisible = false
                format.visibleOnImage = UIImage(dnsSystemSymbol: SFSymbol.eye)
                format.visibleOffImage = UIImage(dnsSystemSymbol: SFSymbol.eyeSlash)
                return format
            }
        }
    }
}
