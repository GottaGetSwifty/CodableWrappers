//
// CodableMacros.swift
//

import CodableWrapperMacros
/// Add to a struct to enable custom CodingKeys
@attached(member, names: named(CodingKeys))
public macro CustomCodable() = #externalMacro(module: "CodableWrapperMacros", type: "CustomCodable")

/// Set a property's CodingKey with a custom value
@attached(peer)
public macro CustomCodingKey(_ name: StringLiteralType) = #externalMacro(module: "CodableWrapperMacros", type: "CustomCodingKey")

/// Add a Prefix a property's CodingKey or Type's CodingKeys with a custom value
@attached(peer)
public macro CodingKeyPrefix(_ name: StringLiteralType) = #externalMacro(module: "CodableWrapperMacros", type: "CodingKeyPrefix")

/// Add a Suffix a property's CodingKey or Type's CodingKeys with a custom value
@attached(peer)
public macro CodingKeySuffix(_ name: StringLiteralType) = #externalMacro(module: "CodableWrapperMacros", type: "CodingKeySuffix")

/// Make the CodingKey for a property or Type `camelCase`
@attached(peer)
public macro CamelCase() = #externalMacro(module: "CodableWrapperMacros", type: "CamelCase")

/// Make the CodingKey for a property or Type` flatcase`
@attached(peer)
public macro FlatCase() = #externalMacro(module: "CodableWrapperMacros", type: "FlatCase")

/// Make the CodingKey for a property or Type `PascalCase`
@attached(peer)
public macro PascalCase() = #externalMacro(module: "CodableWrapperMacros", type: "PascalCase")

/// Make the CodingKey for a property or Type `UPPERCASE`
@attached(peer)
public macro UpperCase() = #externalMacro(module: "CodableWrapperMacros", type: "UpperCase")

/// Make the CodingKey for a property or Type `snake_case`
@attached(peer)
public macro SnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "SnakeCase")

/// Make the CodingKey for a property or Type `camel_Snake_Case`
@attached(peer)
public macro CamelSnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "CamelSnakeCase")

/// Make the CodingKey for a property or Type `Pascal_Snake_Case`
@attached(peer)
public macro PascalSnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "PascalSnakeCase")

/// Make the CodingKey for a property or Type `SCREAMING_SNAKE_CASE`
@attached(peer)
public macro ScreamingSnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "ScreamingSnakeCase")

/// Make the CodingKey for a property or Type `kebab-case`
@attached(peer)
public macro KebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "KebabCase")

/// Make the CodingKey for a property or Type `camel-Kebab-Case`
@attached(peer)
public macro CamelKebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "CamelKebabCase")

/// Make the CodingKey for a property or Type `Pascal-Kebab-Case`
@attached(peer)
public macro PascalKebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "PascalKebabCase")

/// Make the CodingKey for a property or Type `SCREAMING-KEBAB-CASE`
@attached(peer)
public macro ScreamingKebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "ScreamingKebabCase")

