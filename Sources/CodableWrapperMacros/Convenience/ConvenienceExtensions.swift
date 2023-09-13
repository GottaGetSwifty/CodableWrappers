//
// ConvenienceExtensions.swift
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

extension MemberBlockItemListSyntax.Element {
    var propertyIdentifier: String? {
        decl.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text
    }

    func attribute(named attributeName: String) -> AttributeListSyntax.Element? {
        decl.as(VariableDeclSyntax.self)?.attributes.attribute(named: attributeName)
    }

    var codingAttributes: [CodingAttributeInfo] {
        attributes(matching: CodingKeyAttribute.self).map(CodingAttributeInfo.init(attributeType:))
    }

    func attributes<T: RawRepresentable>(matching rawType: T.Type) -> [T] where T.RawValue == String {
        decl.as(VariableDeclSyntax.self)?.attributes.matching(matching: T.self) ?? []
    }

    func attributeSyntax<T: RawRepresentable>(matching rawType: T.Type) -> [(T, AttributeSyntax)] where T.RawValue == String {
        decl.as(VariableDeclSyntax.self)?.attributes.matchingSyntax(matching: T.self) ?? []
    }

    func attributeSyntax(named name: String) -> AttributeSyntax? {
        attribute(named: name)?.as(AttributeSyntax.self)
    }
}

extension AttributeListSyntax {

    var codingAttributes: [CodingAttributeInfo] {
        matching(matching: CodingKeyAttribute.self).map(CodingAttributeInfo.init(attributeType:))
    }

    func attribute(named attributeName: String) -> AttributeListSyntax.Element? {
        first { $0.identifierName?.trimmingCharacters(in: .whitespacesAndNewlines) == attributeName }
    }

    func attributeSyntax(named attributeName: String) -> AttributeSyntax? {
        attribute(named: attributeName)?.as(AttributeSyntax.self)
    }

    func matching<T: RawRepresentable>(matching rawType: T.Type) -> [T] where T.RawValue == String {
        compactMap {
            guard let attributeName = $0.identifierName?.trimmingCharacters(in: .whitespacesAndNewlines), let type = T(rawValue: attributeName) else {
                return nil
            }
            return type
        }
    }

    func matchingSyntax<T: RawRepresentable>(matching rawType: T.Type) -> [(T, AttributeSyntax)] where T.RawValue == String {
        compactMap {
            guard let attributeName = $0.identifierName?.trimmingCharacters(in: .whitespacesAndNewlines), let syntax = $0.as(AttributeSyntax.self), let type = T(rawValue: attributeName) else {
                return nil
            }
            return (type, syntax)
        }
    }
}
extension AttributeListSyntax.Element {
    var identifierName: String? {
        self.as(AttributeSyntax.self)?.attributeName.as(IdentifierTypeSyntax.self)?.description
    }
}

extension DeclGroupSyntax {
    func hasEnum(named name: String) -> Bool {
        memberBlock.members.first(where: { $0.decl.as(EnumDeclSyntax.self)?.name.text == name }) != nil
    }
}

extension AttributeSyntax {
    func parameterValue() throws -> String {
        guard let caseValue = try parameterValue(at: 0), !"\(caseValue.syntaxTextBytes)".isEmpty else {
            throw DiagnosticsError(diagnostics: [.init(node: self, syntaxError: .codingKeyValueRequired)])
        }
        return "\(caseValue)"
    }
}

extension EnumCaseElementSyntax {
    init(name: String, rawValueString: String) {
        self.init(name: .identifier(name),
                  rawValue: .init(value: StringLiteralExprSyntax(content: rawValueString)))
    }
}

extension MemberBlockItemSyntax {
    init(enumCaseName: String, enumRawValueString: String) {
        self.init(decl: EnumCaseDeclSyntax(elements: .init([
            EnumCaseElementSyntax(name: enumCaseName, rawValueString: enumRawValueString)
        ])))
    }
}

extension InheritanceClauseSyntax {
    init(typeNames: [String]) {
        self.init(inheritedTypes: .init(typeNames.enumerated().map {
            if $0.offset != (typeNames.count - 1) {
                InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier($0.element)), trailingComma: .commaToken())
            } else {
                InheritedTypeSyntax(type: IdentifierTypeSyntax(name: .identifier($0.element)))
            }
        }))
    }
}
extension StructDeclSyntax {
    var hasCodableAttribute: Bool {
        hasAttribute(named: Codable.macroName)
    }

    func hasAttribute(named name: String) -> Bool {
        attributes.contains { element in
            return element.identifierName?.trimmingCharacters(in: .whitespacesAndNewlines) == name
        }
    }

}
