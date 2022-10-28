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
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines
    var fieldAlertPublisher: PassthroughSubject<Stage.Models.Field.ViewModel, Never> { get }
}
open class DNSFormStagePresenter: DNSBaseStagePresenter, DNSFormStagePresentationLogic {
    public typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<Stage.Models.Field.ViewModel, Never>()

    // MARK: - Incoming Pipelines
    var subscribers: [AnyCancellable] = []
    override open func subscribe(to baseInteractor: BaseStage.Logic.Business) {
        super.subscribe(to: baseInteractor)
        // swiftlint:disable:next force_cast
        let interactor = baseInteractor as! Stage.Logic.Business

        weak var weakSelf = self
        subscribers.removeAll()
        subscribers.append(interactor.fieldAlertPublisher
            .sink { response in weakSelf?.presentFieldAlert(response) })
    }

    // MARK: - Presentation Logic
    func presentFieldAlert(_ response: Stage.Models.Field.Response) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        let viewModel = Stage.Models.Field
            .ViewModel(field: response.field,
                       alertMessage: response.error?.localizedDescription ?? "")
        fieldAlertPublisher.send(viewModel)
    }
}
