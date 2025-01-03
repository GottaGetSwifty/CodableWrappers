//
// CodingKeyPredicate.swift
//

import Quick
import Nimble

#if canImport(CodableWrapperMacros)
@testable import CodableWrapperMacros

/// This predicate
public func matchConversion(from keyConverter: KeyConverter, with variant: CaseVariant) -> Matcher<String> {
    return Matcher { actualExpression throws -> MatcherResult in
        guard let expectedValue = try actualExpression.evaluate() else {
            return MatcherResult(status: .fail, message: ExpectationMessage.fail("Invalid Expression").appendedBeNilHint())
        }

        for value in CodingKeyTestValues.allCases {
            let convertedValue = keyConverter.convert(value: value.rawValue, variant: variant)
            if convertedValue != expectedValue {
                return MatcherResult(bool: false, message: .expectedTo("convert \(value.rawValue) to \(expectedValue) instead of \(convertedValue)"))
            }
        }

        return MatcherResult(
            bool: true,
            message: ExpectationMessage.expectedTo("Coding Matched")
        )
    }
}

enum CodingKeyTestValues: String, CaseIterable {
    /// casedLikeThis
    case camelCase = "testNameExpectation"
    /// CasedLikeThis
    case pascalCase = "TestNameExpectation"
    /// cased_like_this
    case snakeCase = "test_name_expectation"
    /// cased_Like_This
    case camelSnakeCase = "test_Name_Expectation"
    /// cased_Like_This
    case pascalSnakeCase = "Test_Name_Expectation"
    /// CASED_LIKE_THIS
    case screamingSnakeCase = "TEST_NAME_EXPECTATION"
    /// cased-like-this
    case kebabCase = "test-name-expectation"
    /// cased-Like-This
    case camelKebabCase = "test-Name-Expectation"
    /// Cased-Like-This
    case pascalKebabCase = "Test-Name-Expectation"
    /// CASED-LIKE-THIS
    case screamingKebabCase = "TEST-NAME-EXPECTATION"
    /// "_casedLikeThis"
    case camelCaseWithLeadingUnderscore = "_testNameExpectation"
    /// "casedLikeThis_"
    case camelCaseWithTrailingUnderscore = "testNameExpectation_"
    /// "_casedLikeThis_"
    case camelCaseWithLeadingAndTrailingUnderscore = "_testNameExpectation_"

    var codingKeyAttribute: CodingKeyAttribute {
        switch self {
        case .camelCase: .camelCase
        case .pascalCase: .pascalCase
        case .snakeCase: .snakeCase
        case .camelSnakeCase: .camelSnakeCase
        case .pascalSnakeCase: .pascalSnakeCase
        case .screamingSnakeCase: .screamingSnakeCase
        case .kebabCase: .kebabCase
        case .camelKebabCase: .camelKebabCase
        case .pascalKebabCase: .pascalKebabCase
        case .screamingKebabCase: .screamingKebabCase
        case .camelCaseWithLeadingUnderscore: .camelCase
        case .camelCaseWithTrailingUnderscore: .camelCase
        case .camelCaseWithLeadingAndTrailingUnderscore: .camelCase
        }
    }

    static var validPropertyNames: [CodingKeyTestValues] {
        [
            .camelCase,
            .pascalCase,
            .snakeCase,
            .camelSnakeCase,
            .pascalSnakeCase,
            .screamingSnakeCase,
            .camelCaseWithLeadingUnderscore,
            .camelCaseWithTrailingUnderscore,
            .camelCaseWithLeadingAndTrailingUnderscore,
        ]
    }

    var correctResult: String {
        switch self {
        case .camelCase: rawValue
        case .pascalCase: rawValue
        case .snakeCase: rawValue
        case .camelSnakeCase: rawValue
        case .pascalSnakeCase: rawValue
        case .screamingSnakeCase: rawValue
        case .kebabCase: rawValue
        case .camelKebabCase: rawValue
        case .pascalKebabCase: rawValue
        case .screamingKebabCase: rawValue
        case .camelCaseWithLeadingUnderscore: Self.camelCase.correctResult
        case .camelCaseWithTrailingUnderscore: Self.camelCase.correctResult
        case .camelCaseWithLeadingAndTrailingUnderscore: Self.camelCase.correctResult
        }
    }
}

#endif
