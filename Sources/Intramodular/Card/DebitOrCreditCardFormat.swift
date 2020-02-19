//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

public struct DebitOrCreditCardFormat {
    
}
public protocol DebitOrCreditCardFormatProtocol {
    var blocks: [Int] { get }
    var brand: DebitOrCreditCardBrand { get }
    func shouldFormat(_ string: String) -> Bool
    func isValid(_ string: String) -> Bool
}

public extension DebitOrCreditCardFormatProtocol {
    func formattedString(from string: String, delimiter: String = " ", repeatLastBlock: Bool = true) -> String {
        var invertedBlocks = Array(blocks.reversed())
        var formattedString = ""
        var subIdx = 0
        guard var currentBlock = invertedBlocks.popLast() else { return formattedString }
        for character in string {
            if subIdx == currentBlock {
                if let nextBlock = invertedBlocks.popLast() {
                    formattedString.append(delimiter)
                    subIdx = 0
                    currentBlock = nextBlock
                } else {
                    if repeatLastBlock {
                        formattedString.append(delimiter)
                        subIdx = 0
                    } else {
                        return formattedString
                    }
                }
            }
            formattedString.append(character)
            subIdx += 1
        }

        return formattedString
    }

    func isValid(_ string: String) -> Bool {
        guard shouldFormat(string) else { return false }
        guard string.count == blocks.reduce(0, +) else { return false }
        return LuhnCheck.validate(string)
    }
}
