//
//  CustomCoders.swift
//  
//
//  Created by Paul Fechner Jr on 9/17/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.


import Foundation

// MARK: - FloatingPoint
public protocol NonConformingFloatValueProvider {
    static var positiveInfinity: String { get }
    static var negativeInfinity: String { get }
    static var nan: String { get }
}

public struct NonConformingFloatCoder<ValueProvider: NonConformingFloatValueProvider>: StaticCoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Float {
        let stringValue = try String(from: decoder)
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

    public static func encode(value: Float, to encoder: Encoder) throws {
        switch value {
        case .infinity: return try ValueProvider.positiveInfinity.encode(to: encoder)
        case -.infinity: return try ValueProvider.negativeInfinity.encode(to: encoder)
        case .nan: return try ValueProvider.nan.encode(to: encoder)
        default: try String(value).encode(to: encoder)
        }
    }
}
public struct NonConformingFloatDecoder<ValueProvider: NonConformingFloatValueProvider>: StaticDecoder {
    private init() { }
    public static func decode(from decoder: Decoder) throws -> Float {
        try NonConformingFloatCoder<ValueProvider>.decode(from: decoder)
    }
}
public struct NonConformingFloatEncoder<ValueProvider: NonConformingFloatValueProvider>: StaticEncoder {
    private init() {}
    public static func encode(value: Float, to encoder: Encoder) throws {
        try NonConformingFloatCoder<ValueProvider>.encode(value: value, to: encoder)
    }
}

public struct NonConformingDoubleCoder<ValueProvider: NonConformingFloatValueProvider>: StaticCoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Double {
        let stringValue = try String(from: decoder)
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

    public static func encode(value: Double, to encoder: Encoder) throws {
        switch value {
        case .infinity: return try ValueProvider.positiveInfinity.encode(to: encoder)
        case -.infinity: return try ValueProvider.negativeInfinity.encode(to: encoder)
        case .nan: return try ValueProvider.nan.encode(to: encoder)
        default: try String(value).encode(to: encoder)
        }
    }
}
public struct NonConformingDoubleDecoder<ValueProvider: NonConformingFloatValueProvider>: StaticDecoder {
    private init() { }
    public static func decode(from decoder: Decoder) throws -> Double {
        try NonConformingDoubleCoder<ValueProvider>.decode(from: decoder)
    }
}
public struct NonConformingDoubleEncoder<ValueProvider: NonConformingFloatValueProvider>: StaticEncoder {
    private init() {}
    public static func encode(value: Double, to encoder: Encoder) throws {
        try NonConformingDoubleCoder<ValueProvider>.encode(value: value, to: encoder)
    }
}

// MARK: - Data

public struct Base64DataCoder: StaticCoder {
    private init() { }
        
    public static func decode(from decoder: Decoder) throws -> Data {
        let stringValue = try String(from: decoder)

        guard let value = Data.init(base64Encoded: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }
    public static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}

public struct Base64DataDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Data {
        try Base64DataCoder.decode(from: decoder)
    }
}
public struct Base64DataEncoder: StaticEncoder {
    private init() { }

    public static func encode(value: Data, to encoder: Encoder) throws {
        try Base64DataCoder.encode(value: value, to: encoder)
    }
}

// MARK: - Date

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
public struct MillisecondsSince1970DateDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {
        try MillisecondsSince1970DateCoder.decode(from: decoder)
    }
}
public struct MillisecondsSince1970DateEncoder: StaticEncoder {
    private init() { }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try MillisecondsSince1970DateCoder.encode(value: value, to: encoder)
    }
}

public struct SecondsSince1970DateCoder: StaticCoder {
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
    public static func encode(value: Date, to encoder: Encoder) throws {
        try "\(value.timeIntervalSince1970)".encode(to: encoder)
    }
}
public struct SecondsSince1970DateDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {
        try SecondsSince1970DateCoder.decode(from: decoder)
    }
}
public struct SecondsSince1970DateEncoder: StaticEncoder {
    private init() { }

    public static func encode(value: Date, to encoder: Encoder) throws {
        try SecondsSince1970DateCoder.encode(value: value, to: encoder)
    }
}

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateCoder: StaticCoder {

    private static var iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = .withInternetDateTime
        return formatter
    }()

    private init() { }

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
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateDecoder: StaticDecoder {
    private init() { }

    public static func decode(from decoder: Decoder) throws -> Date {
        try ISO8601DateCoder.decode(from: decoder)
    }
}
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public struct ISO8601DateEncoder: StaticEncoder {
    private init() { }
    public static func encode(value: Date, to encoder: Encoder) throws {
        try ISO8601DateCoder.encode(value: value, to: encoder)
    }
}

public protocol CustomDateFormatterDecoder: StaticDecoder {
    static var dateFormatter: DateFormatter { get }
}
public protocol CustomDateFormatterEncoder: StaticEncoder {
    static var dateFormatter: DateFormatter { get }
}

public typealias CustomDateFormatterCoder = StaticCoder & CustomDateFormatterEncoder & CustomDateFormatterDecoder

extension CustomDateFormatterDecoder {
    static func decode(from decoder: Decoder) throws -> Date {
        let stringValue = try String(from: decoder)

        guard let value = dateFormatter.date(from: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }
}
extension CustomDateFormatterEncoder {
    static func encode(value: Date, to encoder: Encoder) throws {
        try dateFormatter.string(from: value).encode(to: encoder)
    }
}

