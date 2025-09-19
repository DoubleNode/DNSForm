//
//  DNSFormDetailSpacerCell.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2025 - 2016 DoubleNode.com. All rights reserved.
//

import Combine
import DNSBaseStage
import DNSCoreThreading
import UIKit

public protocol DNSFormDetailSpacerCellLogic: DNSBaseStageCellLogic {
    typealias Stage = DNSFormStage
    // MARK: - Outgoing Pipelines -
}
open class DNSFormDetailSpacerCell: DNSBaseStageCollectionViewCell, DNSFormDetailSpacerCellLogic {
    public typealias Stage = DNSFormStage
    static public let recommendedContentSize = CGSize(width: 414, height: 20)
    static public let heightForSection: Double = recommendedContentSize.height

    public struct Data: Hashable {
        public var id: UUID = UUID()
        public init() { }
    }
    public var data: Data?
}
