//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift
import SwiftUI

public enum DebitOrCreditCardBrand: String, CaseIterable, Codable, Hashable {
    case americanExpress
    case chinaUnionPay
    case dinersClubInternational
    case discover
    case jcb
    case masterCard
    case visa
    
    case unknown
}

extension DebitOrCreditCardBrand {
    public var logoImage: Image {
        Image(rawValue.lowercased() + ".logo")
    }
}
