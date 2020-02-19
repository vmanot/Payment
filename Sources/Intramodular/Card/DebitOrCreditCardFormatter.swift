//
// Copyright (c) Vatsal Manot
//

import Foundation
import Swift

public enum DebitOrCreditCardFormatters {
    public static let general: [DebitOrCreditCardFormatProtocol] = [
        DebitOrCreditCardFormat.VISA(),
        DebitOrCreditCardFormat.MasterCard(),
        DebitOrCreditCardFormat.AmericanExpress(),
        DebitOrCreditCardFormat.DinersClubInternational(),
        DebitOrCreditCardFormat.Discover(),
        DebitOrCreditCardFormat.JCB()
    ]
    public static let all: [DebitOrCreditCardFormatProtocol] = general + [DebitOrCreditCardFormat.ChinaUnionPay()]
}

/// A formatter that provides legible brand-specific representations of credit card numbers.
public final class DebitOrCreditCardFormatter {
    public var delimiter: String
    public var repeatLastBlock: Bool
    public var formatters: [DebitOrCreditCardFormatProtocol] = DebitOrCreditCardFormatters.general
    private let unknownFormatter = DebitOrCreditCardFormat.Unknown()
    
    public init(delimiter: String = " ", repeatLastBlock: Bool = true) {
        self.delimiter = delimiter
        self.repeatLastBlock = repeatLastBlock
    }
    
    private func removeNonDecimalDigits(from string: String) -> String {
        let characterSet: CharacterSet = .decimalDigits
        return string.removingCharacters(in: characterSet.inverted)
    }
    
    private func selectFormatter(from string: String) -> DebitOrCreditCardFormatProtocol {
        guard let formatter = formatters.first(where: { $0.shouldFormat(string) }) else { return unknownFormatter }
        return formatter
    }
    
    private func shouldRepeatLastBlock(for formatter: DebitOrCreditCardFormatProtocol) -> Bool {
        return repeatLastBlock || formatter.brand == unknownFormatter.brand
    }
    
    public func formattedString(from string: String) -> String {
        let strippedString = removeNonDecimalDigits(from: string)
        let formatter = selectFormatter(from: strippedString)
        return formatter.formattedString(from: strippedString, delimiter: delimiter, repeatLastBlock: shouldRepeatLastBlock(for: formatter))
    }
    
    public func brand(from string: String) -> DebitOrCreditCardBrand {
        let strippedString = removeNonDecimalDigits(from: string)
        let formatter = selectFormatter(from: strippedString)
        return formatter.brand
    }
    
    public func isValid(_ string: String) -> Bool {
        let strippedString = removeNonDecimalDigits(from: string)
        let formatter = selectFormatter(from: strippedString)
        return formatter.isValid(strippedString)
    }
}

extension String {
    func removingCharacters(in set: CharacterSet) -> String {
        let filtered = unicodeScalars.lazy.filter { !set.contains($0) }
        return String(String.UnicodeScalarView(filtered))
    }
}
