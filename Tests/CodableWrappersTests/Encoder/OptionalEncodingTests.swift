//
//  OptionalEncodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class OptionalEncodingTests: QuickSpec, EncodingTestSpec, DecodingTestSpec {

    override class func spec() {
        describe("OptionalEncoding") {
            // MARK: - JSONEncoder
            context("JSONEncoder") {
                // MARK: OptionalCoding
                describe("OptionalCoding") {
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
                    // MARK: SecondsSince1970
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
                describe("TransientCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonEncoder.encode(transientCodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(transientCodingEmptyTestInstance)
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
                        expect {_ = try self.jsonEncoder.encode(transientCodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(transientCodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: transientCodingEmptyTestWithDataJSON))
                        }
                    }
                }

                describe("OmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonEncoder.encode(omitCodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(omitCodingEmptyTestInstance)
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
                        expect {_ = try self.jsonEncoder.encode(omitCodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(omitCodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyJSON))
                        }
                    }
                }
                describe("OmitOnlyEncoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonEncoder.encode(omitEncodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(omitEncodingEmptyTestInstance)
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
                        expect {_ = try self.jsonEncoder.encode(omitEncodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(omitEncodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyJSON))
                        }
                    }
                    it("StillDecodes") {
                        expect {_ = try self.jsonDecoder.decode(OmitEncodingTestModel.self, from: transientCodingEmptyTestWithDataJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitEncodingTestModel.self, from: transientCodingEmptyTestWithDataJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitEncodingEmptyTestWithDataInstance
                        }
                    }
                }
            }
            // MARK: - PListEncoder
            context("PListEncoder") {
                // MARK: Base64
                describe("OmitCodingWhenNil") {
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
                describe("OmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.plistEncoder.encode(omitCodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(omitCodingEmptyTestInstance)
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
                        expect {_ = try self.plistEncoder.encode(omitCodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(omitCodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyPList))
                        }
                    }
                }
                describe("OmitOnlyEncoding") {
                    it("HasNoValue") {
                        expect {_ = try self.plistEncoder.encode(omitEncodingEmptyTestInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(omitEncodingEmptyTestInstance)
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
                        expect {_ = try self.plistEncoder.encode(omitEncodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(omitEncodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: Self.emptyPList))
                        }
                    }
                    it("StillDecodes") {
                        expect {_ = try self.plistDecoder.decode(OmitEncodingTestModel.self, from: transientCodingEmptyTestWithDataXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitEncodingTestModel.self, from: transientCodingEmptyTestWithDataXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitEncodingEmptyTestWithDataInstance
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Basic Optional


private struct EmptyModel: Codable, Equatable {
    @TransientCoding
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

// MARK: - Seconds Since 1970 Mock Data
private struct SecondsSince1970TestModel: Codable, Equatable {
    @OptionalCoding<SecondsSince1970DateCoding>
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

// MARK: - TransientCoding Mock Data

private struct TransientCodingTestModel: Codable, Equatable {
    @TransientCoding
    var value: String? = "Oh Hai!"
}
private let transientCodingEmptyTestInstance = TransientCodingTestModel(value: nil)
private let transientCodingEmptyTestWithDataInstance = TransientCodingTestModel(value: "hi")
private let transientCodingEmptyTestWithDataJSON = """
{
    "value" : "hi"
}
"""
private let transientCodingEmptyTestWithDataXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>hi</string>
</dict>
</plist>
"""


// MARK: - OmitCoding Mock Data

private struct OmitCodingTestModel: Codable, Equatable {
    @OmitCoding
    var value: String? = "Oh Hai!"
}
private let omitCodingEmptyTestInstance = OmitCodingTestModel(value: nil)
private let omitCodingEmptyTestWithDataInstance = OmitCodingTestModel(value: "hi")
private let omitCodingEmptyTestWithDataJSON = """
{
    "value" : "hi"
}
"""
private let omitCodingEmptyTestWithDataXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>hi</string>
</dict>
</plist>
"""

private let omitCodingEmptyTestWithNullJSON = """
{
    "value" : null
}
"""

private let omitCodingEmptyTestWithNullXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>value</key>
    <string>$null</string>
</dict>
</plist>
"""


// MARK: - OmitDecoding Mock Data

private struct OmitEncodingTestModel: Codable, Equatable {
    @OmitEncoding
    var value: String? = "Oh Hai!"
}
private let omitEncodingEmptyTestInstance = OmitEncodingTestModel(value: nil)
private let omitEncodingEmptyTestWithDataInstance = OmitEncodingTestModel(value: "hi")
