//
//  DataDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

class OptionalDecodingTests: QuickSpec, DecodingTestSpec {

    override func spec() {
        describe("OptionalDecoding") {
            //MARK: - JSONDecoder
            context("JSONDecoder") {
                //MARK: Base64
                describe("OmmitCodingWhenNil") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonDecoder.decode(EmptyModel.self, from: Self.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(EmptyModel.self, from: Self.emptyJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == emptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.jsonDecoder.decode(EmptyModel.self, from: emptyTestWithNullJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(EmptyModel.self, from: emptyTestWithNullJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == emptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonDecoder.decode(EmptyModel.self, from: emptyTestWithDataJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(EmptyModel.self, from: emptyTestWithDataJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == emptyTestWithDataInstance
                        }
                    }
                }
                describe("OmmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonDecoder.decode(OmmitCodingTestModel.self, from: Self.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmmitCodingTestModel.self, from: Self.emptyJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == ommitCodingEmptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.jsonDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithNullJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithNullJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == ommitCodingEmptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithDataJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithDataJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == ommitCodingEmptyTestWithDataInstance
                        }
                    }
                }
            }
            //MARK: - PListDecoder
            context("PListDecoder") {
                //MARK: Base64
                describe("OmmitCodingWhenNil") {
                    it("HasNoValue") {
                        expect {_ = try self.plistDecoder.decode(EmptyModel.self, from: Self.emptyPList.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(EmptyModel.self, from: Self.emptyPList.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == emptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.plistDecoder.decode(EmptyModel.self, from: emptyTestWithNullXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(EmptyModel.self, from: emptyTestWithNullXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == emptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistDecoder.decode(EmptyModel.self, from: emptyTestWithDataXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(EmptyModel.self, from: emptyTestWithDataXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == emptyTestWithDataInstance
                        }
                    }
                }
                describe("OmmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.plistDecoder.decode(OmmitCodingTestModel.self, from: Self.emptyPList.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmmitCodingTestModel.self, from: Self.emptyPList.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == ommitCodingEmptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.plistDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithNullXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithNullXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == ommitCodingEmptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithDataXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmmitCodingTestModel.self, from: ommitCodingEmptyTestWithDataXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == ommitCodingEmptyTestWithDataInstance
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Base64 Mock Data


private struct EmptyModel: Codable, Equatable {
    @OmmitCodingWhenNil
    var value: String?
}
private let emptyTestInstance = EmptyModel(value: nil)
private let emptyTestWithDataInstance = EmptyModel(value: "hi")

private let emptyTestWithNullJSON = """
{
    "value" : null
}
"""

private let emptyTestWithNullXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>$null</string>
</dict>
</plist>
"""

private let emptyTestWithDataJSON = """
{
    "value" : "hi"
}
"""

private let emptyTestWithDataXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>hi</string>
</dict>
</plist>
"""

//MARK: - OmmitCoding Mock Data

private struct OmmitCodingTestModel: Codable, Equatable {
    @OmmitCodingWhenNil
    var value: String?
}
private let ommitCodingEmptyTestInstance = OmmitCodingTestModel(value: nil)
private let ommitCodingEmptyTestWithDataInstance = OmmitCodingTestModel(value: "hi")
private let ommitCodingEmptyTestWithDataJSON = """
{
    "value" : "hi"
}
"""
private let ommitCodingEmptyTestWithDataXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>hi</string>
</dict>
</plist>
"""

private let ommitCodingEmptyTestWithNullJSON = """
{
    "value" : null
}
"""

private let ommitCodingEmptyTestWithNullXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>$null</string>
</dict>
</plist>
"""
