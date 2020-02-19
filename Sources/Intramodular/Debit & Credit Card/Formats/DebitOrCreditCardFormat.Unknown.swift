//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

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
