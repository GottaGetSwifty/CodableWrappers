//
//  File.swift
//  
//
//  Created by PJ Fechner on 2/28/24.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport

@testable import CodableWrapperMacros

let testMacros: [String: Macro.Type] = [
    CustomCodable.macroName: CustomCodable.self,
    CustomCodingKey.macroName: CustomCodingKey.self,
    CamelCase.macroName: CamelCase.self,
    FlatCase.macroName: FlatCase.self,
    PascalCase.macroName: PascalCase.self,
    UpperCase.macroName: UpperCase.self,
    SnakeCase.macroName: SnakeCase.self,
    CamelSnakeCase.macroName: CamelSnakeCase.self,
    PascalSnakeCase.macroName: PascalSnakeCase.self,
    ScreamingSnakeCase.macroName: ScreamingSnakeCase.self,
    KebabCase.macroName: KebabCase.self,
    CamelKebabCase.macroName: CamelKebabCase.self,
    PascalKebabCase.macroName: PascalKebabCase.self,
    ScreamingKebabCase.macroName: ScreamingKebabCase.self,
    CodingKeyPrefix.macroName: CodingKeyPrefix.self,
    CodingKeySuffix.macroName: CodingKeySuffix.self,
]
