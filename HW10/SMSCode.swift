import SwiftUI

struct SMSCode {
    var code: String
    var phoneNumber: String
}

infix operator ~= : ComparisonPrecedence

extension Sequence where Iterator.Element == SMSCode {
    static func ~=(sequence: Self, code: String) -> [SMSCode] {
        return sequence.filter { $0.code == code }
    }
}

