//
//  DNSFormDetailLanguageSelectionCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSBaseTheme
import DNSCore
import DNSProtocols
import SFSymbol
import UIKit

public protocol DNSFormDetailLanguageSelectionCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormDetailStage
    // MARK: - Outgoing Pipelines -
    var selectedPublisher: PassthroughSubject<Stage.Models.Language.Request, Never> { get }
}
open class DNSFormDetailLanguageSelectionCell: DNSBaseStageCollectionViewCell,
                                               DNSFormDetailLanguageSelectionCellLogic {
    public typealias Stage = DNSFormDetailStage
    static public let recommendedContentSize = CGSize(width: 414, height: 60)

    public struct Data: Hashable {
        public var languageCode: String
        public var label: String
        public var lineBottomOffset: Double
        public var section: Int

        public init(languageCode: String, label: String, lineBottomOffset: Double, section: Int) {
            self.languageCode = languageCode
            self.label = label
            self.lineBottomOffset = lineBottomOffset
            self.section = section
        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                enButton.isEnabled = false
                enButton.alpha = 0.3
                es419Button.isEnabled = false
                es419Button.alpha = 0.3
                lineViewBottomConstraint.constant = 0
                sectionLabel.text = ""
                return
            }
            enButton.isEnabled = data.languageCode != "en"
            enButton.isSelected = data.languageCode == "en"
            enButton.alpha = data.languageCode != "en" ? 0.3 : 1.0
            es419Button.isEnabled = data.languageCode != "es-419"
            es419Button.isSelected = data.languageCode == "es-419"
            es419Button.alpha = data.languageCode != "es-419" ? 0.3 : 1.0
            lineViewBottomConstraint.constant = data.lineBottomOffset
            sectionLabel.text = data.label
        }
    }

    @IBOutlet var enButton: DNSUIButton!
    @IBOutlet var es419Button: DNSUIButton!
    @IBOutlet var lineView: UIView!
    @IBOutlet var lineViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var sectionLabel: DNSUILabel!

    // MARK: - Outgoing Pipelines -
    public var selectedPublisher = PassthroughSubject<Stage.Models.Language.Request, Never>()

    override open func contentInit() {
        super.contentInit()
        style = DNSThemeViewStyle.DNSForm.clear
        enButton.style = DNSThemeButtonStyle.DNSForm.indexTab
        es419Button.style = DNSThemeButtonStyle.DNSForm.indexTab
        sectionLabel.style = DNSThemeLabelStyle.DNSForm.section
        data = nil
    }

    // MARK: - Action methods -
    @IBAction func selectAction(sender: UIButton) {
        self.wkrAnalytics.doAutoTrack(class: String(describing: self), method: "\(#function)")
        var language = ""
        if sender == enButton {
            language = "en"
        } else if sender == es419Button {
            language = "es-419"
        }
        guard !language.isEmpty else { return }
        selectedPublisher.send(Stage.Models.Language.Request(languageCode: language))
    }
}
