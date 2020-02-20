//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift
import SwiftUI

public enum IndianBank: String, CaseIterable, Codable, Hashable {
    case axis
    case hdfc
    case icici
    case kotak
    case sbi
}

extension IndianBank {
    public var logoImage: Image {
        Image(rawValue + ".logo.circle.fill")
    }
    
    public var cashfreePaymentCode: String {
        switch self {
            case .axis:
                return "3003"
            case .hdfc:
                return "3021"
            case .icici:
                return "3022"
            case .kotak:
                return "3032"
            case .sbi:
                return "3044"
        }
    }
}

// MARK: - Protocol Implementations -

extension IndianBank: CustomStringConvertible {
    public var shortDescription: String {
        switch self {
            case .axis:
                return "Axis"
            case .hdfc:
                return "HDFC"
            case .icici:
                return "ICICI"
            case .kotak:
                return "Kotak"
            case .sbi:
                return "SBI"
        }
    }
    
    public var description: String {
        shortDescription // FIXME
    }
}

extension IndianBank: Identifiable {
    public var id: String {
        rawValue
    }
}
