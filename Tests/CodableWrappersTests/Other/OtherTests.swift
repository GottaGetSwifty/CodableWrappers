//
//  DataDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

public extension KeyedDecodingContainer {
    func decodeAnonymousIfPresent<T: Codable>( _ codable: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T? {
    if let decoded = try? decodeIfPresent(T.self, forKey: key) {
        return decoded
    }
        return nil
//    else if let anonymousObject = try? decodeIfPresent(__AnonymousObjC.self, forKey: key) {
//        // code to migrate metadata from the old type to the new one snipped
//    }
    }
}

class OtherTests: QuickSpec {

    override func spec() {
        describe("Decoder") {
            context("NoEncoder") {
                it("usesDefaultEncoder") {

                }
            }
        }
    }
}


