//
//  NullEncoding.swift
//  
//
//  Created by PJ Fechner on 7/12/20.
//

import Foundation
//MARK: - EncodeNulls


/// Encodes a nil value in a singleValueContainer using `encodeNil` rather than it being omitted.
/// - note This uses Mirror to check for nil so should not be used in high performance scenarios. This is done in order to check for nil without short circuiting nested Error handling. If there is a better way please submit a pull request / issue :) 
public struct NullStaticEncoder<T: Encodable>: StaticEncoder where T: ExpressibleByNilLiteral {
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
