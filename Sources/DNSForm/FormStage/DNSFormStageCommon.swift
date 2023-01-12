//
//  DNSFormStageCommon.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSCore
import UIKit

public enum DNSFormStage {
    public typealias Configurator = DNSFormStageConfigurator
    public typealias Interactor = DNSFormStageInteractor
    public enum Logic {
        public typealias Business = DNSFormStageBusinessLogic
        public typealias Display = DNSFormStageDisplayLogic
        public typealias Presentation = DNSFormStagePresentationLogic
    }
    public typealias Form = DNSFormStage
    public typealias Models = DNSFormStageModels
    public typealias Presenter = DNSFormStagePresenter
    public typealias ViewController = DNSFormStageViewController

    public enum ActionCodes {
        static public let close = "DNSFormStage_ActionCodes_close"
    }
    
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
        DNSFormDetailFileSelectorCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailHoursCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailImageSelectorCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailImageSelectorPlusCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailImageUrlCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailLanguageSelectionCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailPersonNameCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailPostalAddressCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailPreviewButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailPricesFieldCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSaveButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSearchButtonCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSectionHeaderCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailSpacerCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTabSelectionCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextEditorCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextFieldCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextSelectionCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextViewCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTextViewLargeCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailTimeOfDayCell.register(to: collectionView, from: Bundle.module)
        DNSFormDetailWeblinkCell.register(to: collectionView, from: Bundle.module)

        DNSFormDetailHeaderView.register(to: collectionView,
                                         for: UICollectionView.elementKindSectionHeader,
                                         from: Bundle.module)
        DNSFormDetailSubHeaderView.register(to: collectionView,
                                            for: UICollectionView.elementKindSectionHeader,
                                            from: Bundle.module)
    }

    // swiftlint:disable line_length
    public enum Localizations {
        public enum DayOfWeekCell {
            static public let mondayLabel = NSLocalizedString("DNSFormDayOfWeekCellMondayLabel", comment: "DNSFormDayOfWeekCellMondayLabel")
            static public let tuesdayLabel = NSLocalizedString("DNSFormDayOfWeekCellTuesdayLabel", comment: "DNSFormDayOfWeekCellTuesdayLabel")
            static public let wednesdayLabel = NSLocalizedString("DNSFormDayOfWeekCellWednesdayLabel", comment: "DNSFormDayOfWeekCellWednesdayLabel")
            static public let thursdayLabel = NSLocalizedString("DNSFormDayOfWeekCellThursdayLabel", comment: "DNSFormDayOfWeekCellThursdayLabel")
            static public let fridayLabel = NSLocalizedString("DNSFormDayOfWeekCellFridayLabel", comment: "DNSFormDayOfWeekCellFridayLabel")
            static public let saturdayLabel = NSLocalizedString("DNSFormDayOfWeekCellSaturdayLabel", comment: "DNSFormDayOfWeekCellSaturdayLabel")
            static public let sundayLabel = NSLocalizedString("DNSFormDayOfWeekCellSundayLabel", comment: "DNSFormDayOfWeekCellSundayLabel")
        }
        public enum ImagePopup {
            static public let closeButton = NSLocalizedString("DNSFormImagePopupCloseButton", comment: "DNSFormImagePopupCloseButton")
        }
    }
    // swiftlint:enable line_length
}
