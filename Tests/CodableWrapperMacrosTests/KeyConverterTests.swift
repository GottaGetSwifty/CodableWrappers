//
// KeyCoverterTests.swift
//

import Foundation
import Quick
import Nimble

@testable import CodableWrapperMacros

final class KeyConverterTests: QuickSpec {
    override class func spec() {
        describe("KeyConverter") {
            describe("SnakeCase") {
                let converter = KeyConverter.snakeCaseConverter
                context("WithLowerCase") {
                    it("ConvertsCorrectly") {
                        expect("test_name_expectation").to(matchConversion(from: converter, with: .lowerCase))
                    }
                }
                context("WithUpperCase") {
                    it("ConvertsCorrectly") {
                        expect("TEST_NAME_EXPECTATION").to(matchConversion(from: converter, with: .upperCase))
                    }
                }
                context("WithCamelCase") {
                    it("ConvertsCorrectly") {
                        expect("test_Name_Expectation").to(matchConversion(from: converter, with: .camelCase))
                    }
                }
                context("WithPascalCase") {
                    it("ConvertsCorrectly") {
                        expect("Test_Name_Expectation").to(matchConversion(from: converter, with: .pascalCase))
                    }
                }
            }
            describe("KebabCase") {
                let converter = KeyConverter.kebabCaseConverter
                context("WithLowerCase") {
                    it("ConvertsCorrectly") {
                        expect("test-name-expectation").to(matchConversion(from: converter, with: .lowerCase))
                    }
                }
                context("WithUpperCase") {
                    it("ConvertsCorrectly") {
                        expect("TEST-NAME-EXPECTATION").to(matchConversion(from: converter, with: .upperCase))
                    }
                }
                context("WithCamelCase") {
                    it("ConvertsCorrectly") {
                        expect("test-Name-Expectation").to(matchConversion(from: converter, with: .camelCase))
                    }
                }
                context("WithPascalCase") {
                    it("ConvertsCorrectly") {
                        expect("Test-Name-Expectation").to(matchConversion(from: converter, with: .pascalCase))
                    }
                }
            }
            describe("PlainCaseConverter") {
                let converter = KeyConverter.plainCaseConverter
                context("WithLowerCase") {
                    it("ConvertsCorrectly") {
                        expect("testnameexpectation").to(matchConversion(from: converter, with: .lowerCase))
                    }
                }
                context("WithUpperCase") {
                    it("ConvertsCorrectly") {
                        expect("TESTNAMEEXPECTATION").to(matchConversion(from: converter, with: .upperCase))
                    }
                }
                context("WithCamelCase") {
                    it("ConvertsCorrectly") {
                        expect("testNameExpectation").to(matchConversion(from: converter, with: .camelCase))
                    }
                }
                context("WithPascalCase") {
                    it("ConvertsCorrectly") {
                        expect("TestNameExpectation").to(matchConversion(from: converter, with: .pascalCase))
                    }
                }
            }
        }
    }
}
