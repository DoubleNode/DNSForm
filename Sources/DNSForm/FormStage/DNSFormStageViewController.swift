//
//  DNSFormStageViewController.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSCore
import DNSCoreThreading
import Photos
import PhotosUI
import UIKit

public protocol DNSFormStageDisplayLogic: DNSBaseStageDisplayLogic {
    // MARK: - Outgoing Pipelines
    var fieldChangedPublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
    var imageDeletePublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
    var imageSelectPublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
    var languageChangedPublisher: PassthroughSubject<DNSFormStage.Models.Language.Request, Never> { get }
    var saveActionPublisher: PassthroughSubject<DNSFormStage.Models.Base.Request, Never> { get }
    var uploadImagePublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
}
open class DNSFormStageViewController: DNSBaseStageViewController, DNSFormStageDisplayLogic {
    public var formDataSource: UICollectionViewDiffableDataSource<AnyHashable, AnyHashable>! = nil

    @IBOutlet public var formCollectionView: UICollectionView!

    public var fieldChangedPublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()
    public var imageDeletePublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()
    public var imageSelectPublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()
    public var languageChangedPublisher = PassthroughSubject<DNSFormStage.Models.Language.Request, Never>()
    public var saveActionPublisher = PassthroughSubject<DNSFormStage.Models.Base.Request, Never>()
    public var uploadImagePublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()

    public var anyChanges = false
    public var enableSave = false
    public var fieldAlertMessages: [String: String] = [:]
    public var fieldRequest: DNSFormStage.Models.Field.Request?
    public var lastFieldChanged: (field: String, subfield: String)? = nil
    public var selectedLanguage: String = DNSCore.languageCode { didSet { self.formRefresh() } }

    // MARK: - Incoming Pipelines
    open var subscribers: [AnyCancellable] = []
    open var cellSubscribers: [DNSBaseStageCollectionViewCell: [AnyCancellable]] = [:]
    open var reusableViewSubscribers: [DNSBaseStageCollectionReusableView: [AnyCancellable]] = [:]
    override open func subscribe(to basePresenter: BaseStage.Logic.Presentation) {
        super.subscribe(to: basePresenter)
        // swiftlint:disable:next force_cast
        let presenter = basePresenter as! DNSFormStage.Logic.Presentation
        subscribers.removeAll()
        subscribers.append(presenter.deleteImagePublisher
            .sink { [weak self] viewModel in self?.displayDeleteImage(viewModel) })
        subscribers.append(presenter.fieldAlertPublisher
            .sink { [weak self] viewModel in self?.displayFieldAlert(viewModel) })
        subscribers.append(presenter.languagePublisher
            .sink { [weak self] viewModel in self?.displayLanguage(viewModel) })
        subscribers.append(presenter.selectImagePublisher
            .sink { [weak self] viewModel in self?.displaySelectImage(viewModel) })
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.anyChanges = false
        self.enableSave = false
        self.baseConfigureFormCollectionView()
        self.baseConfigureFormDataSource()
    }

    // MARK: - Display Logic
    open func displayDeleteImage(_ viewModel: DNSFormStage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldRequest = DNSFormStage.Models.Field.Request(field: viewModel.field,
                                                              languageCode: self.selectedLanguage)
    }
    open func displayFieldAlert(_ viewModel: DNSFormStage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldAlertMessages[viewModel.field] = viewModel.alertMessage
        self.formRefresh()
    }
    open func displayLanguage(_ viewModel: DNSFormStage.Models.Language.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.selectedLanguage = viewModel.languageCode
    }
    override open func displayReset(_ viewModel: BaseStage.Models.Base.ViewModel) {
        super.displayReset(viewModel)
        self.anyChanges = false
        self.enableSave = false
        self.fieldAlertMessages = [:]
        self.lastFieldChanged = nil
        self.formRefresh()
    }
    open func displaySelectImage(_ viewModel: DNSFormStage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldRequest = DNSFormStage.Models.Field.Request(field: viewModel.field,
                                                              languageCode: self.selectedLanguage)
        self.openPHPicker()
    }

    // MARK: - Action methods -
    open func imageDeleteAction(request: DNSFormStage.Models.Field.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.imageDeletePublisher.send(request)
    }
    open func fieldChangedAction(request: DNSFormStage.Models.Field.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        DNSUIThread.run {
            self.lastFieldChanged = (request.field, request.subfield)
            DNSThread.run(after: 0.1) {
                self.fieldChangedPublisher.send(request)
            }
        }
    }
    open func imageSelectAction(request: DNSFormStage.Models.Field.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.imageSelectPublisher.send(request)
    }
    open func languageChangedAction(request: DNSFormStage.Models.Language.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.languageChangedPublisher.send(request)
    }
    open func saveButtonAction(request: DNSFormStage.Models.Base.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.saveActionPublisher.send(request)
    }

    // MARK: - Utility methods
    open func formRefresh(fieldChangeRedraw: Bool = false,
                          then block: DNSBlock? = nil) {
        DNSUIThread.run { [weak self] in
            guard let self else { return }
            let snapshot = self.baseSnapshotFormForCurrentState()
            self.formDataSource.apply(snapshot) {
                block?()
                if fieldChangeRedraw {
                    self.lastFieldChanged = nil
                }
            }
        }
    }

    // MARK: - DNSFormStageViewController methods
    static public var baseFormContentInset = UIEdgeInsets(top: 44, left: 0, bottom: 64, right: 0)
    open func baseConfigureFormCollectionView() {
        self.formCollectionView.collectionViewLayout = self.baseGenerateFormLayout()
        self.formCollectionView.contentInset = Self.baseFormContentInset
        self.formCollectionView.contentInsetAdjustmentBehavior = .never
        DNSFormStage.register(to: self.formCollectionView)
    }
    open func baseConfigureFormDataSource() { }
    open func baseGenerateFormLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNdx, _) ->
            NSCollectionLayoutSection? in
            let group = NSCollectionLayoutGroup.init(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(0),
                                                                                        heightDimension: .absolute(0)))
            return NSCollectionLayoutSection(group: group)
        }
        return layout
    }
    open func baseSnapshotFormForCurrentState() -> NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable> {
        let snapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>()
        return snapshot
    }
    open func generateFieldCellLayout(contentSize: CGSize,
                                        headerSize: CGSize = CGSize.zero) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(contentSize.height))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(contentSize.height))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 32, leading: 8, bottom: 32, trailing: 8)
        
        let section = NSCollectionLayoutSection(group: group)
        if headerSize != CGSize.zero {
            let headerSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(headerSize.height))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top)
            
            section.boundarySupplementaryItems = [sectionHeader]
        }
        return section
    }
    open func subscribe(to fieldCell: DNSBaseStageCollectionViewCell) {
        var cellSubscribers: [AnyCancellable] = []
        if let fieldCell = fieldCell as? DNSFormDetailAppActionCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailDateCell {
            cellSubscribers.append(fieldCell.changeDatePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailDateTimeCell {
            cellSubscribers.append(fieldCell.changeDatePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailDayOfWeekCell {
            cellSubscribers.append(fieldCell.changePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailHoursCell {
            cellSubscribers.append(fieldCell.changePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailImageSelectorCell {
            cellSubscribers.append(fieldCell.imageDeleteActionPublisher
                .sink { [weak self] request in self?.imageDeleteAction(request: request) })
            cellSubscribers.append(fieldCell.imageSelectActionPublisher
                .sink { [weak self] request in self?.imageSelectAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailImageUrlCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailLanguageSelectionCell {
            cellSubscribers.append(fieldCell.selectedPublisher
                .sink { [weak self] request in self?.languageChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailPersonNameCell {
            cellSubscribers.append(fieldCell.changeValuePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailPostalAddressCell {
            cellSubscribers.append(fieldCell.changeValuePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailTextEditorCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailTextFieldCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailTextSelectionCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailTextViewCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailTextViewLargeCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailTimeOfDayCell {
            cellSubscribers.append(fieldCell.changePublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        } else if let fieldCell = fieldCell as? DNSFormDetailWeblinkCell {
            cellSubscribers.append(fieldCell.changeTextPublisher
                .sink { [weak self] request in self?.fieldChangedAction(request: request) })
        }
        self.cellSubscribers[fieldCell] = cellSubscribers
    }
}
// MARK: - PHPicker methods
extension DNSFormStageViewController: PHPickerViewControllerDelegate {
    public func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: .none)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
                guard error == nil else {
                    return
                }
                
                guard var fieldRequest = self.fieldRequest else {
                    return
                }
                fieldRequest.value = reading
                self.uploadImagePublisher.send(fieldRequest)

//                result.itemProvider.loadFileRepresentation(forTypeIdentifier: "public.image") { [weak self] url, error in
//                guard let self else { return }
//                guard error == nil else {
//                    return
//                }
//                guard let url else {
//                    return
//                }
//                let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//                guard let targetURL = documentsDirectory?.appendingPathComponent(url.lastPathComponent) else {
//                    return
//                }
//                do {
//                    if FileManager.default.fileExists(atPath: targetURL.path) {
//                        try FileManager.default.removeItem(at: targetURL)
//                    }
//                    try FileManager.default.copyItem(at: url, to: targetURL)
//                    guard var fieldRequest = self.fieldRequest else {
//                        return
//                    }
//                    fieldRequest.value = targetURL
//                    self.uploadImagePublisher.send(fieldRequest)
//                } catch {
//                    return
//                }
            }
        }
    }
    func openPHPicker() {
        var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
        phPickerConfig.selectionLimit = 1
        phPickerConfig.filter = PHPickerFilter.any(of: [.images, .livePhotos])
        phPickerConfig.preferredAssetRepresentationMode = .current
        DNSUIThread.run {
            let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
            phPickerVC.delegate = self
            self.present(phPickerVC, animated: true)
        }
    }
}
