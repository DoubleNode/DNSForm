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
import UIKit

public protocol DNSFormStageDisplayLogic: DNSBaseStageDisplayLogic {
    // MARK: - Outgoing Pipelines
    var fieldChangedPublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
    var languageChangedPublisher: PassthroughSubject<DNSFormStage.Models.Language.Request, Never> { get }
    var saveActionPublisher: PassthroughSubject<DNSFormStage.Models.Base.Request, Never> { get }
}
open class DNSFormStageViewController: DNSBaseStageViewController, DNSFormStageDisplayLogic {
    public var formDataSource: UICollectionViewDiffableDataSource<AnyHashable, AnyHashable>! = nil

    @IBOutlet public var formCollectionView: UICollectionView!

    public var fieldChangedPublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()
    public var languageChangedPublisher = PassthroughSubject<DNSFormStage.Models.Language.Request, Never>()
    public var saveActionPublisher = PassthroughSubject<DNSFormStage.Models.Base.Request, Never>()
    
    public var anyChanges = false
    public var enableSave = false
    public var fieldAlertMessages: [String: String] = [:]
    public var selectedLanguage: String = DNSCore.languageCode { didSet { self.utilityRebuildForm() } }

    // MARK: - Incoming Pipelines
    open var subscribers: [AnyCancellable] = []
    open var cellSubscribers: [DNSBaseStageCollectionViewCell: [AnyCancellable]] = [:]
    open var reusableViewSubscribers: [DNSBaseStageCollectionReusableView: [AnyCancellable]] = [:]
    override open func subscribe(to basePresenter: BaseStage.Logic.Presentation) {
        super.subscribe(to: basePresenter)
        // swiftlint:disable:next force_cast
        let presenter = basePresenter as! DNSFormStage.Logic.Presentation
        subscribers.removeAll()
        subscribers.append(presenter.fieldAlertPublisher
            .sink { [weak self] viewModel in self?.displayFieldAlert(viewModel) })
        subscribers.append(presenter.languagePublisher
            .sink { [weak self] viewModel in self?.displayLanguage(viewModel) })
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.anyChanges = false
        self.enableSave = false
        self.baseConfigureFormCollectionView()
        self.baseConfigureFormDataSource()
    }

    // MARK: - Display Logic
    open func displayFieldAlert(_ viewModel: DNSFormStage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldAlertMessages[viewModel.field] = viewModel.alertMessage
        self.utilityRefreshForm()
    }
    open func displayLanguage(_ viewModel: DNSFormStage.Models.Language.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.selectedLanguage = viewModel.languageCode
        DNSUIThread.run {
            let snapshot = self.baseSnapshotFormForCurrentState()
            self.formDataSource.apply(snapshot)
        }
    }
    override open func displayReset(_ viewModel: BaseStage.Models.Base.ViewModel) {
        super.displayReset(viewModel)
        self.anyChanges = false
        self.enableSave = false
        self.fieldAlertMessages = [:]
        self.utilityRefreshForm()
    }
    
    // MARK: - Action methods -
    open func fieldChangedAction(request: DNSFormStage.Models.Field.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldChangedPublisher.send(request)
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
    open func utilityRebuildForm() {
        DNSUIThread.run { [weak self] in
            guard let self else { return }
            let snapshot = self.baseSnapshotFormForCurrentState()
            self.formDataSource.apply(snapshot)
        }
    }
    open func utilityRefreshForm() {
    }

    // MARK: - DNSFormStageFlowLayout methods
    open func baseConfigureFormCollectionView() {
        self.formCollectionView.collectionViewLayout = self.baseGenerateFormLayout()
        self.formCollectionView.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 64, right: 0)
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

    // MARK: - formCollectionView methods
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
}
