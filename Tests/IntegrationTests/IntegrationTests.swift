//
//  IntegrationTests.swift
//  
//
//  Created by PJ Fechner on 2/27/24.
//

import XCTest
import Foundation
import CodableWrappers

#if canImport(CodableWrapperMacros)
import CodableWrapperMacros

final class IntegrationTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
//
//@CustomCodable @SnakeCase
//struct User: Codable {
//    let firstName: String
//    let lastName: String
//
//    @SecondsSince1970DateCoding
//    var joinDate: Date
//}
#endif
