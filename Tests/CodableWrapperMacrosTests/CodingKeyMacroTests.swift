//
// CodingKeyMacroTests.swift
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(CodableWrapperMacros)
// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
@testable import CodableWrapperMacros

final class CodingKeyMacroTests: XCTestCase {
    func testCustomCodingWorks() throws {
        assertMacroExpansion(
            """
            @CustomCodable()
            struct TestCodable: Codable {
                @CustomCodingKey("NewKey")
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "NewKey"
                }
            }
            """,
            macros: testMacros)
    }

    func testMultipleMacrosOnSameProperty() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase @CamelCase @UpperCase
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "original_key"
                }
            }
            """,
            diagnostics: [.init(warning: .multipleCodingKeyAttributes, line: 3, column: 5)],
            macros: testMacros)
    }

    func testMultipleMacrosWithCodingKey() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase @CamelCase @UpperCase @CustomCodingKey("TESTKEY")
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "TESTKEY"
                }
            }
            """,
            diagnostics: [.init(warning: .defaultingToCodingKey, line: 3, column: 5)],
            macros: testMacros)
    }

    func testComputedPropertiesAreIgnored() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase
                let originalKey: String
                var otherProperty: String { "hi" }
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                var otherProperty: String { "hi" }

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "original_key"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase
                let originalKey: String
                var otherProperty: String {
                    "hi"
                }
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                var otherProperty: String {
                    "hi"
                }

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "original_key"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase
                let originalKey: String
                var otherProperty: String {
                    get { "hi" }
                }
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                var otherProperty: String {
                    get { "hi" }
                }

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "original_key"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase
                let originalKey: String
                var otherProperty: String {
                    get {
                        "hi"
                    }
                    set { }
                }
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                var otherProperty: String {
                    get {
                        "hi"
                    }
                    set { }
                }

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "original_key"
                }
            }
            """,
            macros: testMacros)
    }

    func testComputedPropertiesWithAttributeShowWarning() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @SnakeCase
                let originalKey: String
                @SnakeCase
                var otherProperty: String { "hi" }
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                var otherProperty: String { "hi" }

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "original_key"
                }
            }
            """,
            diagnostics: [.init(warning: .cannotBeAttachedToComputedProperties, line: 5, column: 5)],
            macros: testMacros)
    }

    func testStructLevelSnakeCase() throws {
        assertMacroExpansion(
            """
            @CustomCodable @SnakeCase
            struct OtherThing: Codable {
                let oneThing: String
                @CustomCodingKey("testKey")
                let twoThing: TestThing
                @KebabCase
                private let threeThing: String
            }
            """,
            expandedSource: """
            struct OtherThing: Codable {
                let oneThing: String
                let twoThing: TestThing
                private let threeThing: String

                private enum CodingKeys: String, CodingKey {
                    case oneThing = "one_thing"
                    case twoThing = "testKey"
                    case threeThing = "three-thing"
                }
            }
            """,
            macros: testMacros)
    }

    func testPlainCaseMacroBaseTests() throws {
        try doCodingKeyBaseTests(expectedValue: .camelCase)
        try doCodingKeyBaseTests(expectedValue: .pascalCase)
        try doCodingKeyBaseTests(attributeName: "FlatCase",
                                 testName: "TEST_NAME_EXPECTATION",
                                 expectedValue: "testnameexpectation")
        try doCodingKeyBaseTests(attributeName: "UpperCase",
                                 testName: "test_name_expectation",
                                 expectedValue: "TESTNAMEEXPECTATION")
    }

    func testExtraMacroBaseCases() throws {
        try doCodingKeyBaseTests(expectedValue: .camelCaseWithLeadingUnderscore)
        try doCodingKeyBaseTests(expectedValue: .camelCaseWithTrailingUnderscore)
        try doCodingKeyBaseTests(expectedValue: .camelCaseWithLeadingAndTrailingUnderscore)
    }

    func testSnakeCaseMacroBaseTests() throws {
        try doCodingKeyBaseTests(expectedValue: .snakeCase)
        try doCodingKeyBaseTests(expectedValue: .camelSnakeCase)
        try doCodingKeyBaseTests(expectedValue: .pascalSnakeCase)
        try doCodingKeyBaseTests(expectedValue: .screamingSnakeCase)
    }

    func testKebabCaseMacroBaseTests() throws {
        try doCodingKeyBaseTests(expectedValue: .kebabCase)
        try doCodingKeyBaseTests(expectedValue: .camelKebabCase)
        try doCodingKeyBaseTests(expectedValue: .pascalKebabCase)
        try doCodingKeyBaseTests(expectedValue: .screamingKebabCase)
    }

    func doCodingKeyBaseTests(expectedValue: CodingKeyTestValues) throws {
        try CodingKeyTestValues.validPropertyNames.forEach { testValue in
            try doCodingKeyBaseTests(attributeName: expectedValue.codingKeyAttribute.rawValue,
                                     testName: testValue.rawValue,
                                     expectedValue: expectedValue.correctResult)
            try doCodingKeyStructTests(attributeName: expectedValue.codingKeyAttribute.rawValue,
                                     testName: testValue.rawValue,
                                     expectedValue: expectedValue.correctResult)
        }
    }

    func doCodingKeyBaseTests(attributeName: String, testName: String, expectedValue: String) throws {
        CodingKeyTestValues.validPropertyNames.forEach { testValue in
            assertMacroExpansion(
                    """
                    @CustomCodable
                    struct TestCodable: Codable {
                        @\(attributeName)
                        let \(testName): String
                    }
                    """,
                    expandedSource: """
                    struct TestCodable: Codable {
                        let \(testName): String

                        private enum CodingKeys: String, CodingKey {
                            case \(testName) = "\(expectedValue)"
                        }
                    }
                    """,
                    macros: testMacros)
        }
    }

    func doCodingKeyStructTests(attributeName: String, testName: String, expectedValue: String) throws {
        CodingKeyTestValues.validPropertyNames.forEach { testValue in
            assertMacroExpansion(
                    """
                    @CustomCodable @\(attributeName)
                    struct TestCodable: Codable {
                        let \(testName): String
                        @SnakeCase let otherName: String
                    }
                    """,
                    expandedSource: """
                    struct TestCodable: Codable {
                        let \(testName): String
                        let otherName: String

                        private enum CodingKeys: String, CodingKey {
                            case \(testName) = "\(expectedValue)"
                            case otherName = "other_name"
                        }
                    }
                    """,
                    macros: testMacros)
        }
    }
}

#endif
