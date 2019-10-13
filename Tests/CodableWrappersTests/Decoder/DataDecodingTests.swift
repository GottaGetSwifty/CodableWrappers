//
//  DataDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

class DataDecodingTests: DecodingTestSpec {

    override func spec() {
        describe("DataDecoding") {
            //MARK: - JSONDecoder
            context("JSONDecoder") {
                //MARK: Base64
                it("Decodes_Base64") {
                    expect {_ = try self.jsonDecoder.decode(TestBase64Model.self, from: base64TestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(TestBase64Model.self, from: base64TestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == base64TestModel
                    }
                }
                //MARK: Custom
                it("Decodes_CustomDecoder") {
                    expect {_ = try self.jsonDecoder.decode(TestCustomDataModel.self, from: customTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(TestCustomDataModel.self, from: customTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == customDataTestModel
                    }
                }
            }
            //MARK: - PListDecoder
            context("PListDecoder") {
                //MARK: Base64
                it("Decodes_Base64") {
                    expect {_ = try self.plistDecoder.decode(TestBase64Model.self, from: base64TestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(TestBase64Model.self, from: base64TestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == base64TestModel
                    }
                }
                //MARK: Custom
                it("Decodes_CustomDecoder") {
                    expect {_ = try self.plistDecoder.decode(TestCustomDataModel.self, from: customTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(TestCustomDataModel.self, from: customTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == customDataTestModel
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
