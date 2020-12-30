//
//  NullEncoding.swift
//  
//
//  Created by PJ Fechner on 7/12/20.
//

import Foundation
//MARK: - EncodeNulls

public protocol AnyNullEncoder {
    associatedtype T: Encodable
    static func encode(value: T, to encoder: Encoder) throws
}

/// Encodes a nil value in a singleValueContainer using `encodeNil` rather than it being omitted.
/// - note This uses Mirror to check for nil so should not be used in high performance scenarios. This is done in order to check for nil without short circuiting nested Error handling. If there is a better way please submit a pull request / issue :)
public struct NullStaticEncoder<T: Encodable>: StaticEncoder, AnyNullEncoder where T: ExpressibleByNilLiteral {
    public static func encode(value: T, to encoder: Encoder) throws {
        let mirror = Mirror(reflecting: value)
        guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
            return
        }
        try value.encode(to: encoder)
    }
}


extension KeyedEncodingContainer {
    // Used to make bybass the `OptionalCodingWrappers` which encodes no value when it's wrappedValue is nil.
    public mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: OptionalEncodingWrapper & StaticEncoderWrapper, T.CustomEncoder: AnyNullEncoder {
        try T.CustomEncoder.encode(value: value.wrappedValue, to: superEncoder(forKey: key))
    }
}
