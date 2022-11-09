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

    open var formState: DNSFormStage.Form.FormState = .none { didSet { self.utilityRefreshForm() } }
    open var selectedLanguage = DNSCore.languageCode { didSet { self.utilityUpdateLanguage() } }

    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let languagePublisher = PassthroughSubject<DNSFormStage.Models.Language.Response, Never>()

    // MARK: - Incoming Pipelines
    open var subscribers: [AnyCancellable] = []
    override open func subscribe(to baseViewController: BaseStage.Logic.Display) {
        super.subscribe(to: baseViewController)
        // swiftlint:disable:next force_cast
        let viewController = baseViewController as! DNSFormStage.Logic.Display
        subscribers.removeAll()
        subscribers.append(viewController.fieldChangedPublisher
            .sink { [weak self] request in self?.doFieldChanged(request) })
        subscribers.append(viewController.languageChangedPublisher
            .sink { [weak self] request in self?.doLanguageChanged(request) })
        subscribers.append(viewController.saveActionPublisher
            .sink { [weak self] request in self?.doSave(request) })
    }

    // MARK: - Stage Lifecycle -
    override open func startStage(with displayType: DNSBaseStage.Display.Mode,
                                  with displayOptions: DNSBaseStage.Display.Options = [],
                                  and initialization: DNSBaseStageBaseInitialization?) {
        super.startStage(with: displayType, with: displayOptions, and: initialization)
    }
    override open func updateStage(with initializationObject: DNSBaseStageBaseInitialization) {
        super.updateStage(with: initializationObject)
    }
    override open func stageWillAppear(_ request: BaseStage.Models.Base.Request) {
        super.stageWillAppear(request)
        self.utilityUpdateLanguage()
    }

    // MARK: - Business Logic
    override open func doCloseAction(_ request: DNSFormStage.Models.Base.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        guard !self.utilityAnyChanges() else {
            self.formState = .cancelling
            self.messageUnsavedChanges()
            return
        }
        super.doCloseAction(request)
    }
    open func doFieldChanged(_ request: DNSFormStage.Models.Field.Request) { }
    override open func doMessageDone(_ request: DNSFormStage.Models.Message.Request) {
        super.doMessageDone(request)
        switch self.formState {
        case .cancelling:
            guard !request.cancelled else { return }
            super.utilityCloseAction()
        default:
            break
        }
    }
    open func doLanguageChanged(_ request: DNSFormStage.Models.Language.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.selectedLanguage = request.languageCode
    }
    open func doSave(_ request: DNSFormStage.Models.Base.Request) { }
    
    // MARK: - Message methods
    open func messageUnsavedChanges() { }
    
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
