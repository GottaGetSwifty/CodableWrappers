//
//  CustomFloatingPointDecoderTests.swift
//  
//
//  Created by Paul Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class CustomFloatingPointDecoderTests: QuickSpec, DecodingTestSpec {

    override func spec() {
        describe("CustomFloatingPointDecoding") {
            //MARK: - JSONDecoder
            context("JSONDecoder") {
                //MARK: CustomFloat
                it("CustomFloat") {
                    expect {_ = try self.jsonDecoder.decode(TestFloatModel.self, from: floatTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(TestFloatModel.self, from: floatTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel.infinity) == floatTestModel.infinity
                        expect(actualModel.nan.isNaN) == true
                        expect(actualModel.negativeInfinity) == floatTestModel.negativeInfinity
                        expect(actualModel.regular) == floatTestModel.regular

                    }
                }
                //MARK: CustomDouble
                it("CustomDouble") {
                    expect {_ = try self.jsonDecoder.decode(TestFloatModel.self, from: floatTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(TestFloatModel.self, from: floatTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel.infinity) == floatTestModel.infinity
                        expect(actualModel.nan.isNaN) == true
                        expect(actualModel.negativeInfinity) == floatTestModel.negativeInfinity
                        expect(actualModel.regular) == floatTestModel.regular
                    }
                }
            }
            //MARK: - PListDecoder
            context("PListDecoder") {
                //MARK: CustomFloat
                it("CustomFloat") {
                    expect {_ = try self.plistDecoder.decode(TestDoubleModel.self, from: floatTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(TestDoubleModel.self, from: floatTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel.infinity) == doubleTestModel.infinity
                        expect(actualModel.nan.isNaN) == true
                        expect(actualModel.negativeInfinity) == doubleTestModel.negativeInfinity
                        expect(actualModel.regular) == doubleTestModel.regular
                    }
                }
                //MARK: CustomDouble
                it("CustomDouble") {
                    expect {_ = try self.plistDecoder.decode(TestDoubleModel.self, from: doubleTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(TestDoubleModel.self, from: doubleTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel.infinity) == doubleTestModel.infinity
                        expect(actualModel.nan.isNaN) == true
                        expect(actualModel.negativeInfinity) == doubleTestModel.negativeInfinity
                        expect(actualModel.regular) == doubleTestModel.regular
                    }
                }
            }
        }
    }
}

// MARK: - Float Mock Data

private let floatTestModel = TestFloatModel(regular: 5, infinity: Float.infinity, negativeInfinity: -Float.infinity, nan: Float.nan)
private struct TestFloatModel: Codable, Equatable {
    @NonConformingFloatCoding<NonConformingValueProvider>
    var regular: Float
    @NonConformingFloatCoding<NonConformingValueProvider>
    var infinity: Float
    @NonConformingFloatCoding<NonConformingValueProvider>
    var negativeInfinity: Float
    @NonConformingFloatCoding<NonConformingValueProvider>
    var nan: Float
}

private let floatTestJSON = """
{
    "nan" : "-1",
    "infinity" : "100",
    "regular" : 5,
    "negativeInfinity" : "-100"
}
"""

private let floatTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>infinity</key>
    <string>100</string>
    <key>nan</key>
    <string>-1</string>
    <key>negativeInfinity</key>
    <string>-100</string>
    <key>regular</key>
    <real>5</real>
</dict>
</plist>
"""

// MARK: - Double Mock Data
private let doubleTestModel = TestDoubleModel(regular: 5, infinity: Double.infinity, negativeInfinity: -Double.infinity, nan: Double.nan)
private struct TestDoubleModel: Codable, Equatable {
    @NonConformingDoubleCoding<NonConformingValueProvider>
    var regular: Double
    @NonConformingDoubleCoding<NonConformingValueProvider>
    var infinity: Double
    @NonConformingDoubleCoding<NonConformingValueProvider>
    var negativeInfinity: Double
    @NonConformingDoubleCoding<NonConformingValueProvider>
    var nan: Double
}

private let doubleTestJSON = """
{
    "nan" : "-1,
    "infinity" : "100",
    "regular" : 5,
    "negativeInfinity" : "-100"
}
"""

private let doubleTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>infinity</key>
    <string>100</string>
    <key>nan</key>
    <string>-1</string>
    <key>negativeInfinity</key>
    <string>-100</string>
    <key>regular</key>
    <real>5</real>
</dict>
</plist>
"""

//MARK: - FloatValueProvider
private struct NonConformingValueProvider: NonConformingDecimalValueProvider {
    static var positiveInfinity: String = "100"
    static var negativeInfinity: String = "-100"
    static var nan: String = "-1"
}

