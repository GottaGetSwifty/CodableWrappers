//
// TypeMacroContainers.swift
//
// Type-ified containers for the info a declaration containers
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

struct CodableMacroStructContainer {
    let typeName: String
    let codableDefined: Bool
    let hasCodingKeys: Bool
    let codableAttributes: [CodingAttributeInfo]
    let codingKeyPrefix: String?
    let codingKeySuffix: String?

    init(declaration: DeclGroupSyntax) throws {
        self.typeName = declaration.structName!
        self.codableDefined = declaration.attributes.attribute(named: CustomCodable.macroName) != nil
        self.hasCodingKeys = declaration.hasEnum(named: "CodingKeys")
        self.codableAttributes = declaration.attributes.codingAttributes
        self.codingKeyPrefix = try declaration.parameterValue(for: CodingKeyPrefix.macroName)
        self.codingKeySuffix = try declaration.parameterValue(for: CodingKeySuffix.macroName)
    }

    func attributeNameCanGenerate(name: String?) -> Bool {
        name == CustomCodable.macroName
        // Future work for other attributres being able to generate
//        switch name {
//        case .none: false
//        case CustomCodable.macroName:
//            true
//        case CodingKeyPrefix.macroName:
//            !codableDefined
//        case CodingKeySuffix.macroName:
//            attributeNameCanGenerate(name: CodingKeyPrefix.macroName) && codingKeyPrefix == nil
//        default:
//            attributeNameCanGenerate(name: CodingKeySuffix.macroName)
//                && name == codableAttributes.first?.attributeType.rawValue
//        }
    }
}

struct CodableMacroPropertyContainer {
    let propertyName: String?
    let customCodingKey: String?
    let codableAttributes: [CodingAttributeInfo]
    let codingKeyPrefix: String?
    let codingKeySuffix: String?
    let isComputedProperty: Bool

    init(element: MemberBlockItemListSyntax.Element) throws {
        self.propertyName = element.propertyIdentifier
        self.customCodingKey = try element.parameterValue(for: CustomCodingKey.macroName)
        self.codableAttributes = element.codingAttributes
        self.codingKeyPrefix = try element.parameterValue(for: CodingKeyPrefix.macroName)
        self.codingKeySuffix = try element.parameterValue(for: CodingKeySuffix.macroName)
        self.isComputedProperty = element.isComputedProperty

        if customCodingKey == "" {
            throw DiagnosticsError(diagnostics: [.init(node: element, syntaxError: .codingKeyValueCannotBeEmpty)])
        }
    }

    var hasAnyAttributes: Bool {
        customCodingKey != nil 
            || !codableAttributes.isEmpty
            || codingKeyPrefix != nil 
            || codingKeySuffix != nil
    }
}

extension MemberBlockItemListSyntax.Element {
    var isComputedProperty: Bool {
        decl.as(VariableDeclSyntax.self)?.bindings.first?.accessorBlock != nil
    }
}

extension DeclGroupSyntax {
    var structName: String? {
        self.as(StructDeclSyntax.self)?.name.text
    }

    func parameterValue(for attributeName: String) throws -> String? {
        try attributes.attributeSyntax(named: attributeName)?.parameterValue()
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "\"", with: "")
    }
}

extension MemberBlockItemListSyntax.Element {
    func parameterValue(for attributeName: String) throws -> String? {
        try attributeSyntax(named: attributeName)?.parameterValue()
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "\"", with: "")
    }
}
