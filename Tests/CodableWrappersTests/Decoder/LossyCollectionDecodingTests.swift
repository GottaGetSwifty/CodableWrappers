//
//  LossyCollectionDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class LossyCollectionDecodingTests: QuickSpec, DecodingTestSpec, EncodingTestSpec {

    override class func spec() {
        describe("LossyCollectionDecoding") {
            // MARK: - JSONDecoder
            context("JSONDecoder") {
                // MARK: LossyCollectionDecoding
                it("DecodesCorrectly") {
                    expect {_ = try self.jsonDecoder.decode(LossyCollectionModel.self, from: baseTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(LossyCollectionModel.self, from: baseTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == fullTestModel
                    }
                }
                // MARK: Custom
                it("DecodesWhenEmpty") {
                    expect {_ = try self.jsonDecoder.decode(LossyCollectionModel.self, from: emptyTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(LossyCollectionModel.self, from: emptyTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == emptyTestModel
                    }
                }
                it("FiltersAllNulls") {
                    expect {_ = try self.jsonDecoder.decode(LossyCollectionModel.self, from: allNullTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(LossyCollectionModel.self, from: allNullTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == emptyTestModel
                    }
                }
                it("FiltersPartialNulls") {
                    expect {_ = try self.jsonDecoder.decode(LossyCollectionModel.self, from: partialNullTestJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(LossyCollectionModel.self, from: partialNullTestJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == fullTestModel
                    }
                }
            }
            // MARK: - PListDecoder
            context("PListDecoder") {
                // MARK: LossyCollectionDecoding
                it("DecodesCorrectly") {
                    expect {_ = try self.plistDecoder.decode(LossyCollectionModel.self, from: baseTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(LossyCollectionModel.self, from: baseTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == fullTestModel
                    }
                }
                // MARK: Custom
                it("DecodesWhenEmpty") {
                    expect {_ = try self.plistDecoder.decode(LossyCollectionModel.self, from: emptyTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(LossyCollectionModel.self, from: emptyTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == emptyTestModel
                    }
                }
                it("FiltersAllNulls") {
                    expect {_ = try self.plistDecoder.decode(LossyCollectionModel.self, from: allNullTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(LossyCollectionModel.self, from: allNullTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == emptyTestModel
                    }
                }
                it("FiltersPartialNulls") {
                    expect {_ = try self.plistDecoder.decode(LossyCollectionModel.self, from: partialNullTestXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(LossyCollectionModel.self, from: partialNullTestXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == fullTestModel
                    }
                }
            }
        }
    }
}

// MARK: - LossyCollection Mock Data

private struct LossyCollectionModel: Codable, Equatable {
    @LossyArrayDecoding
    var array: [String]
    @LossyDictionaryDecoding
    var dictionary: [String:String]
    @LossySetDecoding
    var set: Set<String>
}

private let fullTestModel = LossyCollectionModel(array: ["first", "second"], dictionary: ["first":"first", "second":"second"], set: ["first", "second"])
private let emptyTestModel = LossyCollectionModel(array: [], dictionary: [:], set: [])


private let baseTestJSON = """
{
    "array" : ["first", "second"],
    "dictionary": {
        "first": "first",
        "second": "second"
    },
    "set" : ["first", "second"]
}
"""

private let baseTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>array</key>
    <array>
        <string>first</string>
        <string>second</string>
    </array>
    <key>dictionary</key>
    <dict>
        <key>first</key>
        <string>first</string>
        <key>second</key>
        <string>second</string>
    </dict>
    <key>set</key>
    <array>
        <string>second</string>
        <string>first</string>
    </array>
</dict>
</plist>
"""

private let emptyTestJSON = """
{
    "array" : [],
    "dictionary": {

    },
    "set" : []
}
"""

private let emptyTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>array</key>
    <array>
    </array>
    <key>dictionary</key>
    <dict>
    </dict>
    <key>set</key>
    <array>
    </array>
</dict>
</plist>
"""

private let allNullTestJSON = """
{
    "array" : [null, null],
    "dictionary": {
        "first": null,
        "second": null
    },
    "set" : [null, null]
}
"""

private let allNullTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>array</key>
    <array>
        <string>$null</string>
        <string>$null</string>
    </array>
    <key>dictionary</key>
    <dict>
        <key>first</key>
        <string>$null</string>
        <key>$null</key>
        <string>$null</string>
    </dict>
    <key>set</key>
    <array>
        <string>$null</string>
        <string>$null</string>
    </array>
</dict>
</plist>
"""

private let partialNullTestJSON = """
{
    "array" : [null, "first", null, "second", null],
    "dictionary": {
        "other": null,
        "first": "first",
        "otherother": null,
        "second": "second",
        "anotherOther": null
    },
    "set" : [null, "first", null, "second", null]
}
"""

private let partialNullTestXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>array</key>
    <array>
        <string>$null</string>
        <string>first</string>
        <string>$null</string>
        <string>second</string>
        <string>$null</string>
    </array>
    <key>dictionary</key>
    <dict>
        <key>other</key>
        <string>$null</string>
        <key>first</key>
        <string>first</string>
        <key>otherother</key>
        <string>$null</string>
        <key>second</key>
        <string>second</string>
        <key>$null</key>
        <string>$null</string>
    </dict>
    <key>set</key>
    <array>
        <string>$null</string>
        <string>first</string>
        <string>$null</string>
        <string>second</string>
        <string>$null</string>
    </array>
</dict>
</plist>
"""
