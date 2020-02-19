//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension DebitOrCreditCardFormat {
    public struct JCB: DebitOrCreditCardFormatProtocol {
        public let blocks: [Int] = [4, 4, 4, 4, 3]
        public let brand = DebitOrCreditCardBrand.jcb
        
        private let maxLength = 19
        private let minLength = 16
        
        public init() {}
        
        public func shouldFormat(_ string: String) -> Bool {
            return string.numberStarts(between: "3528", and: "3589")
        }
        
        public func isValid(_ string: String) -> Bool {
            guard shouldFormat(string) else { return false }
            guard string.count >= minLength, string.count <= maxLength else { return false }
            return LuhnCheck.validate(string)
        }
    }
}
