//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

public enum DebitOrCreditCardBrand {
    case americanExpress
    case chinaUnionPay
    case dinersClubInternational
    case discover
    case jcb
    case masterCard
    case visa
    
    case unknown
}

extension DebitOrCreditCardFormat {
    public struct Unknown: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4]
        public let brand = DebitOrCreditCardBrand.unknown
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            return true
        }
        
        public func isValid(_ string: String) -> Bool {
            return false
        }
    }
}
