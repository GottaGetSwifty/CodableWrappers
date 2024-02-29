//
// CodingKeyMacroErrorTests.swift
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
@testable import CodableWrapperMacros

final class CodingKeyMacroErrorTests: XCTestCase {
    func testMultipleMacrosWithCodingKey() throws {
        assertMacroExpansion(
            """
            @CCodable struct TestCodable: Codable {
                @CodingKey("testKey") @SnakeCase
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "testKey"
                }
            }
            """,
            diagnostics: [.init(warning: .defaultingToCodingKey, line: 2, column: 5)],
            macros: testMacros)

        assertMacroExpansion(
            """
            @CCodable struct TestCodable: Codable {
                @SnakeCase @CodingKey("testKey")
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "testKey"
                }
            }
            """,
            diagnostics: [.init(warning: .defaultingToCodingKey, line: 2, column: 5)],
            macros: testMacros)
    }

    func testMultipleCodingKeyMacrosThrowsWarning() throws {
        assertMacroExpansion(
            """
            @CCodable struct TestCodable: Codable {
                @SnakeCase @CamelCase @ScreamingSnakeCase
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
            diagnostics: [.init(warning: .multipleCodingKeyAttributes, line: 2, column: 5)],
            macros: testMacros)

        assertMacroExpansion(
            """
            @CCodable @SnakeCase @CamelCase @ScreamingSnakeCase
            struct TestCodable: Codable {
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
            diagnostics: [.init(warning: .multipleCodingKeyAttributes, line: 1, column: 1)],
            macros: testMacros)

            // making this work will need some refactoring
//        assertMacroExpansion(
//            """
//            @CCodable struct TestCodable: Codable {
//                @CodingKey("first") @CodingKey("second")
//                let originalKey: String
//            }
//            """,
//            expandedSource: """
//            struct TestCodable: Codable {
//                let originalKey: String
//
//                private enum CodingKeys: String, CodingKey {
//                    case originalKey = "first"
//                }
//            }
//            """,
//            diagnostics: [.init(warning: .multipleCodingKeyAttributes, line: 2, column: 5)],
//            macros: testMacros)
    }

    func testThrowsErrorWhenCodingKeyImplemented() throws {
        assertMacroExpansion(
            """
            @CCodable struct TestCodable: Codable {
                let originalKey: String

                enum CodingKeys: String, CodingKey {
                    case originalKey
                }
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String

                enum CodingKeys: String, CodingKey {
                    case originalKey
                }
            }
            """,
            diagnostics: [.init(error: .codingKeysExist, line: 1, column: 1)],
            macros: testMacros)
    }

    func testThrowsDueToNonStringLiteral() throws {
        assertMacroExpansion(
            """
            let customKey = "customKey"
            @CCodable struct TestCodable: Codable {
                @CodingKey(customKey)
                let originalKey: String
            }
            """,
            expandedSource: """
            let customKey = "customKey"
            struct TestCodable: Codable {
                let originalKey: String
            }
            """,
            diagnostics: [.init(error: .mustBeStringLiteral, line: 3, column: 5)],
            macros: testMacros)
    }

    func testThrowsDueToEmptyStringCodingKey() throws {
        assertMacroExpansion(
            """
            @CCodable struct TestCodable: Codable {
                @CodingKey("")
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
            }
            """,
            diagnostics: [.init(error: .codingKeyValueCannotBeEmpty, line: 2, column: 5)],
            macros: testMacros)
    }

    func testThrowsDueToNoeCodableMacro() throws {
        assertMacroExpansion(
            """
            @SnakeCase struct TestCodable: Codable {
                @CodingKey("")
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
            }
            """,
            diagnostics: [.init(error: .requiresCodableMacro(macroName: "SnakeCase"), line: 1, column: 1)],
            macros: testMacros)

        assertMacroExpansion(
            """
            @CodingKeyPrefix struct TestCodable: Codable {
                @CodingKey("")
                let originalKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
            }
            """,
            diagnostics: [.init(error: .requiresCodableMacro(macroName: "CodingKeyPrefix"), line: 1, column: 1)],
            macros: testMacros)
    }
}

