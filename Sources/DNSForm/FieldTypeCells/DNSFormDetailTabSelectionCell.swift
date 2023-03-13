//
//  DNSFormDetailTabSelectionCell.swift
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

public protocol DNSFormDetailTabSelectionCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
    var selectedPublisher: PassthroughSubject<Stage.Models.Tab.Request, Never> { get }
}
open class DNSFormDetailTabSelectionCell: DNSBaseStageCollectionViewCell, DNSFormDetailTabSelectionCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 60)

    public struct Data: Hashable {
        public var languageCode: String
        public var label: String
        public var lineBottomOffset: Double
        public var section: Int
        public var selectedTabCode: String
        public var tabs: [String] = []
        public var tabsCode: String
        public var tabStrings: [String: DNSString] = [:]

        public init(languageCode: String, label: String, lineBottomOffset: Double, section: Int,
                    selectedTabCode: String, tabs: [String], tabsCode: String, tabStrings: [String: DNSString]) {
            self.languageCode = languageCode
            self.label = label
            self.lineBottomOffset = lineBottomOffset
            self.section = section
            self.selectedTabCode = selectedTabCode
            self.tabs = tabs
            self.tabsCode = tabsCode
            self.tabStrings = tabStrings
            if selectedTabCode.isEmpty && !tabs.isEmpty {
                self.selectedTabCode = tabs.first ?? ""
            }

        }
    }
    public var data: Data? {
        didSet {
            guard let data = self.data else {
                self.tabButtons.forEach {
                    $0.isEnabled = false
                    $0.isHidden = true
                }
                lineViewBottomConstraint.constant = 0
                sectionLabel.text = ""
                return
            }
            self.tabButtons.forEach {
                let index = self.tabButtons.firstIndex(of: $0) ?? 0
                if data.tabs.count > index {
                    let tabCode = data.tabs[index]
                    $0.setTitle(data.tabStrings[tabCode]?.asString(for: data.languageCode), for: .normal)
                    $0.isEnabled = data.selectedTabCode != tabCode
                    $0.isHidden = false
                    $0.alpha = $0.isEnabled ? 0.3 : 1.0
                } else {
                    $0.isEnabled = false
                    $0.isHidden = true
                }
            }

            lineViewBottomConstraint.constant = data.lineBottomOffset
            sectionLabel.text = data.label
        }
    }

    var tabButtons: [DNSUIButton] = []

    @IBOutlet var tab1Button: DNSUIButton!
    @IBOutlet var tab2Button: DNSUIButton!
    @IBOutlet var tab3Button: DNSUIButton!
    @IBOutlet var tab4Button: DNSUIButton!
    @IBOutlet var tab5Button: DNSUIButton!
    @IBOutlet var lineView: UIView!
    @IBOutlet var lineViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var sectionLabel: DNSUILabel!

    // MARK: - Outgoing Pipelines -
    public var selectedPublisher = PassthroughSubject<Stage.Models.Tab.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        tabButtons = [
            tab1Button, tab2Button, tab3Button, tab4Button, tab5Button,
        ]
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - Action methods -
    @IBAction func selectAction(sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        guard let data,
            let sender = sender as? DNSUIButton else { return }
        let buttonIndex = tabButtons.firstIndex(of: sender) ?? 0
        let newTabCode = (buttonIndex < tabButtons.count) ? data.tabs[buttonIndex] : ""
        guard !newTabCode.isEmpty else { return }
        selectedPublisher.send(Stage.Models.Tab.Request(selectedTabCode: newTabCode,
                                                        tabsCode: data.tabsCode))
    }
}
