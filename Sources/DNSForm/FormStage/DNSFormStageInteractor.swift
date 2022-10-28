//
//  DNSFormStageInteractor.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSCore
import DNSDataObjects
import DNSError
import DNSProtocols
import Foundation

public protocol DNSFormStageBusinessLogic: DNSBaseStageBusinessLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines
    var fieldAlertPublisher: PassthroughSubject<Stage.Models.Field.Response, Never> { get }
}
open class DNSFormStageInteractor: DNSBaseStageInteractor, DNSFormStageBusinessLogic {
    public typealias Stage = DNSFormStage
    static let xlt = DNSDataTranslation()

    var formState: Stage.Form.FormState = .none

    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<Stage.Models.Field.Response, Never>()

    // MARK: - Incoming Pipelines
    var subscribers: [AnyCancellable] = []
    override open func subscribe(to baseViewController: BaseStage.Logic.Display) {
        super.subscribe(to: baseViewController)
        // swiftlint:disable:next force_cast
        let viewController = baseViewController as! Stage.Logic.Display

        weak var weakSelf = self
        subscribers.removeAll()
        subscribers.append(viewController.fieldChangedPublisher
            .sink { request in weakSelf?.doFieldChanged(request) })
        subscribers.append(viewController.saveActionPublisher
            .sink { request in weakSelf?.doSave(request) })
    }

    // MARK: - Stage Lifecycle -
    override open func startStage(with displayType: DNSBaseStage.Display.Mode,
                                  with displayOptions: DNSBaseStage.Display.Options = [],
                                  and initialization: DNSBaseStageBaseInitialization?) {
        super.startStage(with: displayType, with: displayOptions, and: initialization)
    }
    override open func stageWillAppear(_ request: BaseStage.Models.Base.Request) {
        super.stageWillAppear(request)
    }

    // MARK: - Business Logic
    open func doFieldChanged(_ request: Stage.Models.Field.Request) { }

    open func doSave(_ request: Stage.Models.Base.Request) { }
}
