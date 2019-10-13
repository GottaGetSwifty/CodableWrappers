//
//  CustomWrappers.swift
//  
//
//  Created by Paul Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

@propertyWrapper struct NilCodable<T: Codable>: Codable {
    public var wrappedValue: T?
    public init(wrappedValue: T?) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        wrappedValue = nil
    }

    public func encode(to encoder: Encoder) throws {
        return
    }
}
typealias NonConformingFloatEncoding<T: NonConformingFloatValueProvider> = CustomEncoding<NonConformingFloatEncoder<T>>
typealias NonConformingFloatDecoding<T: NonConformingFloatValueProvider> = CustomDecoding<NonConformingFloatDecoder<T>>
typealias NonConformingFloatCoding<T: NonConformingFloatValueProvider> = CustomCoding<NonConformingFloatCoder<T>>

typealias NonConformingDoubleEncoding<T: NonConformingFloatValueProvider> = CustomEncoding<NonConformingDoubleEncoder<T>>
typealias NonConformingDoubleDecoding<T: NonConformingFloatValueProvider> = CustomDecoding<NonConformingDoubleDecoder<T>>
typealias NonConformingDoubleCoding<T: NonConformingFloatValueProvider> = CustomCoding<NonConformingDoubleCoder<T>>


typealias Base64Encoding = CustomEncoding<Base64DataEncoder>
typealias Base64Decoding = CustomDecoding<Base64DataDecoder>
typealias Base64Coding = CustomCoding<Base64DataCoder>


typealias MillisecondsSince1970DateEncoding = CustomEncoding<MillisecondsSince1970DateEncoder>
typealias MillisecondsSince1970DateDecoding = CustomDecoding<MillisecondsSince1970DateDecoder>
typealias MillisecondsSince1970DateCoding = CustomCoding<MillisecondsSince1970DateCoder>

typealias SecondsSince1970DateEncoding = CustomEncoding<SecondsSince1970DateEncoder>
typealias SecondsSince1970DateDecoding = CustomDecoding<SecondsSince1970DateDecoder>
typealias SecondsSince1970DateCoding = CustomCoding<SecondsSince1970DateCoder>

@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateEncoding = CustomEncoding<ISO8601DateEncoder>
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateDecoding = CustomDecoding<ISO8601DateDecoder>
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateCoding = CustomCoding<ISO8601DateCoder>
