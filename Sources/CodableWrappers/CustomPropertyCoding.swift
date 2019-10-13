//
//  CustomPropertyCoding.swift
//  
//
//  Created by Paul Fechner on 9/26/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

public protocol StaticDecoder {
    associatedtype DecodedType: Decodable
    static func decode(from decoder: Decoder) throws -> DecodedType
}

public protocol StaticEncoder {
    associatedtype OriginalType: Encodable
    static func encode(value: OriginalType, to encoder: Encoder) throws
}

public protocol StaticCoder: StaticDecoder & StaticEncoder where DecodedType == OriginalType {
    typealias CodingType = DecodedType
}

public protocol StaticEncoderWrapper: Encodable {
    associatedtype CustomEncoder: StaticEncoder
    var wrappedValue: CustomEncoder.OriginalType { get }
}

extension StaticEncoderWrapper {
    public func encode(to encoder: Encoder) throws {
        try CustomEncoder.encode(value: wrappedValue, to: encoder)
    }
}

public protocol StaticDecoderWrapper: Decodable {
    associatedtype CustomDecoder: StaticDecoder
    init(wrappedValue: CustomDecoder.DecodedType)
}

extension StaticDecoderWrapper {
    public init(from decoder: Decoder) throws {
        self.init(wrappedValue: try CustomDecoder.decode(from: decoder))
    }
}

public protocol StaticCodingWrapper: StaticEncoderWrapper & StaticDecoderWrapper {
    associatedtype CustomCoder: StaticCoder
}

@propertyWrapper
public struct CustomEncoding<CustomEncoder: StaticEncoder>: StaticEncoderWrapper {
    public var wrappedValue: CustomEncoder.OriginalType
    public init(wrappedValue: CustomEncoder.OriginalType) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct CustomDecoding<CustomDecoder: StaticDecoder>: StaticDecoderWrapper {
    public var wrappedValue: CustomDecoder.DecodedType
    public init(wrappedValue: CustomDecoder.DecodedType) {
        self.wrappedValue = wrappedValue
    }
}

@propertyWrapper
public struct CustomCoding<CustomCoder: StaticCoder>: StaticCodingWrapper {
    public typealias CustomEncoder = CustomCoder
    public typealias CustomDecoder = CustomCoder

    public var wrappedValue: CustomCoder.CodingType
    public init(wrappedValue: CustomCoder.CodingType) {
        self.wrappedValue = wrappedValue
    }
}

extension CustomCoding: Equatable where CustomCoder.CodingType: Equatable {}




