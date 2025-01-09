//
//  DataDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class OptionalDecodingTests: QuickSpec, DecodingTestSpec, EncodingTestSpec {

    override class func spec() {
        describe("OptionalDecoding") {
            // MARK: - JSONDecoder
            context("JSONDecoder") {
                // MARK: OmitCodingWhenNil
                describe("TransientCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonDecoder.decode(TransientModel.self, from: Self.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(TransientModel.self, from: Self.emptyJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == transientTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.jsonDecoder.decode(TransientModel.self, from: emptyTestWithNullJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(TransientModel.self, from: emptyTestWithNullJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == transientTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonDecoder.decode(TransientModel.self, from: emptyTestWithDataJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(TransientModel.self, from: emptyTestWithDataJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == transientTestWithDataInstance
                        }
                    }
                }
                describe("OptionalStaticCoder") {
                    // MARK: SecondsSince1970
                    describe("SecondsSince1970DateOptionalCoding") {
                        it("HasNoValue") {
                            expect {_ = try self.jsonDecoder.decode(SecondsSince1970TestModel.self, from: emptyJSON.data(using: .utf8)!) }.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(SecondsSince1970TestModel.self, from: emptyJSON.data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == secondsSince1970TestEmptyInstance
                            }
                        }
                        it("HasAValue") {
                            expect {_ = try self.jsonDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1970JSON.data(using: .utf8)!) }.toNot(throwError())
                            let decodedModel = try? self.jsonDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1970JSON.data(using: .utf8)!)
                            expect(decodedModel).toNot(beNil())
                            if let actualModel = decodedModel {
                                expect(actualModel) == secondsSince1970TestInstance
                            }
                        }
                    }
                }
                describe("OmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonDecoder.decode(OmitCodingTestModel.self, from: Self.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitCodingTestModel.self, from: Self.emptyJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitCodingEmptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.jsonDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithNullJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithNullJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitCodingEmptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithDataJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithDataJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitCodingEmptyTestInstance
                        }
                    }
                }
                describe("OmitOnlyDecoding") {
                    it("HasNoValue") {
                        expect {_ = try self.jsonDecoder.decode(OmitDecodingTestModel.self, from: Self.emptyJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitDecodingTestModel.self, from: Self.emptyJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitDecodingEmptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.jsonDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithNullJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithNullJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitDecodingEmptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.jsonDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithDataJSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithDataJSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitDecodingEmptyTestInstance
                        }
                    }
                    it("StillEncodes") {
                        expect {_ = try self.jsonEncoder.encode(omitDecodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.jsonEncoder.encode(omitDecodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: omitCodingEmptyTestWithDataJSON))
                        }
                    }
                }
            }
            // MARK: - PListDecoder
            context("PListDecoder") {
                // MARK: OmitCodingWhenNil
                describe("OmitCodingWhenNil") {
                    it("HasNoValue") {
                        expect {_ = try self.plistDecoder.decode(TransientModel.self, from: Self.emptyPList.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(TransientModel.self, from: Self.emptyPList.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == transientTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.plistDecoder.decode(TransientModel.self, from: emptyTestWithNullXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(TransientModel.self, from: emptyTestWithNullXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == transientTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistDecoder.decode(TransientModel.self, from: emptyTestWithDataXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(TransientModel.self, from: emptyTestWithDataXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == transientTestWithDataInstance
                        }
                    }
                }
                describe("OptionalStaticCoder") {
                    it("HasNoValue") {
                        expect {_ = try self.plistDecoder.decode(SecondsSince1970TestModel.self, from: emptyPList.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(SecondsSince1970TestModel.self, from: emptyPList.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == secondsSince1970TestEmptyInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1970XML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1970XML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == secondsSince1970TestInstance
                        }
                    }
                }
                describe("OmitCoding") {
                    it("HasNoValue") {
                        expect {_ = try self.plistDecoder.decode(OmitCodingTestModel.self, from: Self.emptyPList.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitCodingTestModel.self, from: Self.emptyPList.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitCodingEmptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.plistDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithNullXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithNullXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitCodingEmptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithDataXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitCodingTestModel.self, from: omitCodingEmptyTestWithDataXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitCodingEmptyTestInstance
                        }
                    }
                }
                describe("OmitOnlyDecoding") {
                    it("HasNoValue") {
                        expect {_ = try self.plistDecoder.decode(OmitDecodingTestModel.self, from: Self.emptyPList.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitDecodingTestModel.self, from: Self.emptyPList.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitDecodingEmptyTestInstance
                        }
                    }
                    it("HasNullValue") {
                        expect {_ = try self.plistDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithNullXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithNullXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitDecodingEmptyTestInstance
                        }
                    }
                    it("HasAValue") {
                        expect {_ = try self.plistDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithDataXML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(OmitDecodingTestModel.self, from: omitCodingEmptyTestWithDataXML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == omitDecodingEmptyTestInstance
                        }
                    }
                    it("StillEncodes") {
                        expect {_ = try self.plistEncoder.encode(omitDecodingEmptyTestWithDataInstance)}.toNot(throwError())
                        let encodedOptional = try? self.plistEncoder.encode(omitDecodingEmptyTestWithDataInstance)
                        let encodedString = encodedOptional.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedOptional).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: omitCodingEmptyTestWithDataXML))
                        }
                    }
                }
            }
        }
    }
}

// MARK: - Base64 Mock Data


private struct TransientModel: Codable, Equatable {
    @TransientCoding
    var value: String?
    @TransientDecoding
    var otherValue: String?
}
private let transientTestInstance = TransientModel(value: nil, otherValue: nil)
private let transientTestWithDataInstance = TransientModel(value: "hi", otherValue: "There")

private let emptyTestWithNullJSON = """
{
    "otherValue" : null,
    "value" : null
}
"""

private let emptyTestWithNullXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>otherValue</key>
    <string>$null</string>
    <key>value</key>
    <string>$null</string>
</dict>
</plist>
"""

private let emptyTestWithDataJSON = """
{
    "otherValue" : "There",
    "value" : "hi"
}
"""

private let emptyTestWithDataXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>otherValue</key>
    <string>There</string>
    <key>value</key>
    <string>hi</string>
</dict>
</plist>
"""

// MARK: - Seconds Since 1970 Mock Data
private struct SecondsSince1970TestModel: Codable, Equatable {
    @OptionalCoding<SecondsSince1970DateCoding>
    var secondsSince1970Date: Date?

    @OptionalDecoding<SecondsSince1970DateCoding>
    var otherSecondsSince1970Date: Date?
}
private let secondsSince1970TestEmptyInstance = SecondsSince1970TestModel(secondsSince1970Date: nil, otherSecondsSince1970Date: nil)
private let secondsSince1970TestInstance = SecondsSince1970TestModel(secondsSince1970Date: Date(timeIntervalSince1970: 590277534.0), otherSecondsSince1970Date: Date(timeIntervalSince1970: 590277534.0))
private let secondsSince1970JSON = """
{
    "otherSecondsSince1970Date" : 590277534,
    "secondsSince1970Date" : 590277534
}
"""

private let secondsSince1970XML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>otherSecondsSince1970Date</key>
    <real>590277534.0</real>
    <key>secondsSince1970Date</key>
    <real>590277534.0</real>
</dict>
</plist>
"""

private let secondsSince1970XML2 = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>otherSecondsSince1970Date</key>
    <real>590277534</real>
    <key>secondsSince1970Date</key>
    <real>590277534</real>
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

// MARK: - OmitDecding Mock Data

private struct OmitDecodingTestModel: Codable, Equatable {
    @OmitDecoding
    var value: String? = "Oh Hai!"
}
private let omitDecodingEmptyTestInstance = OmitDecodingTestModel(value: nil)
private let omitDecodingEmptyTestWithDataInstance = OmitDecodingTestModel(value: "hi")
