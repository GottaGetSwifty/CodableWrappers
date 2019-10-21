//
//  CustomFloatingPointEncoderTests.swift
//  
//
//  Created by Paul Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

class CustomFloatingPointEncoderTests: QuickSpec, EncodingTestSpec {

    override func spec() {
        describe("CustomFloatingPointEncoding") {
            //MARK: - JSONEncoder
            context("JSONEncoder") {
                //MARK: CustomFloat
                it("CustomFloat") {
                    expect {_ = try self.jsonEncoder.encode(floatTestModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(floatTestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())
                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: floatTestJSON))
                    }
                }
                //MARK: CustomDouble
                it("CustomDouble") {
                    expect {_ = try self.jsonEncoder.encode(floatTestModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(floatTestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: floatTestJSON))
                    }
                }
            }
            //MARK: - PListEncoder
            context("PListEncoder") {
                //MARK: CustomFloat
                it("CustomFloat") {
                    expect {_ = try self.plistEncoder.encode(doubleTestModel)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(doubleTestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        print(actualString)
                        expect(actualString).to(haveEqualLines(to: doubleTestXML))
                    }
                }
                //MARK: CustomDouble
                it("CustomDouble") {
                    expect {_ = try self.plistEncoder.encode(doubleTestModel)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(doubleTestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: doubleTestXML))
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
    @NonConformingFloatCodingMutable<NonConformingValueProvider>
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

