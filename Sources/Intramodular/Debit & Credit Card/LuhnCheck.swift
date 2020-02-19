//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

public enum LuhnCheck {
    public static func validate(_ string: String) -> Bool {
        var sum = 0
        for (idx, character) in string.reversed().enumerated() {
            guard let digit = character.wholeNumberValue else { return false }
            let isOdd = idx % 2 == 1
            if isOdd {
                if digit == 9 {
                    sum += 9
                } else {
                    sum += (digit * 2) % 9
                }
            } else {
                sum += digit
            }
        }
        return sum % 10 == 0
    }
}
