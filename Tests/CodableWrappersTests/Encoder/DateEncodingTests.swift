//
//  DataEncodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class DateEncodingTests: QuickSpec, EncodingTestSpec {

    override class func spec() {
        describe("DateEncoding") {
            // MARK: - JSONEncoder
            describe("JSONEncoder") {
                // MARK: SecondsSince1970
                it("SecondsSince1970") {
                    expect {_ = try self.jsonEncoder.encode(secondsSince1970TestInstance)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(secondsSince1970TestInstance)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: secondsSince1970JSON))
                    }
                }
                // MARK: SecondsSince1970
                it("MillisecondsSince1970") {
                    expect {_ = try self.jsonEncoder.encode(millisecondsSince1970TestInstance)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(millisecondsSince1970TestInstance)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: millisecondsSince1970JSON))
                    }
                }
                // MARK: ISO8601
                if #available(OSX 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                    it("ISO8601") {
                        expect {_ = try self.jsonEncoder.encode(iso8601TestInstance)}.toNot(throwError())
                        let encodedData = try? self.jsonEncoder.encode(iso8601TestInstance)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: iso8601JSON))
                        }
                    }
                    // MARK: CustomISO8601Formatter
                    it("CustomISO8601Formatter") {
                        expect {_ = try self.jsonEncoder.encode(iso8601customFormatterTestInstance)}.toNot(throwError())
                        let encodedData = try? self.jsonEncoder.encode(iso8601customFormatterTestInstance)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: iso8601customFormatterJSON))
                        }
                    }
                }
                // MARK: CustomFormatter
                it("CustomFormatter") {
                    expect {_ = try self.jsonEncoder.encode(customFormatterTestInstance)}.toNot(throwError())
                    let encodedData = try? self.jsonEncoder.encode(customFormatterTestInstance)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: customFormatterJSON))
                    }
                }

            }
            // MARK: - PListEncoder
            describe("PListEncoder") {
                // MARK: SecondsSince1970
                it("SecondsSince1970") {
                    expect {_ = try self.plistEncoder.encode(secondsSince1970TestInstance)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(secondsSince1970TestInstance)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: secondsSince1970XML))
                    }
                }
                // MARK: MillisecondsSince1970
                it("MillisecondsSince1970") {
                    expect {_ = try self.plistEncoder.encode(millisecondsSince1970TestInstance)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(millisecondsSince1970TestInstance)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: millisecondsSince1970XML))
                    }
                }
                // MARK: ISO8601
                if #available(OSX 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *) {
                    it("ISO8601") {
                        expect {_ = try self.plistEncoder.encode(iso8601TestInstance)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(iso8601TestInstance)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: iso8601XML))
                        }
                    }
                    // MARK: CustomISO8601Formatter
                    it("CustomISO8601Formatter") {
                        expect {_ = try self.plistEncoder.encode(iso8601customFormatterTestInstance)}.toNot(throwError())
                        let encodedData = try? self.plistEncoder.encode(iso8601customFormatterTestInstance)
                        let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                        expect(encodedData).toNot(beNil())
                        expect(encodedString).toNot(beNil())

                        if let actualString = encodedString {
                            expect(actualString).to(haveEqualLines(to: iso8601customFormatterXML))
                        }
                    }
                }
                // MARK: CustomFormatter
                it("CustomFormatter") {
                    expect {_ = try self.plistEncoder.encode(customFormatterTestInstance)}.toNot(throwError())
                    let encodedData = try? self.plistEncoder.encode(customFormatterTestInstance)
                    let encodedString = encodedData.map { String(data: $0, encoding: .utf8)!}
                    expect(encodedData).toNot(beNil())
                    expect(encodedString).toNot(beNil())

                    if let actualString = encodedString {
                        expect(actualString).to(haveEqualLines(to: customFormatterXML))
                    }
                }
            }
        }
    }
}

// MARK: - Seconds Since 1970 Mock Data
private struct SecondsSince1970TestModel: Codable, Equatable {
    @CodingUses<SecondsSince1970DateStaticCoder>
    var secondsSince1970Date: Date
}
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

// MARK: - Milliseconds Since 1970 Mock Data
private struct MillisecondsSince1970TestModel: Codable, Equatable {
    @MillisecondsSince1970DateCoding
    var millisecondsSince1970Date: Date
}

private let millisecondsSince1970TestInstance = MillisecondsSince1970TestModel(millisecondsSince1970Date: Date(timeIntervalSince1970: 590277534.123))
private let millisecondsSince1970JSON = """
{
    "millisecondsSince1970Date" : 590277534123
}
"""
private let millisecondsSince1970XML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>millisecondsSince1970Date</key>
    <real>590277534123</real>
</dict>
</plist>
"""

// MARK: - ISO8601 Mock Data
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private struct ISO8601TestModel: Codable, Equatable {
    @CodingUses<ISO8601DateStaticCoder>
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

// MARK: - Custom Mock Data
private struct CustomFormatterTestModel: Codable, Equatable {
    @CodingUses<TestCustomDateFormatter>
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

// MARK: Custom Formatter
private struct TestCustomDateFormatter: DateFormatterStaticCoder {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM:dd:yy H:mm:ss"
        return formatter
    }()
}

// MARK: - Custom ISO8601 Mock Data

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private struct CustomISO8601FormatterTestModel: Codable, Equatable {
    @CodingUses<TestCustomISO8601DateFormatter>
    var customFormatDate: Date
}
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private let iso8601customFormatterTestInstance = CustomISO8601FormatterTestModel(customFormatDate: TestCustomISO8601DateFormatter.iso8601DateFormatter.date(from: "2011-06-10T20:24:16Z")!)
private let iso8601customFormatterJSON = """
{
    "customFormatDate" : "2011-06-10T20:24:16Z"
}
"""
private let iso8601customFormatterXML = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>customFormatDate</key>
    <string>2011-06-10T20:24:16Z</string>
</dict>
</plist>
"""

// MARK: - Custom ISO8601 Formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
private struct TestCustomISO8601DateFormatter: ISO8601DateFormatterStaticCoder {
    static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate]
        return formatter
    }()
}
