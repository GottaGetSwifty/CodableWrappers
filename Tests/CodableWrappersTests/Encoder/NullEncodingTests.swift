//
//  BoolEncodingTests.swift
//
//  Created by PJ Fechner on 12/08/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class NullEncodingTests: QuickSpec, EncodingTestSpec {

    override func spec() {
        describe("NullEncodingTests") {
            //MARK: - JSONEncoder
            context("JSONEncoder") {
                //MARK: BoolAsInt
                it("EncodesValues") {
                    expect {_ = try self.jsonEncoder.encode(nullEncodingBasicModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(nullEncodingBasicModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: basicTestJSON))
                    }
                }
                it("EncodesNulls") {
                    expect {_ = try self.jsonEncoder.encode(nullEncodingEmptyModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(nullEncodingEmptyModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: nullsTestJSON))
                    }
                }
            }
            //MARK: - PListEncoder
        }
        describe("ImmutableNullEncodingTests") {
            context("JSONEncoder") {
                it("EncodesValues") {
                    expect {_ = try self.jsonEncoder.encode(immutableNullEncodingBasicModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(immutableNullEncodingBasicModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: basicTestJSON))
                    }
                }
                it("EncodesNulls") {
                    expect {_ = try self.jsonEncoder.encode(immutableNullEncodingEmptyModel)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(immutableNullEncodingEmptyModel)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: nullsTestJSON))
                    }
                }
            }
        }
    }
}

// MARK: - BoolAsInt Mock data

private struct NullEncodingModel: Codable, Equatable {

    @EncodeNulls
    var string: String?

    @EncodeNulls
    var int: Int?
}

private let nullEncodingBasicModel = NullEncodingModel(string: "hi", int: 1)
private let nullEncodingEmptyModel = NullEncodingModel(string: nil, int: nil)

private struct ImmutableNullEncodingModel: Codable, Equatable {

    @Immutable
    @EncodeNulls
    var string: String?

    @Immutable
    @EncodeNulls
    var int: Int?
}

private let immutableNullEncodingBasicModel = ImmutableNullEncodingModel(string: "hi", int: 1)
private let immutableNullEncodingEmptyModel = ImmutableNullEncodingModel(string: nil, int: nil)

private let basicTestJSON = """
{
    "string" : "hi",
    "int" : 1
}
"""


private let basicTextXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>string</key>
    <string>hi</string>
    <key>int</key>
    <integer>1</integer>
</dict>
</plist>
"""

private let nullsTestJSON = """
{
"string" : null,
"int" : null
}
"""


private let nullTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>string</key>
    <string>$null</string>
    <key>int</key>
    <integer>$null</integer>
</dict>
</plist>
"""
