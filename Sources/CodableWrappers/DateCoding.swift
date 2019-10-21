//
//  DateCoding.swift
//  
//
//  Created by Paul Fechner on 10/16/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

/// Uses millisecondsSince1970 for (de)serailization of `Date`
public struct MillisecondsSince1970DateCoder: StaticCoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {

        let stringValue = try String(from: decoder)
        guard let value = Double(stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Date.self) but could not convert \(stringValue) to Date"))
        }
        let valueDate = Date(timeIntervalSince1970: value / 1000)
        return valueDate
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try "\((value.timeIntervalSince1970 * 1000.0).rounded())".encode(to: encoder)
    }
}

/// Uses secondsSince1970 for (de)serailization of `Date`
public struct SecondsSince1970DateCoder: StaticCoder {
    //TODO: Maybe delete dis
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {

        let value = try Double(from: decoder)
//        guard let value = try Double(stringValue) else {
//            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
//                                                                           debugDescription: "Expected \(Date.self) but could not convert \(stringValue) to Date"))
//        }
        let valueDate = Date(timeIntervalSince1970: value)
        return valueDate
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try value.timeIntervalSince1970.encode(to: encoder)
    }
}

/// Uses `ISO8601DateFormatter` with `formatOptions` set to `.withInternetDateTime` for (de)serailization of `Date`
/// - Note: Implement a `StaticCoder` to use a custom formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateCoder: StaticCoder {

    private static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()

    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)
        guard let date = iso8601Formatter.date(from: stringValue) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected date string to be ISO8601-formatted."))
        }
        return date
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try iso8601Formatter.string(from: value).encode(to: encoder)
    }
}

//MARK: - Custom DateFormatter

/// A `StaticDecoder` that uses a DateFormatter for decoding
/// - Note: Implement to use a custom `DateFormatter` for deserialization in the `StaticDecoder` Property Wrapper
/// - Example: `@StaticDecoder<YourCustomDateFormatterDecoder>`
public protocol CustomDateFormatterDecoder: StaticDecoder {
    static var dateFormatter: DateFormatter { get }
}
/// A `StaticEncoder` that uses a DateFormatter for decoding
/// - Note: Implement to use a custom `DateFormatter` for serialization in the `StaticEncoder` Property Wrapper
/// - Example: `@StaticEncoder<YourCustomDateFormatterEncoder>`
public protocol CustomDateFormatterEncoder: StaticEncoder {
    static var dateFormatter: DateFormatter { get }
}

/// Combination of `CustomDateFormatterEncoder` & `CustomDateFormatterDecoder`
/// - Note: Implement to use a custom `DateFormatter` for (de)serialization in the `StaticCoder` Property Wrapper
/// - Example: `@StaticCoder<YourCustomDateFormatterCoder>`
public typealias CustomDateFormatterCoder = StaticCoder & CustomDateFormatterEncoder & CustomDateFormatterDecoder

extension CustomDateFormatterDecoder {
    /// Uses `dateFormatter` for decoding
    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        guard let value = dateFormatter.date(from: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }
}

extension CustomDateFormatterEncoder {
/// Uses `dateFormatter` for encoding
    public static func encode(value: Date, to encoder: Encoder) throws {
        try dateFormatter.string(from: value).encode(to: encoder)
    }
}

