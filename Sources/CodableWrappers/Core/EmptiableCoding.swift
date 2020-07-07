//
//  EmptiableCoding.swift
//  
//
//  Created by Paul Fechner on 7/7/20.
//

import Foundation


//MARK: - Emptiable

/// Contract for providering an empty instance of a Type
public protocol Emptiable {
    /// An empty instance of this Type
    static var empty: Self { get }
}

//MARK: - EmptyFallbackDecodable
public protocol EmptyFallbackDecodable {
    associatedtype FallbackType: Emptiable & Decodable

    init(wrappedValue: FallbackType)
}

extension KeyedDecodingContainer {
    // This is used to override the default decoding behavior for EmptyFallbackDecodable to allow a value to avoid a missing key Error
    public func decode<T>(_ type: T.Type, forKey key: KeyedDecodingContainer<K>.Key) throws -> T where T : Decodable, T: EmptyFallbackDecodable {
        return try decodeIfPresent(T.self, forKey: key) ?? T(wrappedValue: .empty)
    }
}


//MARK: - EmptyFallbackWrappers

/// If `wrappedValue` is nil encodes the `WrappedType.empty` value.
/// - Note: WrappedType must be Optional or encoding is irrelevant. `EmptyFallbackDecoding` is available for decoding-only cases
@propertyWrapper
public struct EmptyFallbackEncoding<WrappedType: Emptiable>: Encodable where WrappedType: Encodable, WrappedType: ExpressibleByNilLiteral {

    public var wrappedValue: WrappedType
    public init(wrappedValue: WrappedType) {
        self.wrappedValue = wrappedValue
    }

    public func encode(to encoder: Encoder) throws {
        // Currently uses Mirror...this should really be avoided, but I'm not sure there's another way to do it cleanly/safely.
        let mirror = Mirror(reflecting: wrappedValue)
        guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
            try WrappedType.empty.encode(to: encoder)
            return
        }
        try wrappedValue.encode(to: encoder)
    }
}

/// If there is no value found when decoding, will initialize with the `WrappedType.empty` value
@propertyWrapper
public struct EmptyFallbackDecoding<WrappedType: Emptiable>: Decodable, EmptyFallbackDecodable where WrappedType: Decodable {
    public typealias FallbackType = WrappedType

    public var wrappedValue: WrappedType
    public init(wrappedValue: WrappedType) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let foundValue = try? WrappedType(from: decoder)
        self.init(wrappedValue: foundValue ?? .empty)
    }
}

/// When decoding and no value is found, will initialize with the `WrappedType.empty` value
/// When encoding if `wrappedValue` is nil, encodes the `WrappedType.empty` value
/// - Note: WrappedType must be Optional or encoding is irrelevant. `EmptyFallbackDecoding` is available for decoding-only cases
@propertyWrapper
public struct EmptyFallbackCoding<WrappedType: Emptiable>: Encodable, EmptyFallbackDecodable where WrappedType: Codable, WrappedType: ExpressibleByNilLiteral {

    public var wrappedValue: WrappedType
    public init(wrappedValue: WrappedType) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let foundValue = try? WrappedType(from: decoder)
        self.init(wrappedValue: foundValue ?? .empty)
    }

    public func encode(to encoder: Encoder) throws {
        // Currently uses Mirror...this should really be avoided, but I'm not sure there's another way to do it cleanly/safely.
        let mirror = Mirror(reflecting: wrappedValue)
        guard mirror.displayStyle != .optional || !mirror.children.isEmpty else {
            try WrappedType.empty.encode(to: encoder)
            return
        }
        try wrappedValue.encode(to: encoder)
    }
}

//MARK: Enable Customizing one direction

/// Ensures there isn't an extra level added
extension EmptyFallbackEncoding: Decodable, TransientDecodable where WrappedType: Decodable { }
/// Ensures there isn't an extra level added
extension EmptyFallbackDecoding: Encodable, TransientEncodable where WrappedType: Encodable { }

//MARK: - Conditional Equatable Conformance

extension EmptyFallbackEncoding: Equatable where WrappedType: Equatable {}
extension EmptyFallbackDecoding: Equatable where WrappedType: Equatable {}
extension EmptyFallbackCoding: Equatable where WrappedType: Equatable {}

//protocol DefaultValueProvider {
//    associatedtype ValueType
//    static var defaultValue: ValueType { get }
//}
//
//protocol EmptyValueProvider: DefaultValueProvider { }
//
//extension EmptyValueProvider where ValueType == String {
//    static var defaultValue: ValueType { "" }
//}
//
//struct EmptyValue<T, Provider: EmptyValueProvider>  where Provider.ValueType == T {
//
//
//}
//
//struct Wrap<T> {
//    var wrappedValue: T
//
//    func test() {
//        EmptyValue<T>.Provider.defaultValue
//    }
//}
