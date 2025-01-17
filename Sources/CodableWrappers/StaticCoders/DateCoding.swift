//
//  DateCoding.swift
//  
//
//  Created by PJ Fechner on 10/16/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

/// Uses secondsSince1970 for (de)serailization of `Date`
public struct SecondsSince1970DateStaticCoder: StaticCoder {

    public static func decode(from decoder: Decoder) throws -> Date {

        let value = try TimeInterval(from: decoder)
        let valueDate = Date(timeIntervalSince1970: value)
        return valueDate
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try value.timeIntervalSince1970.encode(to: encoder)
    }
}

/// Uses millisecondsSince1970 for (de)serailization of `Date`
public struct MillisecondsSince1970DateStaticCoder: StaticCoder {

    public static func decode(from decoder: Decoder) throws -> Date {

        let value = try TimeInterval(from: decoder)
        let valueDate = Date(timeIntervalSince1970: value / 1000)
        return valueDate
    }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try (value.timeIntervalSince1970 * 1000).encode(to: encoder)
    }
}

// MARK: - Custom DateFormatter

/// A `StaticDecoder` that uses a DateFormatter for decoding
/// - Note: Implement to use a custom `DateFormatter` for deserialization in the `StaticDecoder` Property Wrapper
/// - Example: `@StaticDecoder<YourCustomDateFormatterDecoder>`
public protocol DateFormatterStaticDecoder: StaticDecoder {
    static var dateFormatter: DateFormatter { get }
}
/// A `StaticEncoder` that uses a DateFormatter for decoding
/// - Note: Implement to use a custom `DateFormatter` for serialization in the `StaticEncoder` Property Wrapper
/// - Example: `@StaticEncoder<YourCustomDateFormatterEncoder>`
public protocol DateFormatterStaticEncoder: StaticEncoder {
    static var dateFormatter: DateFormatter { get }
}

/// Combination of `CustomDateFormatterEncoder` & `CustomDateFormatterDecoder`
/// - Note: Implement to use a custom `DateFormatter` for (de)serialization in the `StaticCoder` Property Wrapper
/// - Example: `@StaticCoder<YourCustomDateFormatterCoder>`
public typealias DateFormatterStaticCoder = StaticCoder & DateFormatterStaticEncoder & DateFormatterStaticDecoder

extension DateFormatterStaticDecoder {
    /// Uses `dateFormatter` for decoding
    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        guard let value = dateFormatter.date(from: stringValue) else {
            let description = "Expected \(Date.self) but could not convert \(stringValue) to Date"
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: description))
        }
        return value
    }
}

extension DateFormatterStaticEncoder {
/// Uses `dateFormatter` for encoding
    public static func encode(value: Date, to encoder: Encoder) throws {
        try dateFormatter.string(from: value).encode(to: encoder)
    }
}

// MARK: - ISO8601 DateStyle

/// Uses default `Date.ISO8601FormatStyle`
/// - Note: Implement a `StaticCoder` to use a custom formatter
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public struct ISO8601StaticCoder: ISO8601DateFormatStyleStaticCoder {
    public static let iso8601DateStyle: Date.ISO8601FormatStyle = {
        let style = Date.ISO8601FormatStyle()
        return style
    }()
}

/// A `StaticDecoder` that uses an `Date.ISO8601FormatStyle` for decoding
/// - Note: Implement to use a custom `Date.ISO8601FormatStyle` for deserialization in the `StaticDecoder` Property Wrapper
/// - Example: `@StaticDecoder<YourCustomISO8601DateDecoder>`
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public protocol ISO8601DateFormatStyleStaticDecoder: StaticDecoder {
    static var iso8601DateStyle: Date.ISO8601FormatStyle { get }
}
/// A `StaticEncoder` that uses an `Date.ISO8601FormatStyle` for decoding
/// - Note: Implement to use a custom `Date.ISO8601FormatStyle` for serialization in the `StaticEncoder` Property Wrapper
/// - Example: `@StaticEncoder<YourCustomISO8601DateEncoder>`
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public protocol ISO8601DateFormatStyleStaticEncoder: StaticEncoder {
    static var iso8601DateStyle: Date.ISO8601FormatStyle { get }
}

/// Combination of `ISO8601DateFormatStyleStaticEncoder` & `ISO8601DateFormatStyleStaticDecoder`
/// - Note: Implement to use a custom `Date.ISO8601FormatStyle` for (de)serialization in the `StaticCoder` Property Wrapper
/// - Example: `@StaticCoder<YourCustomISO8601DateCoder>`
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601DateFormatStyleStaticCoder = StaticCoder & ISO8601DateFormatStyleStaticEncoder & ISO8601DateFormatStyleStaticDecoder

@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
extension ISO8601DateFormatStyleStaticDecoder {
    /// Uses `iso8601DateStyle` for decoding
    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        let value = try iso8601DateStyle.parse(stringValue)
        return value
    }
}

@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
extension ISO8601DateFormatStyleStaticEncoder {
    /// Uses `iso8601DateStyle` for encoding
    public static func encode(value: Date, to encoder: Encoder) throws {
        try value.formatted(iso8601DateStyle).encode(to: encoder)
    }
}
