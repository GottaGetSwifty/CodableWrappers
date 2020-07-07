//
//  OptionalWrappers.swift
//
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

// MARK: Optional Static  Coder

/// Used to wrap an existing StaticCoder to allow the wrapped value to be Optional
public struct OptionalStaticCoder<SomeStaticCoder: StaticCoder>: StaticCoder  {

    public static func decode(from decoder: Decoder) throws -> SomeStaticCoder.CodingType? {
            try? SomeStaticCoder.decode(from: decoder)
        }

    public static func encode(value: SomeStaticCoder.CodingType?, to encoder: Encoder) throws {
        guard let value = value else {
            return
        }
        try SomeStaticCoder.encode(value: value, to: encoder)
    }
}

//MARK: - OptionalCodingWrapper

/// Protocol for a PropertyWrapper to properly handle Coding when the wrappedValue is Optional
public protocol OptionalCodingWrapper {
    associatedtype WrappedType: ExpressibleByNilLiteral
    var wrappedValue: WrappedType { get }
    init(wrappedValue: WrappedType)
}

extension KeyedDecodingContainer {
    // This is used to override the default decoding behavior for OptionalCodingWrapper to allow a value to avoid a missing key Error
    public func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T : Decodable, T: OptionalCodingWrapper {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

extension KeyedEncodingContainer {
    // Used to make make sure OptionalCodingWrappers encode no value when it's wrappedValue is nil.
    public mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: OptionalCodingWrapper {
        print("hi")
        // Currently uses Mirror...this should really be avoided, but I'm not sure there's another way to do it cleanly.
        let mirror = Mirror(reflecting: value.wrappedValue)
        guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
            return
        }

        try encodeIfPresent(value, forKey: key)
    }
}

//MARK: Extensions to make the propertyWrappers adhere to OptionalCodingWrapper when wrapped value is Optional

extension DecodingUses: OptionalCodingWrapper where CustomDecoder.DecodedType: ExpressibleByNilLiteral { }
extension EncodingUses: OptionalCodingWrapper where CustomEncoder.OriginalType: ExpressibleByNilLiteral { }
extension CodingUses: OptionalCodingWrapper where CustomCoder.CodingType: ExpressibleByNilLiteral, CustomCoder.CodingType: Equatable { }
extension DecodingUsesMutable: OptionalCodingWrapper where CustomDecoder.DecodedType: ExpressibleByNilLiteral { }
extension EncodingUsesMutable: OptionalCodingWrapper where CustomEncoder.OriginalType: ExpressibleByNilLiteral { }
extension CodingUsesMutable: OptionalCodingWrapper where CustomCoder.CodingType: ExpressibleByNilLiteral { }

//MARK: - OmitCoding

/// Protocol for a PropertyWrapper to indicate that it should be ommited from Coding.
public protocol OmitableFromCoding {
    associatedtype WrappedType: ExpressibleByNilLiteral
    init(wrappedValue: WrappedType)

}
/// Add this to an Optional Property to not included it when Encoding or Decoding
@propertyWrapper
public struct OmitCoding<WrappedType>: Codable, OmitableFromCoding {

    public let wrappedValue: WrappedType?
    public init(wrappedValue: WrappedType?) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        self.wrappedValue = nil
    }

    public func encode(to encoder: Encoder) throws { return }
}

extension KeyedDecodingContainer {
    // This is used to override the default decoding behavior for OptionalCodingWrapper to allow a value to avoid a missing key Error
    public func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T : Decodable, T: OmitableFromCoding {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

extension KeyedEncodingContainer {
    // Used to make make sure OptionalCodingWrappers encode no value when it's wrappedValue is nil.
    public mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: OmitableFromCoding {
        print("hi")
        return
    }
}

extension OmitCoding: Equatable where WrappedType: Equatable { }

//MARK: - OmitCodingWhenNil (prototype)

/// Basic Coder to simplify interface for composition-intended wrappers
private struct EmptyStaticCoder<T: Codable>: StaticCoder {
    static func decode(from decoder: Decoder) throws -> T { try T(from: decoder) }
    static func encode(value: T, to encoder: Encoder) throws { try value.encode(to: encoder) }
}

//extension OptionalCoding: Equatable where WrappedType: Equatable { }
//
///// Goal is to be usable once Wrapper composition is possible.
//@propertyWrapper
//public struct OptionalCoding<WrappedType: Codable>: Codable, OptionalCodingWrapper {
//
//    public let wrappedValue: WrappedType?
//    public init(wrappedValue: WrappedType?) {
//        self.wrappedValue = wrappedValue
//    }
//
//    /// Decodes the `wrappedValue`  using the `CustomDecoder`
//    public init(from decoder: Decoder) throws {
//        let value: WrappedType = try EmptyStaticCoder.decode(from: decoder)
//        self.init(wrappedValue: value)
//    }
//
//    /// Encodes the `wrappedValue` using the `CustomEncoder`
//    public func encode(to encoder: Encoder) throws {
//        try EmptyStaticCoder.encode(value: wrappedValue, to: encoder)
//    }
//}

public protocol OptionalEncoder: Encodable {
    associatedtype EncoderWrapper: StaticEncoderWrapper

    var wrappedValue: EncoderWrapper.CustomEncoder.OriginalType? { get }
}

public extension OptionalEncoder {
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = wrappedValue {
            try EncoderWrapper.CustomEncoder.encode(value: wrappedValue, to: encoder)
        }
    }
}

public protocol OptionalDecoder: Decodable {
    associatedtype DecoderWrapper: StaticDecoderWrapper
    init(wrappedValue: DecoderWrapper.CustomDecoder.DecodedType?)
}

extension OptionalDecoder {
    public init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? DecoderWrapper.CustomDecoder.decode(from: decoder))
    }
}

public protocol OptionalCoder: OptionalDecoder, OptionalEncoder where DecoderWrapper.CustomDecoder.DecodedType == EncoderWrapper.CustomEncoder.OriginalType {

}

@propertyWrapper
public struct OptionalEncoding<CustomDecoderWrapper: StaticEncoderWrapper>: OptionalEncoder {
    public typealias EncoderWrapper = CustomDecoderWrapper

    public var wrappedValue: CustomDecoderWrapper.CustomEncoder.OriginalType?
    public init(wrappedValue: CustomDecoderWrapper.CustomEncoder.OriginalType?) {
        self.wrappedValue = wrappedValue
    }
}

/// Customize the decoding of an immuitable property using the `CustomDecoder`
@propertyWrapper
public struct OptionalDecoding<CustomDecoderWrapper: StaticDecoderWrapper>: OptionalDecoder {
    public typealias DecoderWrapper = CustomDecoderWrapper

    public var wrappedValue: CustomDecoderWrapper.CustomDecoder.DecodedType?
    public init(wrappedValue: CustomDecoderWrapper.CustomDecoder.DecodedType?) {
        self.wrappedValue = wrappedValue
    }
}

/// Customize the encoding and decoding of an immuitable property using the `CustomCoder`
@propertyWrapper
public struct OptionalCoding<CustomCoderWrapper: StaticCodingWrapper>: OptionalCoder, OptionalCodingWrapper {

    public typealias DecoderWrapper = CustomCoderWrapper
    public typealias EncoderWrapper = CustomCoderWrapper

    public var wrappedValue: CustomCoderWrapper.CustomEncoder.OriginalType?
    public init(wrappedValue: CustomCoderWrapper.CustomDecoder.DecodedType?) {
        self.wrappedValue = wrappedValue
    }
}

extension OptionalCoding: Equatable where CustomCoderWrapper.CustomEncoder.OriginalType: Equatable {}

public protocol TransientCodable: TransientEncodable, TransientDecodable where ValueType == InitType { }

public protocol TransientEncodable: Encodable {
    associatedtype ValueType: Encodable
    var wrappedValue: ValueType { get }
}
public extension TransientEncodable {
    func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

public protocol TransientDecodable: Decodable {
    associatedtype InitType: Decodable
    init(wrappedValue: InitType)
}
public extension TransientDecodable {
    init(from decoder: Decoder) throws {
        self.init(wrappedValue: try InitType(from: decoder))
    }
}

@propertyWrapper
public struct TransientEncoding<T:Codable>: TransientEncodable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}
extension TransientEncoding: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        wrappedValue = try T(from: decoder)
    }
}

@propertyWrapper
public struct TransientDecoding<T:Codable>: TransientDecodable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}
extension TransientDecoding: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

@propertyWrapper
public struct TransientCoding<T:Codable>: TransientCodable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

extension TransientCoding: OptionalCodingWrapper where T: ExpressibleByNilLiteral { }
extension TransientCoding: Equatable where T: Equatable {} 

@propertyWrapper
public struct ImmutableCodable<T: Codable>: TransientCodable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct ImmutableEncodable<T: Encodable>: TransientEncodable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}
extension ImmutableEncodable: Decodable where T: Decodable {
    public init(from decoder: Decoder) throws {
        wrappedValue = try T(from: decoder)
    }
}

@propertyWrapper
public struct ImmutableDecodable<T: Decodable>: TransientDecodable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
}

extension ImmutableDecodable: Encodable where T: Encodable {
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}
