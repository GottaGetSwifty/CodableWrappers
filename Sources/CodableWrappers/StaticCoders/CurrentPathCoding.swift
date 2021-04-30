//
//  CurrentPathCoding.swift
//  
//
//  Created by KY1VSTAR on 30.04.2021.
//

import Foundation

public protocol AnyCurrentPathEncoder {
    associatedtype T: Encodable
    static func encode(value: T, to encoder: Encoder) throws
}

public protocol AnyCurrentPathDecoder {
    associatedtype T: Decodable
    static func decode(from decoder: Decoder) throws -> T
}

public struct CurrentPathStaticEncoder<T: Encodable>: StaticEncoder, AnyCurrentPathEncoder {
    public static func encode(value: T, to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}

public struct CurrentPathStaticDecoder<T: Decodable>: StaticDecoder, AnyCurrentPathDecoder {
    public static func decode(from decoder: Decoder) throws -> T {
        try T.init(from: decoder)
    }
}

public struct CurrentPathStaticCoder<T: Codable>: StaticCoder, AnyCurrentPathEncoder, AnyCurrentPathDecoder {
    public static func decode(from decoder: Decoder) throws -> T {
        try T.init(from: decoder)
    }
    
    public static func encode(value: T, to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}

extension KeyedEncodingContainer {
    public mutating func encode<T>(_ value: T, forKey key: Key) throws where T: StaticEncoderWrapper, T.CustomEncoder: AnyCurrentPathEncoder {
        let extractor = EncoderExtractor()
        try? encode(extractor, forKey: key)
        
        guard let encoder = extractor.encoder else {
            throw EncodingError.invalidValue(value, .init(codingPath: codingPath, debugDescription: "Failed to encode \(T.self)"))
        }

        try T.CustomEncoder.encode(value: value.wrappedValue, to: encoder)
    }
}

extension KeyedDecodingContainer {
    public func decode<T>(_: T.Type, forKey key: Key) throws -> T where T: StaticDecoderWrapper, T.CustomDecoder: AnyCurrentPathDecoder {
        let anyKey = allKeys.first ?? key
        let extractor = try decode(DecoderExtractor.self, forKey: anyKey)
        return T.init(wrappedValue: try T.CustomDecoder.decode(from: extractor.decoder))
    }
}

private final class EncoderExtractor: Encodable {
    var encoder: Encoder?
    
    func encode(to encoder: Encoder) throws {
        self.encoder = encoder
        throw DummyError()
    }
}

private struct DummyError: Error {}

private struct DecoderExtractor: Decodable {
    var decoder: Decoder
    
    init(from decoder: Decoder) throws {
        self.decoder = decoder
    }
}
