//
//  EmptyDefaultsEncodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble
#if canImport(UIKit)
import UIKit
#endif

@available(iOS 14, macOS 11, tvOS 14.0, watchOS 7.0, macCatalyst 14.5, *)
class EmptyDefaultsEncodingTests: QuickSpec, EncodingTestSpec {

    override class func spec() {
        describe("DefaultEncoding") {
            // MARK: - JSONEncoder
            context("JSONEncoder") {
                // MARK: DefaultEncoder
                describe("DefaultEncoder") {

                    // MARK: WhenEmpty
                    describe("WhenEmpty") {
                        it("EncodesDefault") {
                            expect {_ = try self.jsonEncoder.encode(emptyEncodingTestModel)}.toNot(throwError())
                            let encodedData = try? self.jsonEncoder.encode(emptyEncodingTestModel)
                            let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                            expect(encodedData).toNot(beNil())
                            expect(encodedString).toNot(beNil())

                            if let actualString = encodedString {
                                expect(actualString).to(haveEqualLines(to: emptyTestingJSON))
                            }
                        }
                    }
                    describe("WhenHasValues") {
                        it("EncodesValues") {
                            expect {_ = try self.jsonEncoder.encode(testEncodingTestModel)}.toNot(throwError())
                            let encodedData = try? self.jsonEncoder.encode(testEncodingTestModel)
                            let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                            expect(encodedData).toNot(beNil())
                            expect(encodedString).toNot(beNil())

                            if let actualString = encodedString {
                                expect(actualString).to(haveEqualLines(to: valuesTestingJSON))
                            }
                        }
                    }
                    describe("BasicDefault") {
                        it("EncodesWhenEmpty") {
                            expect {_ = try self.jsonEncoder.encode(emptyBasicDefaultModel)}.toNot(throwError())
                            let encodedData = try? self.jsonEncoder.encode(emptyBasicDefaultModel)
                            let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                            expect(encodedData).toNot(beNil())
                            expect(encodedString).toNot(beNil())

                            if let actualString = encodedString {
                                expect(actualString).to(haveEqualLines(to: defaultBasicDefaultJSON))
                            }
                        }
                        it("EncodesWithValue") {
                            expect {_ = try self.jsonEncoder.encode(valueBasicDefaultModel)}.toNot(throwError())
                            let encodedData = try? self.jsonEncoder.encode(valueBasicDefaultModel)
                            let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                            expect(encodedData).toNot(beNil())
                            expect(encodedString).toNot(beNil())

                            if let actualString = encodedString {
                                expect(actualString).to(haveEqualLines(to: valueBasicDefaultJSON))
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Basic Optional


@available(iOS 14.0, *)
private struct DefaultEncodingModel: Codable, Equatable {
    @FallbackEncoding<BoolTrue>
    var boolTrue: Bool?
    @FallbackEncoding<BoolFalse>
    var boolFalse: Bool?
    @FallbackEncoding<EmptyString>
    var string: String?

    @FallbackEncoding<EmptyInt>
    var int: Int?
    @FallbackEncoding<EmptyInt16>
    var int16: Int16?
    @FallbackEncoding<EmptyInt32>
    var int32: Int32?
    @FallbackEncoding<EmptyInt64>
    var int64: Int64?
    @FallbackEncoding<EmptyInt8>
    var Int8: Int8?
    @FallbackEncoding<EmptyUInt>
    var uInt: UInt?
    @FallbackEncoding<EmptyUInt16>
    var uInt16: UInt16?
    @FallbackEncoding<EmptyUInt32>
    var uInt32: UInt32?
    @FallbackEncoding<EmptyUInt64>
    var uInt64: UInt64?
    @FallbackEncoding<EmptyUInt8>
    var uInt8: UInt8?

    #if canImport(UIKit)
    @FallbackEncoding<EmptyCGFloat>
    var cgFloat: CGFloat?
    #else
    @FallbackEncoding<EmptyFloat>
    var cgFloat: Float?
    #endif

    @FallbackEncoding<EmptyDouble>
    var double: Double?
    @FallbackEncoding<EmptyFloat>
    var float: Float?

    #if swift(>=5.4) && !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
    @available(iOS 14, macOS 11, tvOS 14.0, watchOS 7.0, macCatalyst 14.5, *)
    @FallbackEncoding<EmptyFloat16>
    var float16: Float16?
    #else
    @available(iOS 14, macOS 11, tvOS 14.0, watchOS 7.0, macCatalyst 14.5, *)
    @FallbackEncoding<EmptyFloat>
    var float16: Float?
    #endif

    @FallbackEncoding<EmptyArray>
    var array: [Int]?
    @FallbackEncoding<EmptyDictionary>
    var dictionary: [String:Int]?
    @FallbackEncoding<EmptySet>
    var set: Set<Int>?
}

@available(iOS 14.0, *)
private let emptyEncodingTestModel = DefaultEncodingModel(boolTrue: nil, boolFalse: nil, string: nil, int: nil, int16: nil, int32: nil, int64: nil, Int8: nil, uInt: nil, uInt16: nil, uInt32: nil, uInt64: nil, uInt8: nil, cgFloat: nil, double: nil, float: nil, float16: nil, array: nil, dictionary: nil, set: nil)
@available(iOS 14.0, *)
private let testEncodingTestModel = DefaultEncodingModel(boolTrue: false, boolFalse: true, string: "1", int: 1, int16: 1, int32: 1, int64: 1, Int8: 1, uInt: 1, uInt16: 1, uInt32: 1, uInt64: 1, uInt8: 1, cgFloat: 1, double: 1, float: 1, float16: 1, array: [1], dictionary: ["1":1], set: [1])
@available(iOS 14.0, *)
private let defaultsEncodingTestModel = DefaultEncodingModel(boolTrue: true, boolFalse: false, string: "", int: 0, int16: 0, int32: 0, int64: 0, Int8: 0, uInt: 0, uInt16: 0, uInt32: 0, uInt64: 0, uInt8: 0, cgFloat: 0, double: 0, float: 0, float16: 0, array: [], dictionary: [:], set: [])

private let valuesTestingJSON = """
{
    "Int8" : 1,
    "array" : [
    1
    ],
    "boolFalse" : true,
    "boolTrue" : false,
    "cgFloat" : 1,
    "dictionary" : {
    "1" : 1
    },
    "double" : 1,
    "float" : 1,
    "float16" : 1,
    "int" : 1,
    "int16" : 1,
    "int32" : 1,
    "int64" : 1,
    "set" : [
    1
    ],
    "string" : "1",
    "uInt" : 1,
    "uInt16" : 1,
    "uInt32" : 1,
    "uInt64" : 1,
    "uInt8" : 1
}
"""

private let emptyTestingJSON = """
{
    "Int8" : 0,
    "array" : [

    ],
    "boolFalse" : false,
    "boolTrue" : true,
    "cgFloat" : 0,
    "dictionary" : {

    },
    "double" : 0,
    "float" : 0,
    "float16" : 0,
    "int" : 0,
    "int16" : 0,
    "int32" : 0,
    "int64" : 0,
    "set" : [
    ],
    "string" : "",
    "uInt" : 0,
    "uInt16" : 0,
    "uInt32" : 0,
    "uInt64" : 0,
    "uInt8" : 0
}
"""

private struct BasicDefaultProvider: FallbackValueProvider {
    public static var defaultValue: String { "..." }
}

private struct BasicDefault: Codable, Equatable {
    @FallbackCoding<BasicDefaultProvider>
    var emptyValue: String?
}

private let emptyBasicDefaultModel = BasicDefault(emptyValue: nil)
private let valueBasicDefaultModel = BasicDefault(emptyValue: "A Value")
private let defaultBasicDefaultModel = BasicDefault(emptyValue: BasicDefaultProvider.defaultValue)

private let valueBasicDefaultJSON = """
{
  "emptyValue" : "A Value"
}
"""

private let defaultBasicDefaultJSON = """
{
  "emptyValue" : "..."
}
"""
