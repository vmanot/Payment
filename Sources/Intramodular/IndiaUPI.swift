//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

public struct IndiaUPI {
    public struct Identifier: Codable, Hashable, Identifiable {
        public let value: String
        
        public var id: String {
            value
        }
        
        public init(_ value: String) {
            self.value = value
        }
    }
}

extension IndiaUPI {
    public enum Client: String, Codable, Hashable {
        case BHIM
        case GooglePay
        case Paytm
        case PhonePe
        
        public var description: String {
            switch self {
                case .BHIM:
                    return "BHIM UPI"
                case .GooglePay:
                    return "Google Pay"
                case .Paytm:
                    return "Paytm"
                case .PhonePe:
                    return "PhonePe"
            }
        }
    }
}

extension IndiaUPI.Identifier {
    public var clientGuess: IndiaUPI.Client? {
        if value.contains("@paytm") {
            return .Paytm
        } else if value.contains("@upi") {
            return .BHIM
        } else if value.contains("@ybl") {
            return .PhonePe
        } else if value.contains("@ok_") {
            return .GooglePay
        } else {
            return nil
        }
    }
}
