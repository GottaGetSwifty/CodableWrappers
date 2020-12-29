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

/// Empty DefaultValueProvider for String: ""
public struct EmptyString: DefaultValueProvider {
    public static var defaultValue: String { "" }
}

/// Empty DefaultValueProvider for Int: 0
public struct EmptyInt: DefaultValueProvider {
    public static var defaultValue: Int { 0 }
}
/// Empty DefaultValueProvider for Int16: 0
public struct EmptyInt16: DefaultValueProvider {
    public static var defaultValue: Int16 { 0 }
}
/// Empty DefaultValueProvider for Int32: 0
public struct EmptyInt32: DefaultValueProvider {
    public static var defaultValue: Int32 { 0 }
}
/// Empty DefaultValueProvider for Int64: 0
public struct EmptyInt64: DefaultValueProvider {
    public static var defaultValue: Int64 { 0 }
}
/// Empty DefaultValueProvider for Int8: 0
public struct EmptyInt8: DefaultValueProvider {
    public static var defaultValue: Int8 { 0 }
}
/// Empty DefaultValueProvider for UInt: 0
public struct EmptyUInt: DefaultValueProvider {
    public static var defaultValue: UInt { 0 }
}
/// Empty DefaultValueProvider for UInt16: 0
public struct EmptyUInt16: DefaultValueProvider {
    public static var defaultValue: UInt16 { 0 }
}
/// Empty DefaultValueProvider for UInt32: 0
public struct EmptyUInt32: DefaultValueProvider {
    public static var defaultValue: UInt32 { 0 }
}
/// Empty DefaultValueProvider for UInt64: 0
public struct EmptyUInt64: DefaultValueProvider {
    public static var defaultValue: UInt64 { 0 }
}
/// Empty DefaultValueProvider for UInt8: 0
public struct EmptyUInt8: DefaultValueProvider {
    public static var defaultValue: UInt8 { 0 }
}

#if canImport(UIKit)

/// Empty DefaultValueProvider for CGFloat: 0
public struct EmptyCGFloat: DefaultValueProvider {
    public static var defaultValue: CGFloat { 0 }
}
#endif

/// Empty DefaultValueProvider for Double: 0
public struct EmptyDouble: DefaultValueProvider {
    public static var defaultValue: Double { 0 }
}
/// Empty DefaultValueProvider for Float: 0
public struct EmptyFloat: DefaultValueProvider {
    public static var defaultValue: Float { 0 }
}

#if swift(>=5.3) && !os(macOS)
/// Empty DefaultValueProvider for Float16: 0
@available(iOS, introduced: 14)
public struct EmptyFloat16: DefaultValueProvider {
    public static var defaultValue: Float16 { 0 }
}
#endif

/// Empty DefaultValueProvider for Array: []
public struct EmptyArray<T>: DefaultValueProvider {
    public static var defaultValue: Array<T> { [] }
}
/// Empty DefaultValueProvider for Dictionary: [:]
public struct EmptyDictionary<Key: Hashable, Value>: DefaultValueProvider {
    public static var defaultValue: Dictionary<Key, Value> { [:] }
}
/// Empty DefaultValueProvider for Set: []
public struct EmptySet<T: Hashable>: DefaultValueProvider {
    public static var defaultValue: Set<T> { [] }
}


