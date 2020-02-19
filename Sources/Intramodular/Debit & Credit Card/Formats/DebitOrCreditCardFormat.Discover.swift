//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct Discover: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 4, 4, 4, 3]
        public let brand = DebitOrCreditCardBrand.discover
        
        private let maxLength = 19
        private let minLength = 16
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            let allowedRanges = [("622126", "622925"),
                                 ("624000", "626999"),
                                 ("628200", "628899"),
                                 ("64", "65")]
            for allowedRange in allowedRanges {
                if string.numberStarts(between: allowedRange.0, and: allowedRange.1) {
                    return true
                }
            }
            return string.starts(with: "6011")
        }
        
        public func isValid(_ string: String) -> Bool {
            guard shouldFormat(string) else { return false }
            guard string.count >= minLength, string.count <= maxLength else { return false }
            return LuhnCheck.validate(string)
        }
    }
}
