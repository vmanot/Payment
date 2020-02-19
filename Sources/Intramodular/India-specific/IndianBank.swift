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
}
