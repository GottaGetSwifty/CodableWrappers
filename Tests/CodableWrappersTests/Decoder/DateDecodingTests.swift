//
//  DataDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

@testable import CodableWrappers
import Foundation
import Quick
import Nimble

class DateDecodingTests: DecodingTestSpec {

    override func spec() {
        describe("DateDecoding") {
            //MARK: - JSONDecoder
            describe("JSONDecoder") {
                //MARK: SecondsSince1970
                it("SecondsSince1970") {
                    expect {_ = try self.jsonDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1790JSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1790JSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == secondsSince1790TestInstance
                    }
                }
                //MARK: SecondsSince1970
                it("MillisecondsSince1970") {
                    expect {_ = try self.jsonDecoder.decode(MillisecondsSince1970TestModel.self, from: millisecondsSince1790JSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(MillisecondsSince1970TestModel.self, from: millisecondsSince1790JSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == millisecondsSince1790TestInstance
                    }
                }
                //MARK: ISO8601
                if #available(OSX 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                    it("ISO8601") {
                        expect {_ = try self.jsonDecoder.decode(ISO8601TestModel.self, from: iso8601JSON.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.jsonDecoder.decode(ISO8601TestModel.self, from: iso8601JSON.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == iso8601TestInstance
                        }
                    }
                }
                //MARK: CustomFormatter
                it("CustomFormatter") {
                    expect {_ = try self.jsonDecoder.decode(CustomFormatterTestModel.self, from: customFormatterJSON.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.jsonDecoder.decode(CustomFormatterTestModel.self, from: customFormatterJSON.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == customFormatterTestInstance
                    }
                }
            }
            //MARK: - PListDecoder
            describe("PListDecoder") {
                //MARK: SecondsSince1970
                it("SecondsSince1970") {
                    expect {_ = try self.plistDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1790XML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(SecondsSince1970TestModel.self, from: secondsSince1790XML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == secondsSince1790TestInstance
                    }
                }
                //MARK: MillisecondsSince1970
                it("MillisecondsSince1970") {
                    expect {_ = try self.plistDecoder.decode(MillisecondsSince1970TestModel.self, from: millisecondsSince1790XML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(MillisecondsSince1970TestModel.self, from: millisecondsSince1790XML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == millisecondsSince1790TestInstance
                    }
                }
                //MARK: ISO8601
                if #available(OSX 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                    it("ISO8601") {
                        expect {_ = try self.plistDecoder.decode(ISO8601TestModel.self, from: iso8601XML.data(using: .utf8)!)}.toNot(throwError())
                        let decodedModel = try? self.plistDecoder.decode(ISO8601TestModel.self, from: iso8601XML.data(using: .utf8)!)
                        expect(decodedModel).toNot(beNil())
                        if let actualModel = decodedModel {
                            expect(actualModel) == iso8601TestInstance
                        }
                    }
                }
                //MARK: CustomFormatter
                it("CustomFormatter") {
                    expect {_ = try self.plistDecoder.decode(CustomFormatterTestModel.self, from: customFormatterXML.data(using: .utf8)!)}.toNot(throwError())
                    let decodedModel = try? self.plistDecoder.decode(CustomFormatterTestModel.self, from: customFormatterXML.data(using: .utf8)!)
                    expect(decodedModel).toNot(beNil())
                    if let actualModel = decodedModel {
                        expect(actualModel) == customFormatterTestInstance
                    }
                }
            }
        }
    }
}

//MARK: - Seconds Since 1970 Mock Data
private struct SecondsSince1970TestModel: Codable, Equatable {
    @CustomCoding<SecondsSince1970DateCoder>
    var secondsSince1970Date: Date
}
private let secondsSince1790TestInstance = SecondsSince1970TestModel(secondsSince1970Date: Date(timeIntervalSince1970: 590277534.0))
private let secondsSince1790JSON = """
{
    "secondsSince1970Date" : "590277534.0"
}
"""
private let secondsSince1790XML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>secondsSince1970Date</key>
    <string>590277534.0</string>
</dict>
</plist>
"""

//MARK: - Milliseconds Since 1970 Mock Data
private struct MillisecondsSince1970TestModel: Codable, Equatable {

    @MillisecondsSince1970DateCoding
    var millisecondsSince1970Date: Date
}

private let millisecondsSince1790TestInstance = MillisecondsSince1970TestModel(millisecondsSince1970Date: Date(timeIntervalSince1970: 590277534.123))
private let millisecondsSince1790JSON = """
{
    "millisecondsSince1970Date" : "590277534123.0"
}
"""
private let millisecondsSince1790XML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>millisecondsSince1970Date</key>
    <string>590277534123.0</string>
</dict>
</plist>
"""

//MARK: - ISO8601 Mock Data
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private struct ISO8601TestModel: Codable, Equatable {
    @CustomCoding<ISO8601DateCoder>
    var iso8601Date: Date
}
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private let iso8601TestInstance = ISO8601TestModel(iso8601Date: ISO8601DateFormatter().date(from: "2008-09-15T10:53:00Z")!)
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private let iso8601JSON = """
{
    "iso8601Date" : "2008-09-15T10:53:00Z"
}
"""
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private let iso8601XML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>iso8601Date</key>
    <string>2008-09-15T10:53:00Z</string>
</dict>
</plist>
"""

//MARK: - Custom Mock Data
private struct CustomFormatterTestModel: Codable, Equatable {
    @CustomCoding<TestCustomDateFormatter>
    var customFormatDate: Date
}
private let customFormatterTestInstance = CustomFormatterTestModel(customFormatDate: TestCustomDateFormatter.dateFormatter.date(from: "06:10:11 15:24:16")!)
private let customFormatterJSON = """
{
    "customFormatDate" : "06:10:11 15:24:16"
}
"""
private let customFormatterXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>customFormatDate</key>
    <string>06:10:11 15:24:16</string>
</dict>
</plist>
"""

//MARK: - Custom Formatter
private struct TestCustomDateFormatter: CustomDateFormatterCoder {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM:dd:yy H:mm:ss"
        return formatter
    }()
}
