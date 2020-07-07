//
//  BoolDecodingTests.swift
//
//  Created by PJ Fechner on 12/08/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class BoolDecodingTests: QuickSpec, DecodingTestSpec {

    override func spec() {
        describe("BoolDecoding") {
            //MARK: - JSONDecoder
            context("JSONDecoder") {
                //MARK: BoolAsInt
                describe("BoolAsInt") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.jsonDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestJSON(intValue: 1).data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestJSON(intValue: 1).data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolTrueAsIntTestModel
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.jsonDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestJSON(intValue: 0).data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestJSON(intValue: 0).data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolFalseAsIntTestModel
                        }
                    }
                }
                //MARK: BoolAsString
                describe("BoolAsString") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "true").data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "true").data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolTrueAsStringTestModel
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "false").data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "false").data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolFalseAsStringTestModel
                        }
                    }
                    context("UpperCase") {
                        it("HandlesTRUE") {
                            expect {_ = try self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "TRUE").data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "TRUE").data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == boolTrueAsStringTestModel
                            }
                        }
                        it("HandlesFALSE") {
                            expect {_ = try self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "FALSE").data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestJSON(stringValue: "FALSE").data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == boolFalseAsStringTestModel
                            }
                        }
                    }
                }
            }
            //MARK: - PListDecoder
            context("PListDecoder") {
                //MARK: BoolAsInt
                describe("BoolAsInt") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.plistDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestXML(intValue: 1).data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestXML(intValue: 1).data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolTrueAsIntTestModel
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.plistDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestXML(intValue: 0).data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(BoolAsIntTextModel.self, from: boolAsIntTestXML(intValue: 0).data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolFalseAsIntTestModel
                        }
                    }
                }
                //MARK: BoolAsString
                describe("BoolAsString") {
                    it("EvaluatesTrue") {
                        expect {_ = try self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "true").data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "true").data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolTrueAsStringTestModel
                        }
                    }
                    it("EvaluatesFalse") {
                        expect {_ = try self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "false").data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "false").data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == boolFalseAsStringTestModel
                        }
                    }
                    context("UpperCase") {
                        it("HandlesTRUE") {
                            expect {_ = try self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "TRUE").data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "TRUE").data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == boolTrueAsStringTestModel
                            }
                        }
                        it("HandlesFALSE") {
                            expect {_ = try self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "FALSE").data(using: .utf8)!)}.toNot(throwError())
                            let decodedModel = try? self.plistDecoder.decode(BoolAsStringTextModel.self, from: boolAsStringTestXML(stringValue: "FALSE").data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == boolFalseAsStringTestModel
                            }
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
    @BoolAsStringCoding
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
