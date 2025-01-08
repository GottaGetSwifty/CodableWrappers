//
//  Helpers.swift
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(CodableWrapperMacros)
@testable import CodableWrapperMacros

extension DiagnosticSpec {
    init(warning: SyntaxWarning, line: Int, column: Int,
         originatorFile: StaticString = #filePath,
         originatorLine: UInt = #line) {
        self.init(message: warning.localizedDescription, line: line, column: column, severity: .warning,
                  originatorFile: originatorFile, originatorLine: originatorLine)
    }

    init(error: SyntaxError, line: Int, column: Int,
         originatorFile: StaticString = #filePath,
         originatorLine: UInt = #line) {
        self.init(message: error.localizedDescription, line: line, column: column, severity: .error,
                  originatorFile: originatorFile, originatorLine: originatorLine)
    }
}

#endif
