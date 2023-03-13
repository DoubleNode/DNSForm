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
import DNSCrashWorkers
import DNSDataObjects
import DNSError
import DNSProtocols
import Foundation

public protocol DNSFormStageBusinessLogic: DNSBaseStageBusinessLogic {
    // MARK: - Outgoing Pipelines
    var fieldAlertPublisher: PassthroughSubject<DNSFormStage.Models.Field.Response, Never> { get }
    var fileDeletePublisher: PassthroughSubject<DNSFormStage.Models.Field.Response, Never> { get }
    var fileSelectPublisher: PassthroughSubject<DNSFormStage.Models.Field.Response, Never> { get }
    var imageDeletePublisher: PassthroughSubject<DNSFormStage.Models.Field.Response, Never> { get }
    var imageSelectPublisher: PassthroughSubject<DNSFormStage.Models.Field.Response, Never> { get }
    var languagePublisher: PassthroughSubject<DNSFormStage.Models.Language.Response, Never> { get }
    var tabPublisher: PassthroughSubject<DNSFormStage.Models.Tab.Response, Never> { get }
}
open class DNSFormStageInteractor: DNSBaseStageInteractor, DNSFormStageBusinessLogic {
    static public let xlt = DNSDataTranslation()

    open var formState: DNSFormStage.Form.FormState = .none { didSet { self.formRefresh() } }
    open var selectedLanguage = DNSCore.languageCode { didSet { self.formUpdateLanguage() } }
    open var selectedTabs: [String: String] = [:]

    // MARK: - Outgoing Pipelines
    public let fieldAlertPublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let fileDeletePublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let fileSelectPublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let imageDeletePublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let imageSelectPublisher = PassthroughSubject<DNSFormStage.Models.Field.Response, Never>()
    public let languagePublisher = PassthroughSubject<DNSFormStage.Models.Language.Response, Never>()
    public let tabPublisher = PassthroughSubject<DNSFormStage.Models.Tab.Response, Never>()

    // MARK: - Incoming Pipelines
    override open func subscribe(to baseViewController: BaseStage.Logic.Display) {
        super.subscribe(to: baseViewController)
        // swiftlint:disable:next force_cast
        let viewController = baseViewController as! DNSFormStage.Logic.Display
        subscribers.append(viewController.fieldChangedPublisher
            .sink { [weak self] request in self?.doFieldChanged(request) })
        subscribers.append(viewController.fileDeletePublisher
            .sink { [weak self] request in self?.doFileDelete(request) })
        subscribers.append(viewController.fileSelectPublisher
            .sink { [weak self] request in self?.doFileSelect(request) })
        subscribers.append(viewController.fileUploadPublisher
            .sink { [weak self] request in self?.doFileUpload(request) })
        subscribers.append(viewController.imageDeletePublisher
            .sink { [weak self] request in self?.doImageDelete(request) })
        subscribers.append(viewController.imagePopupPublisher
            .sink { [weak self] request in self?.doImagePopup(request) })
        subscribers.append(viewController.imageSelectPublisher
            .sink { [weak self] request in self?.doImageSelect(request) })
        subscribers.append(viewController.imageUploadPublisher
            .sink { [weak self] request in self?.doImageUpload(request) })
        subscribers.append(viewController.languageChangedPublisher
            .sink { [weak self] request in self?.doLanguageChanged(request) })
        subscribers.append(viewController.saveActionPublisher
            .sink { [weak self] request in self?.doSave(request) })
        subscribers.append(viewController.tabChangedPublisher
            .sink { [weak self] request in self?.doTabChanged(request) })
    }

    // MARK: - Workers -
    public var wkrMedia: WKRPTCLMedia = WKRCrashMedia()

    // MARK: - Stage Lifecycle -
    override open func startStage(with displayType: DNSBaseStage.Display.Mode,
                                  with displayOptions: DNSBaseStage.Display.Options = [],
                                  and initialization: DNSBaseStageBaseInitialization?) {
        super.startStage(with: displayType, with: displayOptions, and: initialization)
    }
    override open func stageWasUpdated() {
        super.stageWasUpdated()
    }
    override open func stageWillAppear(_ request: BaseStage.Models.Base.Request) {
        super.stageWillAppear(request)
        self.formUpdateLanguage()
    }

    // MARK: - Business Logic
    override open func doCloseAction(_ request: DNSFormStage.Models.Base.Request) {
        self.utilityAutoTrack("\(#function)")
        guard !self.formAnyChanges() else {
            self.formState = .cancelling
            self.messageUnsavedChanges()
            return
        }
        super.doCloseAction(request)
    }
    open func doFieldChanged(_ request: DNSFormStage.Models.Field.Request) {
    }
    open func doFileDelete(_ request: DNSFormStage.Models.Field.Request) {
        self.utilityAutoTrack("\(#function)")
    }
    open func doFileSelect(_ request: DNSFormStage.Models.Field.Request) {
        self.utilityAutoTrack("\(#function)")
        let response = DNSFormStage.Models.Field.Response(field: request.field)
        self.fileSelectPublisher.send(response)
    }
    open func doFileUpload(_ request: DNSFormStage.Models.Field.Request) {
        self.utilityAutoTrack("\(#function)")
    }
    open func doImageDelete(_ request: DNSFormStage.Models.Field.Request) {
        self.utilityAutoTrack("\(#function)")
    }
    open func doImagePopup(_ request: DNSFormStage.Models.ImagePopup.Request) {
        self.utilityAutoTrack("\(#function)")
        var response = DNSFormStage.Models.Message.Response(message: request.message,
                                                            style: .popup,
                                                            title: request.title)
        response.image = request.image
        response.nibName = "DNSFormDetailImagePopupViewController"
        response.nibBundle = .init(identifier: "DNSForm-DNSForm-resources")
        response.actions = [
            DNSFormStage.Form.ActionCodes.close: DNSFormStage.Form.Localizations.ImagePopup.closeButton
        ]
        self.messagePublisher.send(response)
    }
    open func doImageSelect(_ request: DNSFormStage.Models.Field.Request) {
        self.utilityAutoTrack("\(#function)")
        let response = DNSFormStage.Models.Field.Response(field: request.field)
        self.imageSelectPublisher.send(response)
    }
    open func doImageUpload(_ request: DNSFormStage.Models.Field.Request) {
        self.utilityAutoTrack("\(#function)")
    }
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
        self.utilityAutoTrack("\(#function)")
        self.selectedLanguage = request.languageCode
    }
    open func doSave(_ request: DNSFormStage.Models.Base.Request) { }
    open func doTabChanged(_ request: DNSFormStage.Models.Tab.Request) {
        self.utilityAutoTrack("\(#function)")
        self.selectedTabs[request.tabsCode] = request.selectedTabCode
        self.formUpdateTab(for: request.tabsCode)
    }

    // MARK: - Message methods
    open func messageUnsavedChanges() { }
    
    // MARK: - Form methods
    open func formAnyChanges() -> Bool {
        let anyChanges = false
        return anyChanges
    }
    open func formClearState() {
        self.formState = .none
        selectedLanguage = DNSCore.languageCode
    }
    open func formIsValid() -> Bool {
        let isValid = true
        return isValid
    }
    open func formRefresh() {
    }
    open func formUpdateLanguage() {
        DNSLowThread.run {
            let request = DNSFormStage.Models.Language.Response(languageCode: self.selectedLanguage)
            self.languagePublisher.send(request)
        }
    }
    open func formUpdateTab(for tabsCode: String) {
        DNSLowThread.run {
            let request = DNSFormStage.Models.Tab.Response(selectedTabCode: self.selectedTabs[tabsCode] ?? "",
                                                           tabsCode: tabsCode)
            self.tabPublisher.send(request)
        }
    }
}
