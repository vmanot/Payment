//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

extension String {
    func numberStarts(between initial: String, and final: String) -> Bool {
        let maxCount = max(initial.count, final.count)
        guard
            let initialNumber = Int(initial),
            let finalNumber = Int(final),
            let prefix = Int(self.prefix(maxCount))
            else { return false }
        
        let initialNormalized = initialNumber * (maxCount - initial.count + 1)
        let finalNormalized = finalNumber  * (maxCount - final.count + 1)
        
        return prefix >= initialNormalized && prefix <= finalNormalized
    }
}
