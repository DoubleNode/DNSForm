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

    static public var copiedImage = UIImage(dnsSymbol: SFSymbol4.List.clipboard)
    static public var copyImage = UIImage(dnsSymbol: SFSymbol4.Arrow.rightDocOnClipboard)
    static public var pasteImage = UIImage(dnsSymbol: SFSymbol4.Clipboard.fill)

    public struct Data: Hashable {
        public var allowTabCopy: Bool
        public var copiedTabCode: String
        public var languageCode: String
        public var label: String
        public var lineBottomOffset: Double
        public var section: Int
        public var selectedTabCode: String
        public var tabs: [String] = []
        public var tabsCode: String
        public var tabStrings: [String: DNSString] = [:]

        public init(allowTabCopy: Bool = false, copiedTabCode: String = "", languageCode: String, label: String, lineBottomOffset: Double, section: Int,
                    selectedTabCode: String, tabs: [String], tabsCode: String, tabStrings: [String: DNSString]) {
            self.allowTabCopy = allowTabCopy
            self.copiedTabCode = copiedTabCode
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
                    $0.setImage(nil, for: .normal)
//                    $0.setImage(Self.copiedImage, for: .normal)
                    $0.imageView?.isHidden = true
                }
                lineViewBottomConstraint.constant = 0
                sectionLabel.text = ""

                self.copyButton.isEnabled = false
                self.copyButton.setImage(nil, for: .normal)
                self.pasteButton.isEnabled = false
                self.pasteButton.setImage(nil, for: .normal)
                return
            }
            self.pasteButton.isEnabled = false
            if data.allowTabCopy {
                self.copyButton.isEnabled = true
                self.copyButton.setImage(Self.copyImage, for: .normal)
                if !data.copiedTabCode.isEmpty &&
                    data.copiedTabCode != data.selectedTabCode {
                    self.pasteButton.isEnabled = true
                }
                self.pasteButton.setImage(Self.pasteImage, for: .normal)
            } else {
                self.copyButton.isEnabled = false
                self.copyButton.setImage(nil, for: .normal)
                self.pasteButton.setImage(nil, for: .normal)
            }
            self.tabButtons.forEach {
                let index = self.tabButtons.firstIndex(of: $0) ?? 0
                let equalWidthConstraint = self.tabButtonEqualWidthConstraints[index]
                let widthConstraint = self.tabButtonWidthConstraints[index]
                if data.tabs.count > index {
                    equalWidthConstraint?.isActive = true
                    widthConstraint?.isActive = false
                    let tabCode = data.tabs[index]
                    $0.setTitle(data.tabStrings[tabCode]?.asString(for: data.languageCode), for: .normal)
                    $0.isEnabled = data.selectedTabCode != tabCode
                    $0.isSelected = data.selectedTabCode == tabCode
                    $0.alpha = $0.isEnabled ? 0.3 : 1.0
                    $0.isHidden = false
                    if data.allowTabCopy {
                        if data.copiedTabCode == tabCode {
                            $0.setImage(Self.copiedImage, for: .normal)
                            $0.imageView?.isHidden = false
                            self.copyButton.isEnabled = false
                        } else {
                            $0.setImage(nil, for: .normal)
//                            $0.setImage(Self.copiedImage, for: .normal)
                            $0.imageView?.isHidden = true
                        }
                    } else {
                        $0.setImage(nil, for: .normal)
//                        $0.setImage(Self.copiedImage, for: .normal)
                        $0.imageView?.isHidden = true
                    }
                } else {
                    equalWidthConstraint?.isActive = false
                    widthConstraint?.isActive = true
                    $0.isEnabled = false
                    $0.isHidden = true
                    $0.setImage(nil, for: .normal)
//                    $0.setImage(Self.copiedImage, for: .normal)
                    $0.imageView?.isHidden = true
                }
            }

            lineViewBottomConstraint.constant = data.lineBottomOffset
            sectionLabel.text = data.label
        }
    }

    var tabButtons: [DNSUIButton] = []
    var tabButtonEqualWidthConstraints: [NSLayoutConstraint?] = []
    var tabButtonWidthConstraints: [NSLayoutConstraint?] = []

    @IBOutlet var copyButton: DNSUIButton!
    @IBOutlet var pasteButton: DNSUIButton!
    @IBOutlet var tab1Button: DNSUIButton!
    @IBOutlet var tab2Button: DNSUIButton!
    @IBOutlet var tab2ButtonEqualWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab2ButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab3Button: DNSUIButton!
    @IBOutlet var tab3ButtonEqualWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab3ButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab4Button: DNSUIButton!
    @IBOutlet var tab4ButtonEqualWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab4ButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab5Button: DNSUIButton!
    @IBOutlet var tab5ButtonEqualWidthConstraint: NSLayoutConstraint!
    @IBOutlet var tab5ButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet var lineView: UIView!
    @IBOutlet var lineViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var sectionLabel: DNSUILabel!

    // MARK: - Outgoing Pipelines -
    public var copyPublisher = PassthroughSubject<Stage.Models.Tab.Request, Never>()
    public var pastePublisher = PassthroughSubject<Stage.Models.Tab.Request, Never>()
    public var selectedPublisher = PassthroughSubject<Stage.Models.Tab.Request, Never>()

    override open func awakeFromNib() {
        super.awakeFromNib()
        tabButtons = [
            tab1Button, tab2Button, tab3Button, tab4Button, tab5Button,
        ]
        tabButtonEqualWidthConstraints = [
            nil, tab2ButtonEqualWidthConstraint, tab3ButtonEqualWidthConstraint, tab4ButtonEqualWidthConstraint, tab5ButtonEqualWidthConstraint,
        ]
        tabButtonWidthConstraints = [
            nil, tab2ButtonWidthConstraint, tab3ButtonWidthConstraint, tab4ButtonWidthConstraint, tab5ButtonWidthConstraint,
        ]
    }
    override open func contentInit() {
        super.contentInit()
        data = nil
    }

    // MARK: - Action methods -
    @IBAction func copyAction(sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        guard let data,
              !data.selectedTabCode.isEmpty else { return }
        copyPublisher.send(Stage.Models.Tab.Request(selectedTabCode: data.selectedTabCode,
                                                    tabsCode: data.tabsCode))
    }
    @IBAction func pasteAction(sender: UIButton) {
        self.utilityAutoTrack("\(#function)")
        guard let data,
              !data.selectedTabCode.isEmpty,
              !data.copiedTabCode.isEmpty,
              data.selectedTabCode != data.copiedTabCode else { return }
        pastePublisher.send(Stage.Models.Tab.Request(selectedTabCode: data.selectedTabCode,
                                                     tabsCode: data.tabsCode))
    }
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
