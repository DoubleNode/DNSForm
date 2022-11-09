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
import DNSCoreThreading
import DNSDataObjects
import DNSError
import DNSProtocols
import Foundation

public protocol DNSFormStageBusinessLogic: DNSBaseStageBusinessLogic {
    // MARK: - Outgoing Pipelines
    var fieldAlertPublisher: PassthroughSubject<DNSFormStage.Models.Field.Response, Never> { get }
    var languagePublisher: PassthroughSubject<DNSFormStage.Models.Language.Response, Never> { get }
}
open class DNSFormStageInteractor: DNSBaseStageInteractor, DNSFormStageBusinessLogic {
    static public let xlt = DNSDataTranslation()

    open var formState: DNSFormStage.Form.FormState = .none
    open var selectedLanguage = DNSCore.languageCode { didSet { self.utilityUpdateLanguage() } }

    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let languagePublisher = PassthroughSubject<DNSFormStage.Models.Language.Response, Never>()

    // MARK: - Incoming Pipelines
    var subscribers: [AnyCancellable] = []
    override open func subscribe(to baseViewController: BaseStage.Logic.Display) {
        super.subscribe(to: baseViewController)
        // swiftlint:disable:next force_cast
        let viewController = baseViewController as! DNSFormStage.Logic.Display

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
    open func doFieldChanged(_ request: DNSFormStage.Models.Field.Request) { }

    open func doSave(_ request: DNSFormStage.Models.Base.Request) { }
    
    // MARK: - Utility methods
    open func utilityAnyChanges() -> Bool {
        let anyChanges = false
        return anyChanges
    }
    open func utilityClearState() {
        self.formState = .none
        selectedLanguage = DNSCore.languageCode
    }
    open func utilityIsValid() -> Bool {
        let isValid = true
        return isValid
    }
    open func utilityRefreshForm() {
    }
    open func utilityUpdateLanguage() {
        DNSLowThread.run {
            let request = DNSFormStage.Models.Language.Response(languageCode: self.selectedLanguage)
            self.languagePublisher.send(request)
        }
    }
}
