//
// ErrorHandling.swift
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

enum SyntaxError: Error {
    case requiresCodableMacro(macroName: String)
    case mustBeStringLiteral
    case codingKeyValueRequired
    case codingKeyValueCannotBeEmpty
    case codingKeysExist
    case canOnlyBeAttachedToProperty(name: String)
    case canOnlyBeAttachedToStruct(name: String)
    case canOnlyBeAttachedToPropertiesAndStructs(name: String)

    var localizedDescription: String {
        switch self {
        case .requiresCodableMacro(let name): "@\(CCodable.macroName) is required to use @\(name)"
        case .mustBeStringLiteral: "CodingKey must be a String Literal"
        case .codingKeyValueRequired: "CodingKey must have a value String"
        case .codingKeyValueCannotBeEmpty: "CodingKey must pass a non-empty String"
        case .codingKeysExist: "Please remove `CodingKeys` to use @\(CCodable.macroName)"
        case .canOnlyBeAttachedToProperty(let name): "\(name) can only be attached to properties"
        case .canOnlyBeAttachedToStruct(let name): "\(name) can only be attached to structs"
        case .canOnlyBeAttachedToPropertiesAndStructs(let name): "\(name) can only be attached to properties and structs"
        }
    }
}

enum SyntaxWarning: Error {
    case multipleCodingKeyAttributes
    case defaultingToCodingKey
    case cannotBeAttachedToComputedProperties

    var localizedDescription: String {
        switch self {
        case .multipleCodingKeyAttributes: "Multiple CodingKey attributes found. Defaulting to the left most attribute"
        case .defaultingToCodingKey: "Multiple CodingKey attributes found. Defaulting to CodingKey(String)"
        case .cannotBeAttachedToComputedProperties: "CodingKey attributes cannot be attached to Computed Properties"
        }
    }
}

extension AttributeSyntax {
    func parameterValue(at index: Int) throws -> ExprSyntax? {
        guard let argumentList = arguments?.as(LabeledExprListSyntax.self), argumentList.count > index else {
            throw DiagnosticsError(diagnostics: [.init(node: self, syntaxError: .codingKeyValueRequired)])
        }
        let argument = argumentList[argumentList.index(argumentList.startIndex, offsetBy: index)]
        guard argument.expression.is(StringLiteralExprSyntax.self) else {
            throw DiagnosticsError(diagnostics: [.init(node: self, syntaxError: .mustBeStringLiteral)])
        }
        // Uses the value in the Macro
        guard let customKeyValue = argument.as(LabeledExprSyntax.self)?.expression else {
            throw DiagnosticsError(diagnostics: [.init(node: self, syntaxError: .codingKeyValueRequired)])
        }

        return customKeyValue
    }
}

