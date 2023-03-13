//
//  DNSFormStagePresenter.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSProtocols

public protocol DNSFormStagePresentationLogic: DNSBaseStagePresentationLogic {
    // MARK: - Outgoing Pipelines
    var fieldAlertPublisher: PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never> { get }
    var fileDeletePublisher: PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never> { get }
    var fileSelectPublisher: PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never> { get }
    var imageDeletePublisher: PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never> { get }
    var imageSelectPublisher: PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never> { get }
    var languagePublisher: PassthroughSubject<DNSFormStage.Models.Language.ViewModel, Never> { get }
    var tabPublisher: PassthroughSubject<DNSFormStage.Models.Tab.ViewModel, Never> { get }
}
open class DNSFormStagePresenter: DNSBaseStagePresenter, DNSFormStagePresentationLogic {
    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never>()
    public let fileDeletePublisher = PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never>()
    public let fileSelectPublisher = PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never>()
    public let imageDeletePublisher = PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never>()
    public let imageSelectPublisher = PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never>()
    public let languagePublisher = PassthroughSubject<DNSFormStage.Models.Language.ViewModel, Never>()
    public let tabPublisher = PassthroughSubject<DNSFormStage.Models.Tab.ViewModel, Never>()

    // MARK: - Incoming Pipelines
    override open func subscribe(to baseInteractor: BaseStage.Logic.Business) {
        super.subscribe(to: baseInteractor)
        // swiftlint:disable:next force_cast
        let interactor = baseInteractor as! DNSFormStage.Logic.Business
        subscribers.append(interactor.fieldAlertPublisher
            .sink { [weak self] response in self?.presentFieldAlert(response) })
        subscribers.append(interactor.fileDeletePublisher
            .sink { [weak self] response in self?.presentFileDelete(response) })
        subscribers.append(interactor.fileSelectPublisher
            .sink { [weak self] response in self?.presentFileSelect(response) })
        subscribers.append(interactor.imageDeletePublisher
            .sink { [weak self] response in self?.presentImageDelete(response) })
        subscribers.append(interactor.imageSelectPublisher
            .sink { [weak self] response in self?.presentImageSelect(response) })
        subscribers.append(interactor.languagePublisher
            .sink { [weak self] response in self?.presentLanguage(response) })
        subscribers.append(interactor.tabPublisher
            .sink { [weak self] response in self?.presentTab(response) })
    }

    // MARK: - Presentation Logic
    open func presentFieldAlert(_ response: DNSFormStage.Models.Field.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Field
            .ViewModel(field: response.field,
                       alertMessage: response.error?.localizedDescription ?? "")
        fieldAlertPublisher.send(viewModel)
    }
    open func presentFileDelete(_ response: DNSFormStage.Models.Field.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Field.ViewModel(field: response.field,
                                                            alertMessage: "")
        fileDeletePublisher.send(viewModel)
    }
    open func presentFileSelect(_ response: DNSFormStage.Models.Field.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Field.ViewModel(field: response.field,
                                                            alertMessage: "")
        fileSelectPublisher.send(viewModel)
    }
    open func presentImageDelete(_ response: DNSFormStage.Models.Field.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Field.ViewModel(field: response.field,
                                                            alertMessage: "")
        imageDeletePublisher.send(viewModel)
    }
    open func presentImageSelect(_ response: DNSFormStage.Models.Field.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Field.ViewModel(field: response.field,
                                                            alertMessage: "")
        imageSelectPublisher.send(viewModel)
    }
    open func presentLanguage(_ response: DNSFormStage.Models.Language.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Language.ViewModel(languageCode: response.languageCode)
        languagePublisher.send(viewModel)
    }
    open func presentTab(_ response: DNSFormStage.Models.Tab.Response) {
        self.utilityAutoTrack("\(#function)")
        let viewModel = DNSFormStage.Models.Tab.ViewModel(selectedTabCode: response.selectedTabCode,
                                                          tabsCode: response.tabsCode)
        tabPublisher.send(viewModel)
    }
}
