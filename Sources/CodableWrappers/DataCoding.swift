//
//  DataCoding.swift
//  
//
//  Created by Paul Fechner on 10/16/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

typealias Base64DataCoder = Coder<Base64DataEncoder, Base64DataDecoder>
/// Uses Base64 for (de)serailization of `Data`
//public struct Base64DataCoder: StaticCoder {
//    private init() { }
//
//    public static func decode(from decoder: Decoder) throws -> Data { try Base64DataDecoder.decode(from: decoder) }
//    public static func encode(value: Data, to encoder: Encoder) throws { try Base64DataEncoder.encode(value: value, to: encoder) }
//}

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
