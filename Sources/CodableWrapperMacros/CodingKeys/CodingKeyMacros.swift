//
// CodingKeyMacros.swift
//
// Macro definitions for custom CodingKeys

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

public struct CodingKey: PeerMacro, MacroNameable {
    static let macroName: String = "CodingKey"
    public static func expansion(of node: AttributeSyntax, providingPeersOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard declaration.as(VariableDeclSyntax.self) != nil else {
            throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .canOnlyBeAttachedToProperty(name: "@\(macroName)"))])
        }
        return []
    }
}

public struct CodingKeyPrefix: PeerMacro {
    static let macroName: String = "CodingKeyPrefix"
    public static func expansion(of node: AttributeSyntax, providingPeersOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            guard structDecl.hasCodableAttribute else {
                throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .requiresCodableMacro(macroName: macroName))])
            }
            return []
        } else {
            try verifyCaseMacroIsCompatibleWithDeclaration(declaration: declaration, name: macroName)
            return []
        }
    }
}

public struct CodingKeySuffix: PeerMacro {
    static let macroName: String = "CodingKeySuffix"
    public static func expansion(of node: AttributeSyntax, providingPeersOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            guard structDecl.hasCodableAttribute else {
                throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .requiresCodableMacro(macroName: macroName))])
            }
            return []
        } else {
            try verifyCaseMacroIsCompatibleWithDeclaration(declaration: declaration, name: macroName)
            return []
        }
    }
}

/// Interface for a basic decorating CodingKey macro
/// Used to unify identical definitions
protocol DecoratingCodingKeyAttribute: PeerMacro, MacroNameable {
    /// The kind of CodingKey for this macro
    static var attributeType: CodingKeyAttribute { get }
}

extension DecoratingCodingKeyAttribute {
    static var macroName: String { attributeType.rawValue }

    public static func expansion(of node: AttributeSyntax, providingPeersOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        
        if let structDecl = declaration.as(StructDeclSyntax.self) {
            guard structDecl.hasCodableAttribute else {
                throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .requiresCodableMacro(macroName: macroName))])
            }
            return []
        } else {
            try verifyCaseMacroIsCompatibleWithDeclaration(declaration: declaration, name: "@\(attributeType.rawValue)")
            return []
        }
    }
}

func verifyCaseMacroIsCompatibleWithDeclaration(declaration: some DeclSyntaxProtocol, name: String) throws {
    if declaration.as(VariableDeclSyntax.self) == nil && declaration.as(StructDeclSyntax.self) == nil {
        throw DiagnosticsError(diagnostics: [.init(node: declaration, syntaxError: .canOnlyBeAttachedToPropertiesAndStructs(name: name))])
    }
}

public struct CamelCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .camelCase }
}

public struct FlatCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .flatCase }
}

public struct PascalCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .pascalCase }
}

public struct UpperCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .upperCase }
}

public struct SnakeCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .snakeCase }
}

public struct CamelSnakeCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .camelSnakeCase }
}

public struct PascalSnakeCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .pascalSnakeCase }
}

public struct ScreamingSnakeCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .screamingSnakeCase }
}

public struct KebabCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .kebabCase }
}

public struct CamelKebabCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .camelKebabCase }
}

public struct PascalKebabCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .pascalKebabCase }
}

public struct ScreamingKebabCase: DecoratingCodingKeyAttribute {
    static var attributeType: CodingKeyAttribute { .screamingKebabCase }
}

enum CodingKeyAttribute: String, CaseIterable {
    /// casedLikeThis
    case camelCase = "CamelCase"
    /// casedlikethis
    case flatCase = "FlatCase"
    /// CasedLikeThis
    case pascalCase = "PascalCase"
    /// CASEDLIKETHIS
    case upperCase = "UpperCase"
    /// cased_like_this
    case snakeCase = "SnakeCase"
    /// cased_Like_This
    case camelSnakeCase = "CamelSnakeCase"
    /// cased_Like_This
    case pascalSnakeCase = "PascalSnakeCase"
    /// CASED_LIKE_THIS
    case screamingSnakeCase = "ScreamingSnakeCase"
    /// cased-like-this
    case kebabCase = "KebabCase"
    /// cased-Like-This
    case camelKebabCase = "CamelKebabCase"
    /// Cased-Like-This
    case pascalKebabCase = "PascalKebabCase"
    /// CASED-LIKE-THIS
    case screamingKebabCase = "ScreamingKebabCase"

    var codingKeyCase: CodingKeyCase {
        switch self {
        case .camelCase: .camelCase
        case .flatCase: .flatCase
        case .pascalCase: .pascalCase
        case .upperCase: .upperCase
        case .snakeCase: .snakeCase
        case .camelSnakeCase: .camelSnakeCase
        case .pascalSnakeCase: .pascalSnakeCase
        case .screamingSnakeCase: .screamingSnakeCase
        case .kebabCase: .kebabCase
        case .camelKebabCase: .camelKebabCase
        case .pascalKebabCase: .pascalKebabCase
        case .screamingKebabCase: .screamingKebabCase
        }
    }
}
