//
//  EmptiableCoding.swift
//  
//
//  Created by Paul Fechner on 7/7/20.
//

import Foundation

/// Contract for a Type that provides a default value of a Type
public protocol DefaultValueProvider {
    associatedtype ValueType
    static var defaultValue: ValueType { get }
}

/// Protocol for a fallback wrapper to allow overriding the default `KeyedDecodingContainer` behavior to properly handle nils
public protocol EmptyFallbackDecodableWrapper: Decodable where ValueProvider.ValueType: Decodable {
    associatedtype ValueProvider: DefaultValueProvider
    init(wrappedValue: ValueProvider.ValueType)
}

extension KeyedDecodingContainer {
    // This is used to override the default decoding behavior for `EmptyFallbackDecodableWrapper` to allow a value to avoid a missing key Error
    public func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T: EmptyFallbackDecodableWrapper {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: T.ValueProvider.defaultValue)
    }
}

//MARK: - FallbackWrappers

/// If `wrappedValue` is nil encodes the `ValueProvider.defaultValue` value.
/// - Note: WrappedType must be Optional or encoding is irrelevant. `FallbackDecoding` is available for decoding-only cases
@propertyWrapper
public struct FallbackEncoding<ValueProvider: DefaultValueProvider>: Encodable where ValueProvider.ValueType: Encodable {

    public var wrappedValue: ValueProvider.ValueType?

    public init(wrappedValue: ValueProvider.ValueType?) {
        self.wrappedValue = wrappedValue
    }

    public func encode(to encoder: Encoder) throws {

        guard let wrappedValue = wrappedValue else {
            try ValueProvider.defaultValue.encode(to: encoder)
            return
        }
        try wrappedValue.encode(to: encoder)
    }
}


/// If a value is not found while decoding, will be initialized with the `ValueProvider.defaultValue` value.
@propertyWrapper
public struct FallbackDecoding<ValueProvider: DefaultValueProvider>: EmptyFallbackDecodableWrapper where ValueProvider.ValueType: Decodable {

    public var wrappedValue: ValueProvider.ValueType

    public init(wrappedValue: ValueProvider.ValueType) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let foundValue = try? ValueProvider.ValueType(from: decoder)
        self.init(wrappedValue: foundValue ?? ValueProvider.defaultValue)
    }
}

/// Encoding: If `wrappedValue` is nil encodes the `ValueProvider.defaultValue` value.
/// Decoding: If a value is not found, will be initialized with the `ValueProvider.defaultValue` value.
/// - Note: WrappedType must be Optional or encoding is irrelevant. `FallbackDecoding` is available for decoding-only cases
@propertyWrapper
public struct FallbackCoding<ValueProvider: DefaultValueProvider>: EmptyFallbackDecodableWrapper, Codable where ValueProvider.ValueType: Codable {

    public var wrappedValue: ValueProvider.ValueType?

    public init(wrappedValue: ValueProvider.ValueType?) {
        self.wrappedValue = wrappedValue
    }

    // Need this in order to work with `EmptyFallbackDecodableWrapper`
    public init(wrappedValue: ValueProvider.ValueType) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let foundValue = try? ValueProvider.ValueType(from: decoder)
        self.init(wrappedValue: foundValue ?? ValueProvider.defaultValue)
    }

    public func encode(to encoder: Encoder) throws {

        guard let wrappedValue = wrappedValue else {
            try ValueProvider.defaultValue.encode(to: encoder)
            return
        }
        try wrappedValue.encode(to: encoder)
    }
}


//MARK: Enable Customizing one direction


/// Ensures there isn't an extra level added
extension FallbackEncoding: Decodable, TransientDecodable where ValueProvider.ValueType: Decodable { }
/// Ensures there isn't an extra level added
extension FallbackDecoding: Encodable, TransientEncodable where ValueProvider.ValueType: Encodable { }


//MARK: Conditional Equatable Conformance


extension FallbackEncoding: Equatable where ValueProvider.ValueType: Equatable {}
extension FallbackDecoding: Equatable where ValueProvider.ValueType: Equatable {}
extension FallbackCoding: Equatable where ValueProvider.ValueType: Equatable {}

// MARK: - Convenience Defaults

public struct EmptyString: DefaultValueProvider {
    public static var defaultValue: String { "" }
}

public struct EmptyInt: DefaultValueProvider {
    public static var defaultValue: Int { 0 }
}
public struct EmptyInt16: DefaultValueProvider {
    public static var defaultValue: Int16 { 0 }
}
public struct EmptyInt32: DefaultValueProvider {
    public static var defaultValue: Int32 { 0 }
}
public struct EmptyInt64: DefaultValueProvider {
    public static var defaultValue: Int64 { 0 }
}
public struct EmptyInt8: DefaultValueProvider {
    public static var defaultValue: Int8 { 0 }
}
public struct EmptyUInt: DefaultValueProvider {
    public static var defaultValue: UInt { 0 }
}
public struct EmptyUInt16: DefaultValueProvider {
    public static var defaultValue: UInt16 { 0 }
}
public struct EmptyUInt32: DefaultValueProvider {
    public static var defaultValue: UInt32 { 0 }
}
public struct EmptyUInt64: DefaultValueProvider {
    public static var defaultValue: UInt64 { 0 }
}
public struct EmptyUInt8: DefaultValueProvider {
    public static var defaultValue: UInt8 { 0 }
}

public struct EmptyCGFloat: DefaultValueProvider {
    public static var defaultValue: CGFloat { 0 }
}
public struct EmptyDouble: DefaultValueProvider {
    public static var defaultValue: Double { 0 }
}
public struct EmptyFloat: DefaultValueProvider {
    public static var defaultValue: Float { 0 }
}
#if swift(>=5.3)
public struct EmptyFloat16: DefaultValueProvider {
    public static var defaultValue: Float16 { 0 }
}
#endif
public struct EmptyFloat80: DefaultValueProvider {
    public static var defaultValue: Float80 { 0 }
}


public struct EmptyArray<T>: DefaultValueProvider {
    public static var defaultValue: Array<T> { [] }
}
public struct EmptyDictionary<Key: Hashable, Value>: DefaultValueProvider {
    public static var defaultValue: Dictionary<Key, Value> { [:] }
}
public struct EmptySet<T: Hashable>: DefaultValueProvider {
    public static var defaultValue: Set<T> { [] }
}


