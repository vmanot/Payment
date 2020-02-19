//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift
import SwiftUI

extension IndiaUPI {
    public enum Client: String, CaseIterable, Codable, Hashable {
        case bhim
        case googlePay
        case paytm
        case phonepe
        
        public var description: String {
            switch self {
                case .bhim:
                    return "bhim UPI"
                case .googlePay:
                    return "Google Pay"
                case .paytm:
                    return "paytm"
                case .phonepe:
                    return "phonepe"
            }
        }
    }
}

extension IndiaUPI.Identifier {
    public var clientGuess: IndiaUPI.Client? {
        if value.contains("@paytm") {
            return .paytm
        } else if value.contains("@upi") {
            return .bhim
        } else if value.contains("@ybl") {
            return .phonepe
        } else if value.contains("@ok_") {
            return .googlePay
        } else {
            return nil
        }
    }
}

extension IndiaUPI.Client {
    private var logoImageNamePrefix: String {
        switch self {
            case .bhim:
                return "bhim"
            case .googlePay:
                return "gpay"
            case .paytm:
                return "paytm"
            case .phonepe:
                return "phonepe"
        }
    }
    
    public var logoImage: Image {
        Image(logoImageNamePrefix + ".logo.circle.fill")
    }
}
