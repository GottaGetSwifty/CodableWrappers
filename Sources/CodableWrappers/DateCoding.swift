//
//  DateCoding.swift
//  
//
//  Created by Paul Fechner on 10/16/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

//public struct MillisecondsSince1970DateCoder: StaticCoder {
//    private init() { }
//
//    public static func decode(from decoder: Decoder) throws -> Date { try MillisecondsSince1970DateDecoder.decode(from: decoder) }
//    public static func encode(value: Date, to encoder: Encoder) throws { try MillisecondsSince1970DateEncoder.encode(value: value, to: encoder) }
//}

/// Uses millisecondsSince1970 for (de)serailization of `Date`
typealias MillisecondsSince1970DateCoder = Coder<MillisecondsSince1970DateEncoder, MillisecondsSince1970DateDecoder>
/// Uses millisecondsSince1970 for deserailization of `Date`
public struct MillisecondsSince1970DateDecoder: StaticDecoder {
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
}

/// Uses millisecondsSince1970 for serailization of `Date`
public struct MillisecondsSince1970DateEncoder: StaticEncoder {
    private init() { }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try "\((value.timeIntervalSince1970 * 1000.0).rounded())".encode(to: encoder)
    }
}

typealias SecondsSince1970DateCoder = Coder<SecondsSince1970DateEncoder, SecondsSince1970DateDecoder>

/// Uses secondsSince1970 for (de)serailization of `Date`
//public struct SecondsSince1970DateCoder: StaticCoder {
//    private init() { }
//
//    public static func decode(from decoder: Decoder) throws -> Date { try SecondsSince1970DateDecoder.decode(from: decoder) }
//    public static func encode(value: Date, to encoder: Encoder) throws { try SecondsSince1970DateEncoder.encode(value: value, to: encoder) }
//}
/// Uses secondsSince1970 for deserailization of `Date`
public struct SecondsSince1970DateDecoder: StaticDecoder {
    //TODO: Maybe delete dis
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {

        let stringValue = try String(from: decoder)
        guard let value = Double(stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Date.self) but could not convert \(stringValue) to Date"))
        }
        let valueDate = Date(timeIntervalSince1970: value)
        return valueDate
    }
}
/// Uses secondsSince1970 for serailization of `Date`
public struct SecondsSince1970DateEncoder: StaticEncoder {
    private init() { }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try "\(value.timeIntervalSince1970)".encode(to: encoder)
    }
}

/// Uses `ISO8601DateFormatter` with `formatOptions` set to `.withInternetDateTime` for (de)serailization of `Date`
/// - Note: Implement a `StaticCoder` to use a custom formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateCoder = Coder<ISO8601DateEncoder, ISO8601DateDecoder>
//public struct ISO8601DateCoder: StaticCoder {
//
//    fileprivate static let iso8601Formatter: ISO8601DateFormatter = {
//        let formatter = ISO8601DateFormatter()
//        formatter.formatOptions = .withInternetDateTime
//        return formatter
//    }()
//    private init() { }
//
//    public static func decode(from decoder: Decoder) throws -> Date { try ISO8601DateDecoder.decode(from: decoder) }
//    public static func encode(value: Date, to encoder: Encoder) throws { try ISO8601DateEncoder.encode(value: value, to: encoder) }
//}
/// Uses `ISO8601DateFormatter` with `formatOptions` set to `.withInternetDateTime` for deserailization of `Date`
/// - Note: Implement a `StaticDecoder` to use a custom formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
fileprivate let iso8601Formatter: ISO8601DateFormatter = {
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = .withInternetDateTime
    return formatter
}()
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)
        guard let date = iso8601Formatter.date(from: stringValue) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected date string to be ISO8601-formatted."))
        }
        return date
    }
}
/// Uses `ISO8601DateFormatter` with `formatOptions` set to `.withInternetDateTime` for serilization of `Date`
/// - Note: Implement a `StaticEncder` to use a custom formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateEncoder: StaticEncoder {
    private init() { }

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

