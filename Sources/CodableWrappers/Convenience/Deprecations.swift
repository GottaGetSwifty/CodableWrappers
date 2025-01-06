//
//  Deprecations.swift
//  CodableWrappers
//
//  Created by PJ Fechner on 1/6/25.
//

import Foundation

// MARK: Deprecated ISO8601Date

/// ** Deprecated ** Replace  with ``ISO8601Encoding``
///
/// Encode this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601Encoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601Encoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601Encoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601Encoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateEncoding = EncodingUses<ISO8601DateStaticCoder>

/// ** Deprecated ** Replace  with ``ISO8601Decoding``
///
/// Decode this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601Decoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601Decoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601Decoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601Decoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateDecoding = DecodingUses<ISO8601DateStaticCoder>

/// ** Deprecated ** Replace  with ``ISO8601Coding``
///
/// (En/De)code this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601Coding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601Coding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601Coding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601Coding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateCoding = CodingUses<ISO8601DateStaticCoder>

// MARK: Deprecated CustomISO8601Date

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleDecoding``
/// Encode this immutable `Date` Property using the passed formatter
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleDecoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleDecoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleDecoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleDecoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateFormatterEncoding<CustomEncoder: ISO8601DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleEncoding``
///
/// Decode this immutable `Date` Property using the passed formatter
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleEncoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleEncoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleEncoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleEncoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateFormatterDecoding<CustomDecoder: ISO8601DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleCoding``
///
/// (En/De)code this immutable `Date` Property using the passed formatter
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleCoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleCoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleCoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleCoding",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateFormatterCoding<CustomCoder: ISO8601DateFormatterStaticCoder> = CodingUses<CustomCoder>


// MARK: - Deprecated ISO8601 DateFormatter

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleStaticCoder``
///
/// Uses `ISO8601DateFormatter` with `formatOptions` set to `.withInternetDateTime` for (de)serailization of `Date`
/// - Note: Implement a `StaticCoder` to use a custom formatter
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public struct ISO8601DateStaticCoder: ISO8601DateFormatterStaticCoder {
#if swift(>=6.0.0)
    nonisolated(unsafe) public static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()
#else
    public static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()
#endif
}

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleStaticDecoder``
///
/// A `StaticDecoder` that uses an ISO8601DateFormatter for decoding
/// - Note: Implement to use a custom `ISO8601DateFormatter` for deserialization in the `StaticDecoder` Property Wrapper
/// - Example: `@StaticDecoder<YourCustomISO8601DateFormatterDecoder>`
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleStaticDecoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticDecoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleStaticDecoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticDecoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public protocol ISO8601DateFormatterStaticDecoder: StaticDecoder {
    static var iso8601DateFormatter: ISO8601DateFormatter { get }
}

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleStaticEncoder``
///
/// A `StaticEncoder` that uses an ISO8601DateFormatter for decoding
/// - Note: Implement to use a custom `ISO8601DateFormatter` for serialization in the `StaticEncoder` Property Wrapper
/// - Example: `@StaticEncoder<YourCustomISO8601DateFormatterEncoder>`
/// 
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleStaticEncoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticEncoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleStaticEncoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticEncoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public protocol ISO8601DateFormatterStaticEncoder: StaticEncoder {
    static var iso8601DateFormatter: ISO8601DateFormatter { get }
}

/// ** Deprecated ** Replace  with ``ISO8601DateFormatStyleStaticCoder``\n
///
/// Combination of `ISO8601DateFormatterStaticEncoder` & `ISO8601DateFormatterStaticDecoder`
/// - Note: Implement to use a custom `ISO8601DateFormatter` for (de)serialization in the `StaticCoder` Property Wrapper
/// - Example: `@StaticCoder<YourCustomISO8601DateFormatterCoder>`
@available(macOS, introduced: 10.12, deprecated: 12, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(iOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(watchOS, introduced: 3.0, deprecated: 8, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
@available(tvOS, introduced: 10.0, deprecated: 15, renamed: "ISO8601DateFormatStyleStaticCoder",
           message: "To support Concurrency Checks use of `ISO8601DateFormatter` has been deprecated in favor of using `Date.ISO8601FormatStyle` with a new API")
public typealias ISO8601DateFormatterStaticCoder = StaticCoder & ISO8601DateFormatterStaticEncoder & ISO8601DateFormatterStaticDecoder

@available(macOS, introduced: 10.12, deprecated: 12)
@available(iOS, introduced: 10.0, deprecated: 15)
@available(watchOS, introduced: 3.0, deprecated: 8)
@available(tvOS, introduced: 10.0, deprecated: 15)
extension ISO8601DateFormatterStaticDecoder {
    /// Uses `ISO8601DateFormatter` for decoding
    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        guard let value = iso8601DateFormatter.date(from: stringValue) else {
            let description = "Expected \(Data.self) but could not convert \(stringValue) to Data"
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: description))
        }
        return value
    }
}

@available(macOS, introduced: 10.12, deprecated: 12)
@available(iOS, introduced: 10.0, deprecated: 15)
@available(watchOS, introduced: 3.0, deprecated: 8)
@available(tvOS, introduced: 10.0, deprecated: 15)
extension ISO8601DateFormatterStaticEncoder {
    /// Uses `iso8601DateFormatter` for encoding
    public static func encode(value: Date, to encoder: Encoder) throws {
        try iso8601DateFormatter.string(from: value).encode(to: encoder)
    }
}
