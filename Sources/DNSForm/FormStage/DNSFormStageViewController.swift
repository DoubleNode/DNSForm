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
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines
    var fieldChangedPublisher: PassthroughSubject<Stage.Models.Field.Request, Never> { get }
    var saveActionPublisher: PassthroughSubject<Stage.Models.Base.Request, Never> { get }
}
public class DNSFormStageViewController: DNSBaseStageViewController, DNSFormStageDisplayLogic {
    public typealias Stage = DNSFormStage
    public var fieldChangedPublisher = PassthroughSubject<Stage.Models.Field.Request, Never>()
    public var saveActionPublisher = PassthroughSubject<Stage.Models.Base.Request, Never>()

    // MARK: - Incoming Pipelines
    var subscribers: [AnyCancellable] = []
    override open func subscribe(to basePresenter: BaseStage.Logic.Presentation) {
        super.subscribe(to: basePresenter)
        // swiftlint:disable:next force_cast
        let presenter = basePresenter as! Stage.Logic.Presentation

        weak var weakSelf = self
        subscribers.removeAll()
        subscribers.append(presenter.fieldAlertPublisher
            .sink { request in weakSelf?.displayFieldAlert(request) })
    }

    // MARK: - Display Logic
    func displayFieldAlert(_ viewModel: Stage.Models.Field.ViewModel) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
    }

    // MARK: - Action methods -
    func fieldChangedAction(request: Stage.Models.Field.Request) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        self.fieldChangedPublisher.send(request)
    }
}
