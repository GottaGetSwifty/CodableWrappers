//
//  CustomCoders.swift
//  
//
//  Created by Paul Fechner Jr on 9/17/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.


import Foundation

// MARK: - NonConformingFloatingPoint

/// A provider for the data needed for (de)serializing non conforming floating point values
public protocol NonConformingDecimalValueProvider {
    /// The seralized `String` value to use when a number of `infiniti`
    static var positiveInfinity: String { get }
    /// The seralized `String` value to use when a number of `-infiniti`
    static var negativeInfinity: String { get }
    /// The seralized `String` value to use when a number of `NaN`
    static var nan: String { get }
}

/// Uses the `ValueProvider` for (de)serialization of a non-conforming `Float`
public struct NonConformingFloatCoder<ValueProvider: NonConformingDecimalValueProvider>: StaticCoder {
    private init() { }
    public static func decode(from decoder: Decoder) throws -> Float { try NonConformingFloatDecoder<ValueProvider>.decode(from: decoder) }
    public static func encode(value: Float, to encoder: Encoder) throws { try NonConformingFloatEncoder<ValueProvider>.encode(value: value, to: encoder) }
}
/// Uses the `ValueProvider` for deserialization of a non-conforming `Float`
public struct NonConformingFloatDecoder<ValueProvider: NonConformingDecimalValueProvider>: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Float {
        guard let stringValue = try? String(from: decoder) else {
            return try Float(from: decoder)
        }
        switch stringValue {
        case ValueProvider.positiveInfinity: return Float.infinity
        case ValueProvider.negativeInfinity: return -Float.infinity
        case ValueProvider.nan: return Float.nan
        default:
            guard let value = Float(stringValue) else {
                throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                debugDescription: "Expected \(Float.self) but could not convert \(stringValue) to Float"))
            }
            return value
        }
    }
}
/// Uses the `ValueProvider` for serialization of a non-conforming `Float`
public struct NonConformingFloatEncoder<ValueProvider: NonConformingDecimalValueProvider>: StaticEncoder {
    private init() {}

    public static func encode(value: Float, to encoder: Encoder) throws {

        //For some reason the switch with nan doesn't work
        guard !value.isNaN else {
            return try ValueProvider.nan.encode(to: encoder)
        }
        switch value {
        case .infinity: return try ValueProvider.positiveInfinity.encode(to: encoder)
        case -.infinity: return try ValueProvider.negativeInfinity.encode(to: encoder)
        default: try value.encode(to: encoder)
        }
    }
}
/// Uses the `ValueProvider` for (de)serialization of a non-conforming `Double`
public struct NonConformingDoubleCoder<ValueProvider: NonConformingDecimalValueProvider>: StaticCoder {
    private init() { }
    public static func decode(from decoder: Decoder) throws -> Double { try NonConformingDoubleDecoder<ValueProvider>.decode(from: decoder) }
    public static func encode(value: Double, to encoder: Encoder) throws { try NonConformingDoubleEncoder<ValueProvider>.encode(value: value, to: encoder) }
}
/// Uses the `ValueProvider` for deserialization of a non-conforming `Double`
public struct NonConformingDoubleDecoder<ValueProvider: NonConformingDecimalValueProvider>: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Double {
        guard let stringValue = try? String(from: decoder) else {
            return try Double(from: decoder)
        }
        switch stringValue {
        case ValueProvider.positiveInfinity: return Double.infinity
        case ValueProvider.negativeInfinity: return -Double.infinity
        case ValueProvider.nan: return Double.nan
        default:
            guard let value = Double(stringValue) else {
                throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                debugDescription: "Expected \(Double.self) but could not convert \(stringValue) to Float"))
            }
            return value
        }
    }
}
/// Uses the `ValueProvider` for serialization of a non-conforming `Double`
public struct NonConformingDoubleEncoder<ValueProvider: NonConformingDecimalValueProvider>: StaticEncoder {
    private init() {}

    public static func encode(value: Double, to encoder: Encoder) throws {

        //For some reason the switch with nan doesn't work
        guard !value.isNaN else {
            return try ValueProvider.nan.encode(to: encoder)
        }
        switch value {
        case .infinity: return try ValueProvider.positiveInfinity.encode(to: encoder)
        case -.infinity: return try ValueProvider.negativeInfinity.encode(to: encoder)
        default: try value.encode(to: encoder)
        }
    }
}

// MARK: - Data
/// Uses Base64 for (de)serailization of `Data`
public struct Base64DataCoder: StaticCoder {
    private init() { }
        
    public static func decode(from decoder: Decoder) throws -> Data { try Base64DataDecoder.decode(from: decoder) }
    public static func encode(value: Data, to encoder: Encoder) throws { try Base64DataEncoder.encode(value: value, to: encoder) }
}

/// Uses Base64 for deserialization of `Data`
public struct Base64DataDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Data {

        let stringValue = try String(from: decoder)

        guard let value = Data.init(base64Encoded: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }
}
/// Uses Base64 for serialization of `Data`
public struct Base64DataEncoder: StaticEncoder {
    private init() { }

    public static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}

// MARK: - Date

/// Uses millisecondsSince1970 for (de)serailization of `Date`
public struct MillisecondsSince1970DateCoder: StaticCoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date { try MillisecondsSince1970DateDecoder.decode(from: decoder) }
    public static func encode(value: Date, to encoder: Encoder) throws { try MillisecondsSince1970DateEncoder.encode(value: value, to: encoder) }
}
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

/// Uses secondsSince1970 for (de)serailization of `Date`
public struct SecondsSince1970DateCoder: StaticCoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date { try SecondsSince1970DateDecoder.decode(from: decoder) }
    public static func encode(value: Date, to encoder: Encoder) throws { try SecondsSince1970DateEncoder.encode(value: value, to: encoder) }
}
/// Uses secondsSince1970 for deserailization of `Date`
public struct SecondsSince1970DateDecoder: StaticDecoder {
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
public struct ISO8601DateCoder: StaticCoder {

    fileprivate static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date { try ISO8601DateDecoder.decode(from: decoder) }
    public static func encode(value: Date, to encoder: Encoder) throws { try ISO8601DateEncoder.encode(value: value, to: encoder) }
}
/// Uses `ISO8601DateFormatter` with `formatOptions` set to `.withInternetDateTime` for deserailization of `Date`
/// - Note: Implement a `StaticDecoder` to use a custom formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)
        guard let date = ISO8601DateCoder.iso8601Formatter.date(from: stringValue) else {
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
        try ISO8601DateCoder.iso8601Formatter.string(from: value).encode(to: encoder)
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

