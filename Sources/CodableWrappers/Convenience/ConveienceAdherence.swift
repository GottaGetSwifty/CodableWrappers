//
//  File.swift
//  
//
//  Created by Paul Fechner on 7/7/20.
//

import Foundation

//MARK: Extensions to make the propertyWrappers adhere to OptionalCodingWrapper when wrapped value is Optional

extension TransientEncoding: OptionalWrapper where T: ExpressibleByNilLiteral { }
extension TransientDecoding: OptionalWrapper where T: ExpressibleByNilLiteral { }
extension TransientCoding: OptionalWrapper where T: ExpressibleByNilLiteral { }

extension DecodingUses: OptionalWrapper where CustomDecoder.DecodedType: ExpressibleByNilLiteral { }
extension EncodingUses: OptionalWrapper where CustomEncoder.OriginalType: ExpressibleByNilLiteral { }
extension CodingUses: OptionalWrapper where CustomCoder.CodingType: ExpressibleByNilLiteral { }


//MARK: expected Emptiable Adherance

extension String: Emptiable {
    public static var empty: Self { "" }
}

extension Int: Emptiable {
    public static var empty: Self { 0 }
}

extension Int16: Emptiable {
    public static var empty: Self { 0 }
}
extension Int32: Emptiable {
    public static var empty: Self { 0 }
}
extension Int64: Emptiable {
    public static var empty: Self { 0 }
}
extension Int8: Emptiable {
    public static var empty: Self { 0 }
}
extension UInt: Emptiable {
    public static var empty: Self { 0 }
}
extension UInt16: Emptiable {
    public static var empty: Self { 0 }
}
extension UInt32: Emptiable {
    public static var empty: Self { 0 }
}
extension UInt64: Emptiable {
    public static var empty: Self { 0 }
}
extension UInt8: Emptiable {
    public static var empty: Self { 0 }
}

extension CGFloat: Emptiable {
    public static var empty: Self { 0 }
}
extension Double: Emptiable {
    public static var empty: Self { 0 }
}
extension Float: Emptiable {
    public static var empty: Self { 0 }
}

extension Float80: Emptiable {
    public static var empty: Self { 0 }
}

#if swift(>=5.3)
extension Float16: Emptiable {
    public static var empty: Self { 0 }
}
#endif


extension Array: Emptiable {
    public static var empty: Self { [] }
}

extension Dictionary: Emptiable {
    public static var empty: Self { [:] }
}

extension Set: Emptiable {
    public static var empty: Self { [] }
}

extension Range: Emptiable where Bound: Emptiable {
    public static var empty: Self { Self.init(uncheckedBounds: (lower: .empty, upper: .empty)) }
}
