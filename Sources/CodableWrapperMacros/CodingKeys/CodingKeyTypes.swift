//
// CodingKeyTypes.swift
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

struct CodingAttributeInfo {
    let attributeType: CodingKeyAttribute

    var codingKeyCase: CodingKeyCase {
        attributeType.codingKeyCase
    }

    func asCodingKeyInfo(named name: String) throws -> CodingKeyInfo {
        switch attributeType {
        case .snakeCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .camelCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .flatCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .pascalCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .upperCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .camelSnakeCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .pascalSnakeCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .screamingSnakeCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .kebabCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .camelKebabCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .pascalKebabCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        case .screamingKebabCase: return .init(caseName: name, rawCaseValue: name, keyCase: codingKeyCase)
        }
    }
}

struct CodingKeyInfo {
    let caseName: String
    var rawCaseValue: String

    init(caseName: String, rawCaseValue: String) {
        self.caseName = caseName
        self.rawCaseValue = rawCaseValue.replacingOccurrences(of: "\"", with: "")
    }

    init(caseName: String, rawCaseValue: String, keyCase: CodingKeyCase) {
        self.init(caseName: caseName,
                  rawCaseValue: keyCase.makeKeyValue(from: rawCaseValue.replacingOccurrences(of: "\"", with: "")))
    }

    var declaration: MemberBlockItemSyntax {
        .init(enumCaseName: caseName, enumRawValueString: rawCaseValue)
    }
}

enum CodingKeyCase {
    /// no changes
    case noChanges
    /// casedLikeThis
    case camelCase
    /// casedlikethis
    case flatCase
    /// CasedLikeThis
    case pascalCase
    /// CASEDLIKETHIS
    case upperCase
    /// cased_like_this
    case snakeCase
    /// cased_Like_This
    case camelSnakeCase
    /// cased_Like_This
    case pascalSnakeCase
    /// CASED_LIKE_THIS
    case screamingSnakeCase
    /// cased-like-this
    case kebabCase
    /// cased-Like-This
    case camelKebabCase
    /// Cased-Like-This
    case pascalKebabCase
    /// CASED-LIKE-THIS
    case screamingKebabCase
    /// custom casing
    case custom((String) -> (String))

    var separator: String {
        switch self {
        case .noChanges, .camelCase, .flatCase, .pascalCase, .upperCase:
            ""
        case .snakeCase, .camelSnakeCase, .pascalSnakeCase, .screamingSnakeCase:
            "_"
        case .kebabCase, .camelKebabCase, .pascalKebabCase, .screamingKebabCase:
            "-"
        case .custom(_):
            ""
        }
    }

    func makeKeyValue(from value: String) -> String {
        switch self {
        case .noChanges: value
        case .camelCase: KeyConverter.plainCaseConverter.convert(value: value, variant: .camelCase)
        case .flatCase: KeyConverter.plainCaseConverter.convert(value: value, variant: .lowerCase)
        case .pascalCase: KeyConverter.plainCaseConverter.convert(value: value, variant: .pascalCase)
        case .upperCase: KeyConverter.plainCaseConverter.convert(value: value, variant: .upperCase)
        case .snakeCase: KeyConverter.snakeCaseConverter.convert(value: value, variant: .lowerCase)
        case .camelSnakeCase: KeyConverter.snakeCaseConverter.convert(value: value, variant: .camelCase)
        case .pascalSnakeCase: KeyConverter.snakeCaseConverter.convert(value: value, variant: .pascalCase)
        case .screamingSnakeCase: KeyConverter.snakeCaseConverter.convert(value: value, variant: .upperCase)
        case .kebabCase: KeyConverter.kebabCaseConverter.convert(value: value, variant: .lowerCase)
        case .camelKebabCase: KeyConverter.kebabCaseConverter.convert(value: value, variant: .camelCase)
        case .pascalKebabCase: KeyConverter.kebabCaseConverter.convert(value: value, variant: .pascalCase)
        case .screamingKebabCase: KeyConverter.kebabCaseConverter.convert(value: value, variant: .upperCase)
        case .custom(let converter): converter(value)
        }
    }
}

enum CaseVariant {
    case lowerCase
    case camelCase
    case pascalCase
    case upperCase
}

class KeyConverter {
    static let snakeCaseConverter = KeyConverter(separator: "_")
    static let kebabCaseConverter = KeyConverter(separator: "-")
    static let plainCaseConverter = KeyConverter(separator: "")
    let separator: String

    init(separator: String) {
        self.separator = separator
    }
    
    func convert(value: String, variant: CaseVariant) -> String {
        // Remove any special characters at the beginning/end
        let isAllCaps = value.isAllCaps
        let firstAlphanumericIndex = value.firstIndex(where: \.isAlphaNumeric) ?? value.startIndex
        let lastAlphanumericIndex = value.lastIndex(where: \.isAlphaNumeric) ?? value.endIndex
        let preparedString = value[firstAlphanumericIndex...lastAlphanumericIndex]

        var resultString = ""
        var i = 0
        while i < preparedString.count {
            let index = preparedString.index(preparedString.startIndex, offsetBy: i)
            let character = preparedString[index]
            var hasHaddedSeparator = false

            if i >= 1, (!character.isAlphaNumeric || (character.isUppercase && !isAllCaps)) {
                resultString += separator
                hasHaddedSeparator = true
            }

            guard let nextCharacter = {
                if character.isAlphaNumeric {
                    return character
                } else if index == preparedString.endIndex {
                    return nil
                } else {
                    i += 1
                    return preparedString[preparedString.index(after: index)]
                }
            }() else {
                continue
            }
            switch variant {
            case .lowerCase:
                resultString += String(nextCharacter).lowercased()
            case .upperCase:
                resultString += String(nextCharacter).uppercased()
            case .camelCase:
                resultString += hasHaddedSeparator ? String(nextCharacter).uppercased() :  String(nextCharacter).lowercased()
            case .pascalCase:
                resultString += hasHaddedSeparator || i == 0 ? String(nextCharacter).uppercased() :  String(nextCharacter).lowercased()
            }
            i += 1
        }
        return resultString
    }
}

private extension Character {
    var isAlphaNumeric: Bool {
        isLetter || isNumber
    }
}

private extension String {
    var isAllCaps: Bool {
        first { $0.isAlphaNumeric && $0.isLowercase } == nil
    }
}
