//
// DiagnosticConvenience.swift
//

import Foundation
import SwiftSyntax
import SwiftDiagnostics
import SwiftSyntaxMacroExpansion

extension Diagnostic {
    init(
        node: some SyntaxProtocol,
        position: AbsolutePosition? = nil,
        syntaxError: SyntaxError,
        highlights: [Syntax]? = nil,
        notes: [Note] = [],
        fixIts: [FixIt] = []) {
            self.init(node: node,
                      position: position,
                      message: MacroExpansionErrorMessage(syntaxError.localizedDescription),
                      highlights: highlights,
                      notes: notes,
                      fixIts: fixIts)
        }
}

extension Diagnostic {
    init(
        node: some SyntaxProtocol,
        position: AbsolutePosition? = nil,
        syntaxWarning: SyntaxWarning,
        highlights: [Syntax]? = nil,
        notes: [Note] = [],
        fixIts: [FixIt] = []) {
            self.init(node: node,
                      position: position,
                      message: MacroExpansionWarningMessage(syntaxWarning.localizedDescription),
                      highlights: highlights,
                      notes: notes,
                      fixIts: fixIts)
        }
}
