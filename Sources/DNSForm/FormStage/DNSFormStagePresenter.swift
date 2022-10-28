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
}
open class DNSFormStagePresenter: DNSBaseStagePresenter, DNSFormStagePresentationLogic {
    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<DNSFormStage.Models.Field.ViewModel, Never>()

    // MARK: - Incoming Pipelines
    var subscribers: [AnyCancellable] = []
    override open func subscribe(to baseInteractor: BaseStage.Logic.Business) {
        super.subscribe(to: baseInteractor)
        // swiftlint:disable:next force_cast
        let interactor = baseInteractor as! DNSFormStage.Logic.Business

        weak var weakSelf = self
        subscribers.removeAll()
        subscribers.append(interactor.fieldAlertPublisher
            .sink { response in weakSelf?.presentFieldAlert(response) })
    }

    // MARK: - Presentation Logic
    open func presentFieldAlert(_ response: DNSFormStage.Models.Field.Response) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        let viewModel = DNSFormStage.Models.Field
            .ViewModel(field: response.field,
                       alertMessage: response.error?.localizedDescription ?? "")
        fieldAlertPublisher.send(viewModel)
    }
}
