//
// CodableMacros.swift
//

/// Add to a struct to enable custom CodingKeys required for other CodingKey Macros to function
@attached(member, names: named(CodingKeys))
public macro CCodable() = #externalMacro(module: "CodableWrapperMacros", type: "CCodable")

/// Use a custom String value for a Property's CodingKey
@attached(peer)
public macro CodingKey(_ name: StringLiteralType) = #externalMacro(module: "CodableWrapperMacros", type: "CodingKey")

/// Prefix the CodingKey with a custom value
@attached(peer)
public macro CodingKeyPrefix(_ name: StringLiteralType) = #externalMacro(module: "CodableWrapperMacros", type: "CodingKeyPrefix")

/// Add a custom Suffix to the CodingKey
@attached(peer)
public macro CodingKeySuffix(_ name: StringLiteralType) = #externalMacro(module: "CodableWrapperMacros", type: "CodingKeySuffix")

/// CodingKey value will be `camelCase`
@attached(peer)
public macro CamelCase() = #externalMacro(module: "CodableWrapperMacros", type: "CamelCase")

/// CodingKey value will be` flatcase`
@attached(peer)
public macro FlatCase() = #externalMacro(module: "CodableWrapperMacros", type: "FlatCase")

/// CodingKey value will be `PascalCase`
@attached(peer)
public macro PascalCase() = #externalMacro(module: "CodableWrapperMacros", type: "PascalCase")

/// CodingKey value will be `UPPERCASE`
@attached(peer)
public macro UpperCase() = #externalMacro(module: "CodableWrapperMacros", type: "UpperCase")

/// CodingKey value will be `snake_case`
@attached(peer)
public macro SnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "SnakeCase")

/// CodingKey value will be `camel_Snake_Case`
@attached(peer)
public macro CamelSnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "CamelSnakeCase")

/// CodingKey value will be `Pascal_Snake_Case`
@attached(peer)
public macro PascalSnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "PascalSnakeCase")

/// CodingKey value will be `SCREAMING_SNAKE_CASE`
@attached(peer)
public macro ScreamingSnakeCase() = #externalMacro(module: "CodableWrapperMacros", type: "ScreamingSnakeCase")

/// CodingKey value will be `kebab-case`
@attached(peer)
public macro KebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "KebabCase")

/// CodingKey value will be `camel-Kebab-Case`
@attached(peer)
public macro CamelKebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "CamelKebabCase")

/// CodingKey value will be `Pascal-Kebab-Case`
@attached(peer)
public macro PascalKebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "PascalKebabCase")

/// CodingKey value will be `SCREAMING-KEBAB-CASE`
@attached(peer)
public macro ScreamingKebabCase() = #externalMacro(module: "CodableWrapperMacros", type: "ScreamingKebabCase")

