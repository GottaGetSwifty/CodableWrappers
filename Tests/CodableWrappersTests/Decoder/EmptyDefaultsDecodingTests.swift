//
//  EmptyDefaultsDecodingTests.swift
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
@available(iOS 14.0, *)
class EmptyDefaultsDecodingTests: QuickSpec, DecodingTestSpec {
    override class func spec() {
        describe("DefaultDecoding") {
            // MARK: - JSONDecoder
            context("JSONDecoder") {
                // MARK: DefaultDecoder
                describe("DefaultDecoder") {
                    describe("WhenJSONEmpty") {
                        it("DecodesDefault") {
                            expect {_ = try self.jsonDecoder.decode(DefaultDecodingModel.self, from: EmptyDefaultsDecodingTests.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(DefaultDecodingModel.self, from: EmptyDefaultsDecodingTests.emptyJSON.data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == defaultsDecodingTestModel
                            }
                        }
                    }
                    describe("WhenHasValues") {
                        it("DecodesValues") {
                            expect {_ = try self.jsonDecoder.decode(DefaultDecodingModel.self, from: valuesTestingJSON.data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(DefaultDecodingModel.self, from: valuesTestingJSON.data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == testDecodingTestModel
                            }
                        }
                    }
                    describe("BasicDefault") {
                        it("DecodesWhenEmpty") {
                            expect {_ = try self.jsonDecoder.decode(BasicDefault.self, from: EmptyDefaultsDecodingTests.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(BasicDefault.self, from: EmptyDefaultsDecodingTests.emptyJSON.data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == defaultBasicDefaultModel
                            }
                        }
                        it("DecodesWithValue") {
                            expect {_ = try self.jsonDecoder.decode(BasicDefault.self, from: valueBasicDefaultJSON.data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(BasicDefault.self, from: valueBasicDefaultJSON.data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == valueBasicDefaultModel
                            }
                        }
                    }
                }
            }
        }
    }
}

@available(iOS 14.0, *)
private struct DefaultDecodingModel: Codable, Equatable {
    @FallbackDecoding<BoolFalse>
    var boolFalse: Bool
    @FallbackDecoding<BoolTrue>
    var boolTrue: Bool
    @FallbackDecoding<EmptyString>
    var string: String

    @FallbackDecoding<EmptyInt>
    var int: Int
    @FallbackDecoding<EmptyInt16>
    var int16: Int16
    @FallbackDecoding<EmptyInt32>
    var int32: Int32
    @FallbackDecoding<EmptyInt64>
    var int64: Int64
    @FallbackDecoding<EmptyInt8>
    var Int8: Int8
    @FallbackDecoding<EmptyUInt>
    var uInt: UInt
    @FallbackDecoding<EmptyUInt16>
    var uInt16: UInt16
    @FallbackDecoding<EmptyUInt32>
    var uInt32: UInt32
    @FallbackDecoding<EmptyUInt64>
    var uInt64: UInt64
    @FallbackDecoding<EmptyUInt8>
    var uInt8: UInt8

    #if canImport(UIKit)
    @FallbackDecoding<EmptyCGFloat>
    var cgFloat: CGFloat
    #else
    @FallbackDecoding<EmptyFloat>
    var cgFloat: Float
    #endif

    @FallbackDecoding<EmptyDouble>
    var double: Double
    @FallbackDecoding<EmptyFloat>
    var float: Float

    #if swift(>=5.4) && !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
    @available(iOS 14, macOS 11, tvOS 14.0, watchOS 7.0, macCatalyst 14.5, *)
    @FallbackDecoding<EmptyFloat16>
    var float16: Float16
    #else
    @available(iOS 14, macOS 11, tvOS 14.0, watchOS 7.0, macCatalyst 14.5, *)
    @FallbackDecoding<EmptyFloat>
    var float16: Float
    #endif

    @FallbackDecoding<EmptyArray>
    var array: [Int]
    @FallbackDecoding<EmptyDictionary>
    var dictionary: [String:Int]
    @FallbackDecoding<EmptySet>
    var set: Set<Int>
}

@available(iOS 14.0, *)
private let testDecodingTestModel = DefaultDecodingModel(boolFalse: true, boolTrue: false, string: "1", int: 1, int16: 1, int32: 1, int64: 1, Int8: 1, uInt: 1, uInt16: 1, uInt32: 1, uInt64: 1, uInt8: 1, cgFloat: 1, double: 1, float: 1, float16: 1, array: [1], dictionary: ["1":1], set: [1])
@available(iOS 14.0, *)
private let defaultsDecodingTestModel = DefaultDecodingModel(boolFalse: false, boolTrue: true, string: "", int: 0, int16: 0, int32: 0, int64: 0, Int8: 0, uInt: 0, uInt16: 0, uInt32: 0, uInt64: 0, uInt8: 0, cgFloat: 0.0, double: 0.0, float: 0.0, float16: 0.0, array: [], dictionary: [:], set: [])

private let valuesTestingJSON = """
{
    "uInt8" : 1,
    "int64" : 1,
    "int" : 1,
    "double" : 1,
    "float16" : 1,
    "int16" : 1,
    "string" : "1",
    "uInt" : 1,
    "uInt64" : 1,
    "uInt16" : 1,
    "float" : 1,
    "dictionary" : {
    "1" : 1
    },
    "cgFloat" : 1,
    "set" : [
    1
    ],
    "uInt32" : 1,
    "array" : [
    1
    ],
    "Int8" : 1,
    "boolFalse" : true,
    "boolTrue" : false,
    "int32" : 1
}
"""

private let emptyTestingJSON = """
{
    "uInt8" : 0,
    "int64" : 0,
    "int" : 0,
    "double" : 0,
    "float16" : 0,
    "int16" : 0,
    "string" : "",
    "uInt" : 0,
    "uInt64" : 0,
    "uInt16" : 0,
    "float" : 0,
    "dictionary" : {

    },
    "cgFloat" : 0,
    "set" : [

    ],
    "uInt32" : 0,
    "array" : [

    ],
    "Int8" : 0,
    "bool" : false,
    "int32" : 0
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
