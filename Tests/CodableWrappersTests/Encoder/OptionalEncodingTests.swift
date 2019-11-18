//
//  OptionalEncodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

class OptionalEncodingTests: QuickSpec, EncodingTestSpec {

    override func spec() {
        describe("OptionalEncoding") {
            //MARK: - JSONEncoder
            context("JSONEncoder") {
                //MARK: Base64
                describe("OmmitCodingWhenNil") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonEncoder.encode(emptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(emptyTestInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyJSON))
                        }
                        let encodedWithoutWrapper = try? self.jsonEncoder.encode(noWrapperTestInstance)
                        let encodedWithoutWrapperString = encodedWithoutWrapper.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedString) == encodedWithoutWrapperString
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonEncoder.encode(emptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(emptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: emptyTestWithDataJSON))
                        }
                    }
                }
                describe("OptionalStaticCoder") {
                    //MARK: SecondsSince1970
                    describe("SecondsSince1970DateOptionalCoding") {
                        it("HasNoValue") {
                            expect {_ = try self.jsonEncoder.encode(secondsSince1970TestEmptyInstance)}.toNot(throwError())
                            let encodedData = try? self.jsonEncoder.encode(secondsSince1970TestEmptyInstance)
                            let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                            expect(encodedData).toNot(beNil())
                            expect(encodedString).toNot(beNil())

                            if let actualString = encodedString {
                                expect(actualString).to(haveEqualLines(to: Self.emptyJSON))
                            }
                        }
                        it("HasAValue") {
                            expect {_ = try self.jsonEncoder.encode(secondsSince1970TestInstance)}.toNot(throwError())
                            let encodedData = try? self.jsonEncoder.encode(secondsSince1970TestInstance)
                            let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                            expect(encodedData).toNot(beNil())
                            expect(encodedString).toNot(beNil())

                            if let actualString = encodedString {
                                expect(actualString).to(haveEqualLines(to: secondsSince1970JSON))
                            }
                        }
                    }
                }
                describe("OmmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonEncoder.encode(ommitCodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(ommitCodingEmptyTestInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyJSON))
                        }
                        let encodedWithoutWrapper = try? self.jsonEncoder.encode(noWrapperTestInstance)
                        let encodedWithoutWrapperString = encodedWithoutWrapper.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedString) == encodedWithoutWrapperString
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonEncoder.encode(ommitCodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(ommitCodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: ommitCodingEmptyTestWithDataJSON))
                        }
                    }
                }
            }
            //MARK: - PListEncoder
            context("PListEncoder") {
                //MARK: Base64
                describe("OmmitCodingWhenNil") {
                    it("HasNoValue") {
                        expect {_ = try self.plistEncoder.encode(emptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(emptyTestInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyPList))
                        }
                        let encodedWithoutWrapper = try? self.plistEncoder.encode(noWrapperTestInstance)
                        let encodedWithoutWrapperString = encodedWithoutWrapper.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedString) == encodedWithoutWrapperString
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistEncoder.encode(emptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(emptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: emptyTestWithDataXML))
                        }
                    }
                }
                describe("OptionalStaticCoder") {
                    it("HasNoValue") {
                        expect {_ = try self.plistEncoder.encode(secondsSince1970TestEmptyInstance)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(secondsSince1970TestEmptyInstance)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyPList))
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistEncoder.encode(secondsSince1970TestInstance)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(secondsSince1970TestInstance)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: secondsSince1970XML))
                        }
                    }
                }
                describe("OmmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.plistEncoder.encode(ommitCodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(ommitCodingEmptyTestInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyPList))
                        }
                        let encodedWithoutWrapper = try? self.plistEncoder.encode(noWrapperTestInstance)
                        let encodedWithoutWrapperString = encodedWithoutWrapper.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedString) == encodedWithoutWrapperString
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistEncoder.encode(ommitCodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(ommitCodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: ommitCodingEmptyTestWithDataXML))
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Basic Optional


private struct EmptyModel: Codable, Equatable {
    @OmmitCodingWhenNil
    var value: String?
}
private let emptyTestInstance = EmptyModel(value: nil)
private let emptyTestWithDataInstance = EmptyModel(value: "hi")
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

// MARK: No Wrapper
private struct NoWrapperModel: Codable, Equatable {
    var value: String?
}
private let noWrapperTestInstance = NoWrapperModel(value: nil)

//MARK: - Seconds Since 1970 Mock Data
private struct SecondsSince1970TestModel: Codable, Equatable {
    @SecondsSince1970DateOptionalCoding
    var secondsSince1970Date: Date?
}
private let secondsSince1970TestEmptyInstance = SecondsSince1970TestModel(secondsSince1970Date: nil)
private let secondsSince1970TestInstance = SecondsSince1970TestModel(secondsSince1970Date: Date(timeIntervalSince1970: 590277534.0))
private let secondsSince1970JSON = """
{
    "secondsSince1970Date" : 590277534
}
"""
private let secondsSince1970XML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>secondsSince1970Date</key>
    <real>590277534</real>
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
