//
//  BoolEncodingTests.swift
//
//  Created by PJ Fechner on 12/08/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class BoolEncodingTests: QuickSpec, EncodingTestSpec {

    override class func spec() {
        describe("BoolEncoding") {
            // MARK: - JSONEncoder
            context("JSONEncoder") {
                // MARK: BoolAsInt
                describe("BoolAsInt") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.jsonEncoder.encode(boolTrueAsIntTestModel)}.toNot(throwError())
                        let encodedData = try? self.jsonEncoder.encode(boolTrueAsIntTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsIntTestJSON(intValue: 1)))
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.jsonEncoder.encode(boolFalseAsIntTestModel)}.toNot(throwError())
                        let encodedData = try? self.jsonEncoder.encode(boolFalseAsIntTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsIntTestJSON(intValue: 0)))
                        }
                    }
                }
                // MARK: BoolAsString
                describe("BoolAsString") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.jsonEncoder.encode(boolTrueAsStringTestModel)}.toNot(throwError())
                        let encodedData = try? self.jsonEncoder.encode(boolTrueAsStringTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsStringTestJSON(stringValue: "true")))
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.jsonEncoder.encode(boolFalseAsStringTestModel)}.toNot(throwError())
                        let encodedData = try? self.jsonEncoder.encode(boolFalseAsStringTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsStringTestJSON(stringValue: "false")))
                        }
                    }
                }
            }
            // MARK: - PListEncoder
            context("PListEncoder") {
                // MARK: BoolAsInt
                describe("BoolAsInt") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.plistEncoder.encode(boolTrueAsIntTestModel)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(boolTrueAsIntTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsIntTestXML(intValue: 1)))
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.plistEncoder.encode(boolFalseAsIntTestModel)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(boolFalseAsIntTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsIntTestXML(intValue: 0)))
                        }
                    }
                }
                // MARK: BoolAsString
                describe("BoolAsString") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.plistEncoder.encode(boolTrueAsStringTestModel)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(boolTrueAsStringTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsStringTestXML(stringValue: "true")))
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.plistEncoder.encode(boolFalseAsStringTestModel)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(boolFalseAsStringTestModel)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: boolAsStringTestXML(stringValue: "false")))
                        }
                    }
                }
            }
        }
    }
}

// MARK: - BoolAsInt Mock data

private let boolTrueAsIntTestModel = BoolAsIntTextModel(boolValue: true)
private let boolFalseAsIntTestModel = BoolAsIntTextModel(boolValue: false)
private struct BoolAsIntTextModel: Codable, Equatable {
    @BoolAsIntCoding
    var boolValue: Bool
}

private func boolAsIntTestJSON(intValue: Int) -> String { """
{
    "boolValue" : \(intValue)
}
"""
}

private func boolAsIntTestXML(intValue: Int) -> String { """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>boolValue</key>
    <integer>\(intValue)</integer>
</dict>
</plist>
"""
}

// MARK: - BoolAsString Mock data

private let boolTrueAsStringTestModel = BoolAsStringTextModel(boolValue: true)
private let boolFalseAsStringTestModel = BoolAsStringTextModel(boolValue: false)
private struct BoolAsStringTextModel: Codable, Equatable {
    @BoolAsStringEncoding
    var boolValue: Bool
}

private func boolAsStringTestJSON(stringValue: String) -> String { """
{
    "boolValue" : "\(stringValue)"
}
"""
}

private func boolAsStringTestXML(stringValue: String) -> String { """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>boolValue</key>
    <string>\(stringValue)</string>
</dict>
</plist>
"""
}
