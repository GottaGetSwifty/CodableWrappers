//
// CodingKeysGenerator.swift
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

class CodingKeysGenerator {
    let node: AttributeSyntax
    let declaration: DeclGroupSyntax
    let context: MacroExpansionContext
    let structDef: CodableMacroStructContainer

    init(node: AttributeSyntax, declaration: DeclGroupSyntax, context: MacroExpansionContext) throws {
        self.node = node
        self.declaration = declaration
        self.context = context
        self.structDef = try CodableMacroStructContainer(declaration: declaration)
    }

    func generate(insideExtension: Bool = false) throws -> [DeclSyntax] {
        let attributeName = node.attributeName.as(IdentifierTypeSyntax.self)?.name.text

        guard structDef.attributeNameCanGenerate(name: attributeName) else {
            return []
        }

        guard !structDef.hasCodingKeys else {
            throw DiagnosticsError(diagnostics: [.init(node: node, syntaxError: .codingKeysExist)])
        }
        
        if structDef.codableAttributes.count > 1 {
            context.diagnose(.init(node: node, syntaxWarning: .multipleCodingKeyAttributes))
        }

        let cases = try declaration.memberBlock.members.compactMap { member -> CodingKeyInfo? in
            let property = try CodableMacroPropertyContainer(element: member)
            guard var codingKey = try makeCodingKeyInfo(from: property, syntax: member, in: structDef) else {
                return nil
            }
            if let prefix = property.codingKeyPrefix ?? structDef.codingKeyPrefix {
                codingKey.rawCaseValue = prefix + codingKey.rawCaseValue
            }
            if let suffix = property.codingKeySuffix ?? structDef.codingKeySuffix {
                codingKey.rawCaseValue = codingKey.rawCaseValue + suffix
            }
            return codingKey
        }

            return [
//                makeCodingKeysExtension(from: cases)
                .init(makeCodingKeysEnum(from: cases))
            ]
    }
    
    private func makeCodingKeyInfo(from property: CodableMacroPropertyContainer, syntax member: MemberBlockItemListSyntax.Element, in structDefinition: CodableMacroStructContainer) throws -> CodingKeyInfo? {

        guard let propertyName = property.propertyName else {
            return nil
        }

        guard !property.isComputedProperty else {
            if property.hasAnyAttributes {
                context.diagnose(.init(node: member, syntaxWarning: .cannotBeAttachedToComputedProperties))
            }
            return nil
        }

        if property.codableAttributes.count > 1 && property.customCodingKey == nil {
            context.diagnose(.init(node: member, syntaxWarning: .multipleCodingKeyAttributes))
        }
        if let codingKey = property.customCodingKey {
            if !property.codableAttributes.isEmpty {
                context.diagnose(.init(node: member, syntaxWarning: .defaultingToCodingKey))
            }
            return .init(caseName: propertyName, rawCaseValue: codingKey)
        }
        if let codingAttribute = property.codableAttributes.first {
            return try codingAttribute.asCodingKeyInfo(named: propertyName)
        } else if let topLevelCodingAttribute = structDefinition.codableAttributes.first {
            return try topLevelCodingAttribute.asCodingKeyInfo(named: propertyName)
        } else {
            return CodingKeyInfo(caseName: propertyName, rawCaseValue: propertyName, keyCase: .noChanges)
        }
    }

    func makeCodingKeysEnum(from keys: [CodingKeyInfo]) -> EnumDeclSyntax {
        .init(modifiers: .init([DeclModifierSyntax(name: .identifier("private"))]),
              name: .identifier("CodingKeys"),
              inheritanceClause: .init(typeNames: ["String", "CodingKey"]),
              memberBlock: .init(members: .init(keys.map(\.declaration)))
        )
    }

    func makeCodingKeysExtension(from keys: [CodingKeyInfo]) -> ExtensionDeclSyntax {
        .init(extendedType: IdentifierTypeSyntax(name: .identifier(structDef.typeName)),
              inheritanceClause: .init(typeNames: ["Codable"]),
              memberBlock: .init(members: .init([
            .init(decl: makeCodingKeysEnum(from: keys))
        ])))
    }
}
