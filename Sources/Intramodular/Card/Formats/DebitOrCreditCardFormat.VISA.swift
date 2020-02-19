//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct VISA: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 4, 4, 4]
        public let brand = DebitOrCreditCardBrand.visa
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            return string.starts(with: "4")
        }
    }
}
