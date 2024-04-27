//
// CodableWrapperMacros.swift
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

@main
struct MyMacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        CustomCodable.self,
        CustomCodingKey.self,
        CodingKeyPrefix.self,
        CodingKeySuffix.self,
        SnakeCase.self,
        CamelCase.self,
        FlatCase.self,
        PascalCase.self,
        UpperCase.self,
        SnakeCase.self,
        CamelSnakeCase.self,
        PascalSnakeCase.self,
        ScreamingSnakeCase.self,
        KebabCase.self,
        CamelKebabCase.self,
        PascalKebabCase.self,
        ScreamingKebabCase.self,
    ]
}

protocol MacroNameable {
    static var macroName: String { get }
}

public struct CustomCodable: MemberMacro, MacroNameable {
    static let macroName: String = "CustomCodable"

    public static func expansion(of node: AttributeSyntax,
                                 providingMembersOf declaration: some DeclGroupSyntax,
                                 in context: some MacroExpansionContext) throws -> [DeclSyntax] {
        guard declaration.as(StructDeclSyntax.self) != nil else {
            throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .canOnlyBeAttachedToStruct(name: "@\(macroName)"))])
        }
        return try CodingKeysGenerator(node: node, declaration: declaration, context: context).generate()
    }

    //TODO: Extension Macro for full Codable implementation
//    public static func expansion(of node: AttributeSyntax, attachedTo declaration: some DeclGroupSyntax, providingExtensionsOf type: some TypeSyntaxProtocol, conformingTo protocols: [TypeSyntax], in context: some MacroExpansionContext) throws -> [ExtensionDeclSyntax] {
//        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
//            throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .canOnlyBeAttachedToStruct(name: "@\(macroName)"))])
//        }
//        return try CodingKeysGenerator(node: node, declaration: structDecl, context: context).generate()
//    }
}
