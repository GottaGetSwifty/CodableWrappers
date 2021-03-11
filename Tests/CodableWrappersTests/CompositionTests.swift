//
//  File.swift
//  
//
//  Created by PJ Fechner on 10/21/19.
//

import CodableWrappers
import Foundation
import Quick
import Nimble

class PartialImplementationTests: QuickSpec, DecodingTestSpec, EncodingTestSpec {
    override func spec() {
        describe("Composition") {
            context("JSONEncoding") {
                it("WithBasicModel") {
                    expect {_ = try self.jsonEncoder.encode(basicModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(basicModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: basicJSON))
                    }
                }
                it("WithEmptyModel") {
                    expect {_ = try self.jsonEncoder.encode(emptyModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(emptyModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: missingOptionalJSON))
                    }
                }
            }
            context("PLISTEncoding") {
                it("WithBasicModel") {
                    expect {_ = try self.plistEncoder.encode(basicModel)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(basicModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: basicXML))
                    }
                }
                it("WithEmptyModel") {
                    expect {_ = try self.plistEncoder.encode(emptyModel)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(emptyModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: missingOptionalXML))
                    }
                }
            }
            context("JSONDecoding") {
                it("WithBasicModel") {
                    expect {_ = try self.jsonDecoder.decode(CompositionTestModel.self, from: basicJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(CompositionTestModel.self, from: basicJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == basicModel
                    }
                }
                it("WithEmptyModel") {
                    expect {_ = try self.jsonDecoder.decode(CompositionTestModel.self, from: missingOptionalJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(CompositionTestModel.self, from: missingOptionalJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == emptyModel
                    }
                }
            }
            context("PLISTDecoding") {
                it("WithBasicModel") {
                    expect {_ = try self.plistDecoder.decode(CompositionTestModel.self, from: basicXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(CompositionTestModel.self, from: basicXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == basicModel
                    }
                }
                it("WithEmptyModel") {
                    expect {_ = try self.plistDecoder.decode(CompositionTestModel.self, from: missingOptionalXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(CompositionTestModel.self, from: missingOptionalXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == emptyModel
                    }
                }
            }
        }
    }
}

private struct CompositionTestModel: Codable, Equatable {
    @SecondsSince1970DateCoding
    var mutableTime: Date

    @Immutable @SecondsSince1970DateCoding
    var immutableTime: Date

    @OptionalCoding<SecondsSince1970DateCoding>
    var optionalTime: Date?

    @Immutable @OptionalCoding<SecondsSince1970DateCoding>
    var optionalImmutableTime: Date?

    @Immutable
    var plainImmutable: String

    @Immutable
    var plainOptionalImmutable: String?

    @Immutable @FallbackDecoding<EmptyDouble>
    var duration: Double
}


private let basicModel = CompositionTestModel(mutableTime: Date(timeIntervalSince1970: 590277534.0),
                                              immutableTime: Date(timeIntervalSince1970: 590277534.0),
                                              optionalTime: Date(timeIntervalSince1970: 590277534.0),
                                              optionalImmutableTime: Date(timeIntervalSince1970: 590277534.0),
                                              plainImmutable: "Hi",
                                              plainOptionalImmutable: "There",
                                              duration: 1)
private let emptyModel = CompositionTestModel(mutableTime: Date(timeIntervalSince1970: 590277534.0),
                                              immutableTime: Date(timeIntervalSince1970: 590277534.0),
                                              optionalTime: nil,
                                              optionalImmutableTime: nil,
                                              plainImmutable: "",
                                              plainOptionalImmutable: nil,
                                              duration: 0)

private let basicJSON = """
{
    "immutableTime" : 590277534,
    "plainImmutable" : "Hi",
    "optionalImmutableTime" : 590277534,
    "duration" : 1,
    "mutableTime" : 590277534,
    "optionalTime" : 590277534,
    "plainOptionalImmutable" : "There"
}
"""

private let basicXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>duration</key>
    <real>1</real>
    <key>immutableTime</key>
    <real>590277534</real>
    <key>mutableTime</key>
    <real>590277534</real>
    <key>optionalImmutableTime</key>
    <real>590277534</real>
    <key>optionalTime</key>
    <real>590277534</real>
    <key>plainImmutable</key>
    <string>Hi</string>
    <key>plainOptionalImmutable</key>
    <string>There</string>
</dict>
</plist>
"""

private let missingOptionalJSON = """
{
    "plainImmutable" : "",
    "duration" : 0,
    "mutableTime" : 590277534,
    "immutableTime" : 590277534
}
"""

private let missingOptionalXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>duration</key>
    <real>0.0</real>
    <key>immutableTime</key>
    <real>590277534</real>
    <key>mutableTime</key>
    <real>590277534</real>
    <key>plainImmutable</key>
    <string></string>
</dict>
</plist>
"""
