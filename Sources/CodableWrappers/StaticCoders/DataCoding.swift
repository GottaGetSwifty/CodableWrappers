//
//  DataCoding.swift
//  
//
//  Created by PJ Fechner on 10/16/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

/// Uses Base64 for (de)serailization of `Data`
public struct Base64DataStaticCoder: StaticCoder {

    public static func decode(from decoder: Decoder) throws -> Data {

        let stringValue = try String(from: decoder)

        guard let value = Data.init(base64Encoded: stringValue) else {
            let debugDescription = "Expected \(Data.self) but could not convert \(stringValue) to Data"
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: debugDescription))
        }
        return value
    }

    public static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}
