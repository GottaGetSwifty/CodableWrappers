//
//  OptionalWrappers.swift
//
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

//MARK: - EncodeNulls

/// Used to still encode nil values for the wrapped Property, e.g. in JSON will encode "null"
@propertyWrapper
public struct EncodeNulls<T: Encodable>: Encodable where T: ExpressibleByNilLiteral {

    public var wrappedValue: T
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public func encode(to encoder: Encoder) throws {
        let mirror = Mirror(reflecting: wrappedValue)
        guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
            return
        }
        try wrappedValue.encode(to: encoder)
    }
}

/// Ensures there isn't an extra level added
extension EncodeNulls: Decodable, TransientDecodable where T: Decodable { }


//MARK: - OptionalWrapper

/// Protocol for a PropertyWrapper to properly handle Coding when the wrappedValue is Optional
public protocol OptionalWrapper {
    associatedtype WrappedType: ExpressibleByNilLiteral
    var wrappedValue: WrappedType { get }
    init(wrappedValue: WrappedType)
}

extension KeyedDecodingContainer {
    // This is used to override the default decoding behavior for OptionalCodingWrapper to allow a value to avoid a missing key Error
    public func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T : Decodable, T: OptionalWrapper {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: nil)
    }
}

extension KeyedEncodingContainer {
    // Used to make make sure OptionalCodingWrappers encode no value when it's wrappedValue is nil.
    public mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: OptionalWrapper {

        // Currently uses Mirror...this should really be avoided, but I'm not sure there's another way to do it cleanly/safely.
        let mirror = Mirror(reflecting: value.wrappedValue)
        guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
            return
        }

        try encodeIfPresent(value, forKey: key)
    }
}

//MARK: - OptionalCoding and Wrapper

/// Contract for a Type that wraps a StaticEncoder and makes it usable when the WrappedType is Optional
public protocol OptionalStaticEncoding: Encodable, OptionalWrapper where WrappedType == EncoderWrapper.CustomEncoder.OriginalType? {
    associatedtype EncoderWrapper: StaticEncoderWrapper
}

public extension OptionalStaticEncoding {
    // Encodes the wrappedValue using the CustomEncoder if the value exists
    func encode(to encoder: Encoder) throws {
        if let wrappedValue = wrappedValue {
            try EncoderWrapper.CustomEncoder.encode(value: wrappedValue, to: encoder)
        }
    }
}

/// Contract for a Type that wraps a StaticDecoder and makes it usable the WrappedType is Optional
public protocol OptionalStaticDecoding: Decodable, OptionalWrapper where WrappedType == DecoderWrapper.CustomDecoder.DecodedType? {
    associatedtype DecoderWrapper: StaticDecoderWrapper
}

extension OptionalStaticDecoding {
    // Decodes using the DecoderWrapper's CustomDecoder
    public init(from decoder: Decoder) throws {
        self.init(wrappedValue: try? DecoderWrapper.CustomDecoder.decode(from: decoder))
    }
}

/// Combination of OptionalStaticDecoding and OptionalStaticEncoding
public protocol OptionalStaticCoding: OptionalStaticDecoding, OptionalStaticEncoding { }

/// Wraps `StaticEncoderWrapper` generically to allow the wrapped property to be Optional
@propertyWrapper
public struct OptionalEncoding<CustomDecoderWrapper: StaticEncoderWrapper>: OptionalStaticEncoding {
    public typealias EncoderWrapper = CustomDecoderWrapper

    public var wrappedValue: CustomDecoderWrapper.CustomEncoder.OriginalType?
    public init(wrappedValue: CustomDecoderWrapper.CustomEncoder.OriginalType?) {
        self.wrappedValue = wrappedValue
    }
}

/// Wraps `StaticDecoderWrapper` generically to allow the wrapped property to be Optional
@propertyWrapper
public struct OptionalDecoding<CustomDecoderWrapper: StaticDecoderWrapper>: OptionalStaticDecoding {
    public typealias DecoderWrapper = CustomDecoderWrapper

    public var wrappedValue: CustomDecoderWrapper.CustomDecoder.DecodedType?
    public init(wrappedValue: CustomDecoderWrapper.CustomDecoder.DecodedType?) {
        self.wrappedValue = wrappedValue
    }
}

/// Wraps `StaticCodingWrapper` generically to allow the wrapped property to be Optional
@propertyWrapper
public struct OptionalCoding<CustomCoderWrapper: StaticCodingWrapper>: OptionalStaticCoding {

    public typealias DecoderWrapper = CustomCoderWrapper
    public typealias EncoderWrapper = CustomCoderWrapper

    public var wrappedValue: CustomCoderWrapper.CustomEncoder.OriginalType?
    public init(wrappedValue: CustomCoderWrapper.CustomDecoder.DecodedType?) {
        self.wrappedValue = wrappedValue
    }
}

//MARK: Enable Customizing one direction

/// Ensures there isn't an extra level added
extension OptionalEncoding: Decodable, TransientDecodable where CustomDecoderWrapper.CustomEncoder.OriginalType: Decodable { }
/// Ensures there isn't an extra level added
extension OptionalDecoding: Encodable, TransientEncodable where CustomDecoderWrapper.CustomDecoder.DecodedType: Encodable { }

//MARK: Conditional Equatable Conformance

extension OptionalEncoding: Equatable where CustomDecoderWrapper.CustomEncoder.OriginalType: Equatable {}
extension OptionalDecoding: Equatable where CustomDecoderWrapper.CustomDecoder.DecodedType: Equatable {}
extension OptionalCoding: Equatable where CustomCoderWrapper.CustomEncoder.OriginalType: Equatable {}

