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

/// Protocol for a PropertyWrapper to propperly handle Coding when the wrappedValue is Optional
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

/// Add this to an Optional Property to not included it when Encoding or Decoding
@propertyWrapper
public struct OmitCoding<WrappedType>: Codable {

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
    public func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> OmitCoding<T> where T : Decodable {
        return OmitCoding<T>(wrappedValue: nil)
    }
}

extension KeyedEncodingContainer {
    // Used to make make sure OptionalCodingWrappers encode no value when it's wrappedValue is nil.
    public mutating func encode<T>(_ value: OmitCoding<T>, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable {
        return
    }
}

//MARK: - OmitCodingWhenNil (prototype)

private struct EmptyStaticCoder<T: Codable>: StaticCoder {
    static func decode(from decoder: Decoder) throws -> T { try T(from: decoder) }
    static func encode(value: T, to encoder: Encoder) throws { try value.encode(to: encoder) }
}

/// Prototype Wrapper, goal is to be usable once Wrapper composition is possible.
@propertyWrapper
internal struct OmitCodingWhenNil<WrappedType: Codable>: Codable, OptionalCodingWrapper {

    public let wrappedValue: WrappedType?
    public init(wrappedValue: WrappedType?) {
        self.wrappedValue = wrappedValue
    }

    /// Decodes the `wrappedValue`  using the `CustomDecoder`
    public init(from decoder: Decoder) throws {
        let value: WrappedType = try EmptyStaticCoder.decode(from: decoder)
        self.init(wrappedValue: value)
    }

    /// Encodes the `wrappedValue` using the `CustomEncoder`
    public func encode(to encoder: Encoder) throws {
        try EmptyStaticCoder.encode(value: wrappedValue, to: encoder)
    }
}

extension OmitCodingWhenNil: Equatable where WrappedType: Equatable { }
