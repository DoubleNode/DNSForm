//
//  DNSForm.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSAppCore
//
//  Created by Darren Ehlers.
//  Copyright © 2022 - 2016 DoubleNode.com. All rights reserved.
//

import DNSError
import Foundation

public enum DNSFormFieldType: String, CaseIterable {
    case none = ""
    case email
    case password
    case price
    case text
    case url
    case username
}
