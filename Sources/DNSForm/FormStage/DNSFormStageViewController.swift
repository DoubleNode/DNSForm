//
//  DNSFormStageViewController.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSCoreThreading
import Foundation

public protocol DNSFormStageDisplayLogic: DNSBaseStageDisplayLogic {
    // MARK: - Outgoing Pipelines
    var fieldChangedPublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
    var saveActionPublisher: PassthroughSubject<DNSFormStage.Models.Base.Request, Never> { get }
}
open class DNSFormStageViewController: DNSBaseStageViewController, DNSFormStageDisplayLogic {
    public var fieldChangedPublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()
    public var saveActionPublisher = PassthroughSubject<DNSFormStage.Models.Base.Request, Never>()
    
    public var anyChanges = false
    public var enableSave = false
    public var fieldAlertMessages: [String: String] = [:]
    
    // MARK: - Incoming Pipelines
    public var subscribers: [AnyCancellable] = []
    override open func subscribe(to basePresenter: BaseStage.Logic.Presentation) {
        super.subscribe(to: basePresenter)
        // swiftlint:disable:next force_cast
        let presenter = basePresenter as! DNSFormStage.Logic.Presentation
        
        weak var weakSelf = self
        subscribers.removeAll()
        subscribers.append(presenter.fieldAlertPublisher
            .sink { request in weakSelf?.displayFieldAlert(request) })
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.anyChanges = false
        self.enableSave = false
    }
    
    // MARK: - Display Logic
    open func displayFieldAlert(_ viewModel: DNSFormStage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldAlertMessages[viewModel.field] = viewModel.alertMessage
        self.utilityRefreshForm()
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
    
    // MARK: - Utility methods
    open func utilityRefreshForm() {
    }
}
