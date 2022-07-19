//
//  DNSFormCodeLocation.swift
//  DoubleNode Swift Framework (DNSFramework) - DNSForm
//
//  Created by Darren Ehlers.
//  Copyright © 2020 - 2016 DoubleNode.com. All rights reserved.
//

import DNSError

public extension DNSCodeLocation {
    typealias form = DNSFormCodeLocation
}
open class DNSFormCodeLocation: DNSCodeLocation {
    override open class var domainPreface: String { "com.doublenode.form." }
}
