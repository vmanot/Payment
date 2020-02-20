//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift
import SwiftUI

public enum IndianBank: String, CaseIterable, Codable, Hashable, Identifiable {
    case axis
    case hdfc
    case icici
    case kotak
    case sbi
    
    public var id: String {
        return rawValue
    }
}

extension IndianBank {
    public var logoImage: Image {
        Image(rawValue + ".logo.circle.fill")
    }
}
