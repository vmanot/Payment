//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct ChinaUnionPay: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 4, 4, 4]
        public let brand = DebitOrCreditCardBrand.chinaUnionPay
        
        private let maxLength = 19
        private let minLength = 13
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            return string.starts(with: "62") || string.starts(with: "81")
        }
        
        public func isValid(_ string: String) -> Bool {
            guard shouldFormat(string) else { return false }
            guard string.count >= minLength, string.count <= maxLength else { return false }
            return LuhnCheck.validate(string)
        }
    }
}
