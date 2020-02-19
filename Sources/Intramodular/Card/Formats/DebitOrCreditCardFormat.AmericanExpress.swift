//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct AmericanExpress: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 6, 5]
        public let brand = DebitOrCreditCardBrand.americanExpress
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            return string.starts(with: "34") || string.starts(with: "37")
        }
    }
}
