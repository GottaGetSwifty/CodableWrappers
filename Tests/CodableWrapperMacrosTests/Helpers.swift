//
//  Helpers.swift
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

@testable import CodableWrapperMacros

extension DiagnosticSpec {
    init(warning: SyntaxWarning, line: Int, column: Int) {
        self.init(message: warning.localizedDescription, line: line, column: column, severity: .warning)
    }

    init(error: SyntaxError, line: Int, column: Int) {
        self.init(message: error.localizedDescription, line: line, column: column, severity: .error)
    }
}
