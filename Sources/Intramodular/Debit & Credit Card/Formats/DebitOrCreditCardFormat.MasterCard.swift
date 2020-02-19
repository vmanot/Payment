//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct MasterCard: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 4, 4, 4]
        public let brand = DebitOrCreditCardBrand.masterCard
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            let allowedRanges = [("2221", "2720"), ("51", "55")]
            for allowedRange in allowedRanges {
                if string.numberStarts(between: allowedRange.0, and: allowedRange.1) {
                    return true
                }
            }
            return false
        }
    }
}
