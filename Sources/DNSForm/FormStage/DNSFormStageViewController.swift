//
//  DNSFormStageViewController.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import Foundation

public protocol DNSFormStageDisplayLogic: DNSBaseStageDisplayLogic {
    // MARK: - Outgoing Pipelines
    var fieldChangedPublisher: PassthroughSubject<DNSFormStage.Models.Field.Request, Never> { get }
    var saveActionPublisher: PassthroughSubject<DNSFormStage.Models.Base.Request, Never> { get }
}
public class DNSFormStageViewController: DNSBaseStageViewController, DNSFormStageDisplayLogic {
    public var fieldChangedPublisher = PassthroughSubject<DNSFormStage.Models.Field.Request, Never>()
    public var saveActionPublisher = PassthroughSubject<DNSFormStage.Models.Base.Request, Never>()

    // MARK: - Incoming Pipelines
    var subscribers: [AnyCancellable] = []
    override open func subscribe(to basePresenter: BaseStage.Logic.Presentation) {
        super.subscribe(to: basePresenter)
        // swiftlint:disable:next force_cast
        let presenter = basePresenter as! DNSFormStage.Logic.Presentation

        weak var weakSelf = self
        subscribers.removeAll()
        subscribers.append(presenter.fieldAlertPublisher
            .sink { request in weakSelf?.displayFieldAlert(request) })
    }

    // MARK: - Display Logic
    func displayFieldAlert(_ viewModel: DNSFormStage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
    }

    // MARK: - Action methods -
    func fieldChangedAction(request: DNSFormStage.Models.Field.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldChangedPublisher.send(request)
    }
}
