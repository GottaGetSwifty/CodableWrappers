//
//  DataEncodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

class DataEncodingTests: EncodingTestSpec {

    override func spec() {
        describe("DataEncoding") {
            //MARK: - JSONEncoder
            context("JSONEncoder") {
                //MARK: Base64
                it("Base64") {
                    expect {_ = try self.jsonEncoder.encode(base64TestModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(base64TestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())
                    
                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: base64TestJSON))
                    }
                }
                //MARK: Custom
                it("CustomEncoder") {
                    expect {_ = try self.jsonEncoder.encode(customDataTestModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(customDataTestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: customTestJSON))
                    }
                }
            }
            //MARK: - PListEncoder
            context("PListEncoder") {
                //MARK: Base64
                it("Base64") {
                    expect {_ = try self.plistEncoder.encode(base64TestModel)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(base64TestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: base64TestXML))
                    }
                }
                //MARK: Custom
                it("CustomEncoder") {
                    expect {_ = try self.plistEncoder.encode(customDataTestModel)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(customDataTestModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedData).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: customTestXML))
                    }
                }
            }
        }
    }
}

// MARK: - Base64 Mock Data

private let base64TestModel = TestBase64Model(base64Data: "Oh, Hi Mark!".data(using: .utf8)!)
private struct TestBase64Model: Codable, Equatable {
    @CustomCoding<Base64DataCoder>
    var base64Data: Data
}

private let base64TestJSON = """
{
    "base64Data" : "T2gsIEhpIE1hcmsh"
}
"""

private let base64TestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>base64Data</key>
    <string>T2gsIEhpIE1hcmsh</string>
</dict>
</plist>
"""

// MARK: - Custom Mock Data
private let customDataTestModel = TestCustomDataModel(customData: "Oh, Hi Mark!".data(using: .utf8)!)
private struct TestCustomDataModel: Codable, Equatable {
    @Base64Coding
    var customData: Data
}

private let customTestJSON = """
{
    "customData" : "T2gsIEhpIE1hcmsh"
}
"""

private let customTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>customData</key>
    <string>T2gsIEhpIE1hcmsh</string>
</dict>
</plist>
"""

//MARK: - Custom Coder
private struct CustomBase64Coder: StaticCoder {

    static func decode(from decoder: Decoder) throws -> Data {
        let stringValue = try String(from: decoder)

        guard let value = Data.init(base64Encoded: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }
    static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}

