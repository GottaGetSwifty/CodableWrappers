//
// CodingKeyPrefixSuffixTests.swift
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
@testable import CodableWrapperMacros

final class CodingKeyPrefixSuffixTests: XCTestCase {
    func testBasicPrefix() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @CodingKeyPrefix("_")
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "_originalKey"
                    case otherKey = "otherKey"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            @CodingKeyPrefix("_")
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "_originalKey"
                    case otherKey = "_otherKey"
                }
            }
            """,
            macros: testMacros)
    }

    func testBasicSuffix() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @CodingKeySuffix("_")
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "originalKey_"
                    case otherKey = "otherKey"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            @CodingKeySuffix("_")
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "originalKey_"
                    case otherKey = "otherKey_"
                }
            }
            """,
            macros: testMacros)
    }

    func testBasicPrefixAndSuffixWorkTogether() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @CodingKeyPrefix("-")
                @CodingKeySuffix("_")
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "-originalKey_"
                    case otherKey = "otherKey"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            @CodingKeyPrefix("-")
            @CodingKeySuffix("_")
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "-originalKey_"
                    case otherKey = "-otherKey_"
                }
            }
            """,
            macros: testMacros)
    }

    func testBasicPrefixAndSuffixWorkWithOthers() throws {
        assertMacroExpansion(
            """
            @CustomCodable
            struct TestCodable: Codable {
                @CodingKeyPrefix("-")
                @CodingKeySuffix("_")
                @ScreamingSnakeCase
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "-ORIGINAL_KEY_"
                    case otherKey = "otherKey"
                }
            }
            """,
            macros: testMacros)

        assertMacroExpansion(
            """
            @CustomCodable
            @CodingKeyPrefix("-")
            @CodingKeySuffix("_")
            @ScreamingSnakeCase
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String
            }
            """,
            expandedSource: """
            struct TestCodable: Codable {
                let originalKey: String
                let otherKey: String

                private enum CodingKeys: String, CodingKey {
                    case originalKey = "-ORIGINAL_KEY_"
                    case otherKey = "-OTHER_KEY_"
                }
            }
            """,
            macros: testMacros)
    }
}

