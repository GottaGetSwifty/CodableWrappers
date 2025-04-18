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
    let customSeparator: String?

    var codingKeyCase: CodingKeyCase {
        attributeType.codingKeyCase(customSeparator: customSeparator)
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
    let customSeparator: String?

    init(caseName: String, rawCaseValue: String, customSeparator: String?) {
        self.caseName = caseName
        self.rawCaseValue = rawCaseValue.replacingOccurrences(of: "\"", with: "")
        self.customSeparator = customSeparator
    }

    init(caseName: String, rawCaseValue: String, keyCase: CodingKeyCase) {
        self.init(caseName: caseName,
                  rawCaseValue: keyCase.makeKeyValue(from: rawCaseValue.replacingOccurrences(of: "\"", with: "")),
                  customSeparator: keyCase.separator)
    }

    var declaration: MemberBlockItemSyntax {
        .init(enumCaseName: caseName, enumRawValueString: rawCaseValue)
    }
}

enum CodingKeyCase {
    /// no changes
    case noChanges
    /// casedLikeThis
    case camelCase(separator: String = "")
    /// casedlikethis
    case flatCase(separator: String = "")
    /// CasedLikeThis
    case pascalCase(separator: String = "")
    /// CASEDLIKETHIS
    case upperCase(separator: String = "")

    /// cased_like_this
    static var snakeCase: Self { .flatCase(separator: "_") }
    /// cased_Like_This
    static var camelSnakeCase: Self { .camelCase(separator: "_") }
    /// cased_Like_This
    static var pascalSnakeCase: Self { .pascalCase(separator: "_") }
    /// CASED_LIKE_THIS
    static var screamingSnakeCase: Self { .upperCase(separator: "_") }
    /// cased-like-this
    static var kebabCase: Self { .flatCase(separator: "-") }
    /// cased-Like-This
    static var camelKebabCase: Self { .camelCase(separator: "-") }
    /// Cased-Like-This
    static var pascalKebabCase: Self { .pascalCase(separator: "-") }
    /// CASED-LIKE-THIS
    static var screamingKebabCase: Self { .upperCase(separator: "-") }
    /// custom casing
    case custom((String) -> (String))

    var separator: String? {
        switch self {
        case .noChanges:
            ""
        case .camelCase(let separator), .flatCase(let separator), .pascalCase(let separator), .upperCase(let separator):
            separator
        case .custom:
            nil
        }
    }

    var caseVariant: CaseVariant? {
        switch self {
        case .flatCase:
            .lowerCase
        case .camelCase:
            .camelCase
        case .pascalCase:
            .pascalCase
        case .upperCase:
            .upperCase
        case .custom(_), .noChanges:
            nil
        }
    }

    func makeKeyValue(from value: String) -> String {
        switch self {
        case .noChanges: return value
        case .custom(let converter): return converter(value)
        default:
            guard let keyConverter = KeyConverter(keyCase: self), let caseVariant else {
                return value
            }
            return keyConverter.convert(value: value, variant: caseVariant)
        }
    }
}

enum CaseVariant {
    case lowerCase
    case camelCase
    case pascalCase
    case upperCase
}

struct KeyConverter: Sendable {
    static let snakeCaseConverter = KeyConverter(separator: "_")
    static let kebabCaseConverter = KeyConverter(separator: "-")
    static let plainCaseConverter = KeyConverter(separator: "")
    let separator: String

    init(separator: String) {
        self.separator = separator
    }

    init?(keyCase: CodingKeyCase) {
        guard let separator = keyCase.separator else { return nil }
        self.init(separator: separator)
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
