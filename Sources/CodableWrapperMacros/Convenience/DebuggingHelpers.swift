//
// DebuggingHelper.swift
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

#if DEBUG
enum DebugHelpers {
    static func findTypeOf(syntax: SyntaxProtocol) -> String {
        let syntaxTypes: [any SyntaxProtocol.Type] = [
            StructDeclSyntax.self,
            VariableDeclSyntax.self,
            ClassDeclSyntax.self,
            MemberTypeSyntax.self,
            MemberBlockSyntax.self,
            MemberBlockItemSyntax.self,
            MemberAccessExprSyntax.self,
            AttributeSyntax.self,
            AttributeListSyntax.self,
            AttributedTypeSyntax.self,
            ExposeAttributeArgumentsSyntax.self,
            EnumDeclSyntax.self,
            EnumCaseDeclSyntax.self,
            EnumCaseElementSyntax.self,
            EnumCaseParameterSyntax.self,
            EnumCaseElementListSyntax.self,
            EnumCaseParameterListSyntax.self,
            EnumCaseParameterClauseSyntax.self,
        ]
        return syntaxTypes.reduce("") {
            $0 + (syntax.as($1) != nil ? ", \($1)" : "")
        }
    }
}
#endif
