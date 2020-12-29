//
//  File.swift
//  
//
//  Created by PJ Fechner on 9/26/19.
//

import Quick
import Nimble

/// This predicate
public func haveEqualLines(to expectedValue: String, trimWhitespace: Bool = true) -> Predicate<String> {
    // Can be shortened to:
    //   Predicate { actual in  ... }
    //
    // But shown with types here for clarity.
    return Predicate { (actualExpression: Expression<String>) throws -> PredicateResult in
        guard let actualValue = try actualExpression.evaluate() else {
            return PredicateResult(status: .fail, message: ExpectationMessage.fail("").appendedBeNilHint())
        }

        let expectedLines = expectedValue.split(separator: "\n")
        let actualLines = actualValue.split(separator: "\n")

        guard actualLines.count >= expectedLines.count  else {
            return PredicateResult(status: .fail,
                                   message: ExpectationMessage
                                    .expectedCustomValueTo("""
                                        have \(expectedLines.count) lines

                                        \(expectedValue)
                                        """, actual: """
                                        \(actualLines.count) lines

                                        \(actualValue)
                                        """))
        }

        for i in 0..<actualLines.count {
            let isEqual = !trimWhitespace ? expectedLines[i] == actualLines[i] :
                (expectedLines[i].trimmingCharacters(in: .whitespacesAndNewlines) ==
                    actualLines[i].trimmingCharacters(in: .whitespacesAndNewlines))
            if !isEqual {
                return PredicateResult(status: .fail,
                                       message: ExpectationMessage
                                        .expectedCustomValueTo("have line \(i) be \(expectedLines[i]) ", actual: "\(actualLines[i])"))
            }
        }

        return PredicateResult(
            bool: true,
            message: ExpectationMessage.expectedTo("Match XML")
        )
    }
}
