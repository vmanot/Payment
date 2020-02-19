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
