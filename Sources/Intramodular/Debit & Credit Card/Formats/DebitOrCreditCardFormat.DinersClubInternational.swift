//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct DinersClubInternational: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 6, 4]
        public let brand = DebitOrCreditCardBrand.dinersClubInternational
        
        private let maxLength = 19
        private let minLength = 14
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            let allowedRanges = [("300", "305"), ("38", "39")]
            for allowedRange in allowedRanges {
                if string.numberStarts(between: allowedRange.0, and: allowedRange.1) {
                    return true
                }
            }
            return string.starts(with: "36") || string.starts(with: "3095")
        }
        
        public func isValid(_ string: String) -> Bool {
            guard shouldFormat(string) else { return false }
            guard string.count >= minLength, string.count <= maxLength else { return false }
            return LuhnCheck.validate(string)
        }
    }
}
