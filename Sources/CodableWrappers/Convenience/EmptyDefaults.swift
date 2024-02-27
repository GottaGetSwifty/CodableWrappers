//
//  EmptyDefaults.swift
//  
//
//  Created by PJ Fechner on 7/10/20.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

// MARK: - Convenience Defaults

/// Empty FallbackValueProvider for Bool: false
///  typealias for ``BoolFalse``
public typealias EmptyBool = BoolFalse

/// Empty FallbackValueProvider for Bool: false
public struct BoolFalse: FallbackValueProvider {
    public static var defaultValue: Bool { false }
}

/// Empty FallbackValueProvider for Bool: true
public struct BoolTrue: FallbackValueProvider {
    public static var defaultValue: Bool { true }
}

/// Empty FallbackValueProvider for String: ""
public struct EmptyString: FallbackValueProvider {
    public static var defaultValue: String { "" }
}

/// Empty FallbackValueProvider for Int: 0
public struct EmptyInt: FallbackValueProvider {
    public static var defaultValue: Int { 0 }
}
/// Empty FallbackValueProvider for Int16: 0
public struct EmptyInt16: FallbackValueProvider {
    public static var defaultValue: Int16 { 0 }
}
/// Empty FallbackValueProvider for Int32: 0
public struct EmptyInt32: FallbackValueProvider {
    public static var defaultValue: Int32 { 0 }
}
/// Empty FallbackValueProvider for Int64: 0
public struct EmptyInt64: FallbackValueProvider {
    public static var defaultValue: Int64 { 0 }
}
/// Empty FallbackValueProvider for Int8: 0
public struct EmptyInt8: FallbackValueProvider {
    public static var defaultValue: Int8 { 0 }
}
/// Empty FallbackValueProvider for UInt: 0
public struct EmptyUInt: FallbackValueProvider {
    public static var defaultValue: UInt { 0 }
}
/// Empty FallbackValueProvider for UInt16: 0
public struct EmptyUInt16: FallbackValueProvider {
    public static var defaultValue: UInt16 { 0 }
}
/// Empty FallbackValueProvider for UInt32: 0
public struct EmptyUInt32: FallbackValueProvider {
    public static var defaultValue: UInt32 { 0 }
}
/// Empty FallbackValueProvider for UInt64: 0
public struct EmptyUInt64: FallbackValueProvider {
    public static var defaultValue: UInt64 { 0 }
}
/// Empty FallbackValueProvider for UInt8: 0
public struct EmptyUInt8: FallbackValueProvider {
    public static var defaultValue: UInt8 { 0 }
}

/// Empty FallbackValueProvider for CGFloat: 0
@available(iOS 1, watchOS 1, tvOS 1, macCatalyst 14.0, *)
public struct EmptyCGFloat: FallbackValueProvider {
    public static var defaultValue: CGFloat { 0 }
}

/// Empty FallbackValueProvider for Double: 0
public struct EmptyDouble: FallbackValueProvider {
    public static var defaultValue: Double { 0 }
}
/// Empty FallbackValueProvider for Float: 0
public struct EmptyFloat: FallbackValueProvider {
    public static var defaultValue: Float { 0 }
}

// Float16 is only available on ARM
#if swift(>=5.4) && !((os(macOS) || targetEnvironment(macCatalyst)) && arch(x86_64))
/// Empty FallbackValueProvider for Float16: 0
@available(macOS 11.0, iOS 14.0, watchOS 7.0, tvOS 14.0, *)
public struct EmptyFloat16: FallbackValueProvider {
    public static var defaultValue: Float16 { 0 }
}
#endif

/// Empty FallbackValueProvider for Array: []
public struct EmptyArray<T>: FallbackValueProvider {
    public static var defaultValue: [T] { [] }
}
/// Empty FallbackValueProvider for Dictionary: [:]
public struct EmptyDictionary<Key: Hashable, Value>: FallbackValueProvider {
    public static var defaultValue: [Key: Value] { [:] }
}
/// Empty FallbackValueProvider for Set: []
public struct EmptySet<T: Hashable>: FallbackValueProvider {
    public static var defaultValue: Set<T> { [] }
}
