//
//  CustomPropertyCoding.swift
//  
//
//  Created by Paul Fechner on 9/26/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

//MARK: - Static Coding Protocols

/// Mirrors of `Encodable`'s functionality but in a static context
/// - Attention: When implementing ensure an additional level of nesting is not introduced
public protocol StaticEncoder {
    /// The Type this encodes
    associatedtype OriginalType: Encodable

    /// Mirror of `Encodable`'s `encode(to: Encoder)` but in a static context
    static func encode(value: OriginalType, to encoder: Encoder) throws
}

/// Mirrors of `Decodable`'s functionality but in a static context
/// - Attention: When implementing ensure an additional level of nesting is not introduced
public protocol StaticDecoder {
    /// The Type this will decode
    associatedtype DecodedType: Decodable

    /// Mirror of `Decodable`'s `init(from: Decoder)` but in a static context
    static func decode(from decoder: Decoder) throws -> DecodedType
}

/// Combines `StaticDecoder` and `StaticEncoder`
/// - Attention: When implementing ensure an additional level of nesting is not introduced
public protocol StaticCoder: StaticDecoder & StaticEncoder where DecodedType == OriginalType {
    /// `StaticDecoder.DecodedType` & `StaticEncoder.OriginalType`
    typealias CodingType = DecodedType
}

public struct Coder<Enc: StaticEncoder, Dec: StaticDecoder>: StaticCoder where Enc.OriginalType == Dec.DecodedType {

    public static func decode(from decoder: Decoder) throws -> Dec.DecodedType { try Dec.decode(from: decoder) }
    public static func encode(value: Enc.OriginalType, to encoder: Encoder) throws { try Enc.encode(value: value, to: encoder) }
}

//MARK: - Static Coding Wrapper Protocols

/// Contract for a Static Encoding Property Wrapper
/// This allows multiple wrappers to use the same `encode(to encoder: Encoder)` rather than reimplementing it.
public protocol StaticEncoderWrapper: Encodable {
    associatedtype CustomEncoder: StaticEncoder
    /// The value to be encoded
    var wrappedValue: CustomEncoder.OriginalType { get }
}

extension StaticEncoderWrapper {
    /// Encodes the `wrappedValue` using the `CustomEncoder`
    public func encode(to encoder: Encoder) throws {
        try CustomEncoder.encode(value: wrappedValue, to: encoder)
    }
}

/// Contract for a Static Decoding Property Wrapper
/// This allows multiple wrappers to use the same `init(from decoder: Decoder)` rather than reimplementing it.
public protocol StaticDecoderWrapper: Decodable {
    associatedtype CustomDecoder: StaticDecoder
    init(wrappedValue: CustomDecoder.DecodedType)
}

extension StaticDecoderWrapper {
    /// Decodes the `wrappedValue`  using the `CustomDecoder`
    public init(from decoder: Decoder) throws {
        self.init(wrappedValue: try CustomDecoder.decode(from: decoder))
    }
}

/// Combines `StaticEncoderWrapper` and `StaticDecoderWrapper`
public protocol StaticCodingWrapper: StaticEncoderWrapper & StaticDecoderWrapper {
    associatedtype CustomCoder: StaticCoder
}

//MARK: - Custom Coding Property Wrappers

/// Customize the encoding of a immuitable property using the `CustomEncoder`
@propertyWrapper
public struct CustomEncoding<CustomEncoder: StaticEncoder>: StaticEncoderWrapper {
    public let wrappedValue: CustomEncoder.OriginalType
    public init(wrappedValue: CustomEncoder.OriginalType) {
        self.wrappedValue = wrappedValue
    }
}

/// Customize the decoding of a immuitable property using the `CustomDecoder`
@propertyWrapper
public struct CustomDecoding<CustomDecoder: StaticDecoder>: StaticDecoderWrapper {
    public let wrappedValue: CustomDecoder.DecodedType
    public init(wrappedValue: CustomDecoder.DecodedType) {
        self.wrappedValue = wrappedValue
    }
}

/// Customize the encoding and decoding of a immuitable property using the `CustomCoder`
@propertyWrapper
public struct CustomCoding<CustomCoder: StaticCoder>: StaticCodingWrapper {
    public typealias CustomEncoder = CustomCoder
    public typealias CustomDecoder = CustomCoder

    public let wrappedValue: CustomCoder.CodingType
    public init(wrappedValue: CustomCoder.CodingType) {
        self.wrappedValue = wrappedValue
    }
}

//MARK: - Mutable Custom Coding Property Wrappers

/// Customize the encoding of a mutable property using the `CustomEncoder`
@propertyWrapper
public struct CustomEncodingMutable<CustomEncoder: StaticEncoder>: StaticEncoderWrapper {
    public var wrappedValue: CustomEncoder.OriginalType
    public init(wrappedValue: CustomEncoder.OriginalType) {
        self.wrappedValue = wrappedValue
    }
}

/// Customize the decoding of a mutable property using the `CustomDecoder`
@propertyWrapper
public struct CustomDecodingMutable<CustomDecoder: StaticDecoder>: StaticDecoderWrapper {
    public var wrappedValue: CustomDecoder.DecodedType
    public init(wrappedValue: CustomDecoder.DecodedType) {
        self.wrappedValue = wrappedValue
    }
}

/// Customize the encoding and decoding of a mutable property using the `CustomCoder`
@propertyWrapper
public struct CustomCodingMutable<CustomCoder: StaticCoder>: StaticCodingWrapper {
    public typealias CustomEncoder = CustomCoder
    public typealias CustomDecoder = CustomCoder

    public var wrappedValue: CustomCoder.CodingType
    public init(wrappedValue: CustomCoder.CodingType) {
        self.wrappedValue = wrappedValue
    }
}

//MARK: Enables only customizing one direction
extension CustomEncoding: Decodable where CustomEncoder.OriginalType: Decodable {}
extension CustomDecoding: Encodable where CustomDecoder.DecodedType: Encodable {}

extension CustomEncodingMutable: Decodable where CustomEncoder.OriginalType: Decodable {}
extension CustomDecodingMutable: Encodable where CustomDecoder.DecodedType: Encodable {}

//MARK: Equatable Conformance
extension CustomEncoding: Equatable where CustomEncoder.OriginalType: Equatable {}
extension CustomDecoding: Equatable where CustomDecoder.DecodedType: Equatable {}
extension CustomCoding: Equatable where CustomCoder.CodingType: Equatable {}

extension CustomEncodingMutable: Equatable where CustomEncoder.OriginalType: Equatable {}
extension CustomDecodingMutable: Equatable where CustomDecoder.DecodedType: Equatable {}
extension CustomCodingMutable: Equatable where CustomCoder.CodingType: Equatable {}


