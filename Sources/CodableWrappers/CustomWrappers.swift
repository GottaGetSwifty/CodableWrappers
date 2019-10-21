//
//  CustomWrappers.swift
//  
//
//  Created by Paul Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

//MARK: - Non-Conforming Floating Point

//MARK: Float

/// Use the values in `ValueProvider` when encoding this immuitable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingFloatEncoding<ValueProvider: NonConformingDecimalValueProvider> = CustomEncoding<NonConformingFloatCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immuitable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingFloatDecoding<ValueProvider: NonConformingDecimalValueProvider> = CustomDecoding<NonConformingFloatCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immuitable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingFloatCoding<ValueProvider: NonConformingDecimalValueProvider> = CustomCoding<NonConformingFloatCoder<ValueProvider>>

/// Use the values in `ValueProvider` when encoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingFloatEncodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CustomEncodingMutable<NonConformingFloatCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingFloatDecodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CustomDecodingMutable<NonConformingFloatCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingFloatCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CustomCodingMutable<NonConformingFloatCoder<ValueProvider>>

//MARK: Double

/// Use the values in `ValueProvider` when encoding this immuitable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingDoubleEncoding<ValueProvider: NonConformingDecimalValueProvider> = CustomEncoding<NonConformingDoubleCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immuitable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingDoubleDecoding<ValueProvider: NonConformingDecimalValueProvider> = CustomDecoding<NonConformingDoubleCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immuitable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingDoubleCoding<ValueProvider: NonConformingDecimalValueProvider> = CustomCoding<NonConformingDoubleCoder<ValueProvider>>

/// Use the values in `ValueProvider` when encoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingDoubleEncodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CustomEncodingMutable<NonConformingDoubleCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingDoubleDecodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CustomDecodingMutable<NonConformingDoubleCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
typealias NonConformingDoubleCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CustomCodingMutable<NonConformingDoubleCoder<ValueProvider>>

//MARK: - Data

//MARK: Base64

/// Encode this immuitable `Data` Property as a Base64 encoded String
typealias Base64Encoding = CustomEncoding<Base64DataCoder>
/// Decode this immuitable `Data` Property as a Base64 encoded String
typealias Base64Decoding = CustomDecoding<Base64DataCoder>
/// (En/De)code this immuitable `Data` Property as a Base64 encoded String
typealias Base64Coding = CustomCoding<Base64DataCoder>

/// Encode this immuitable `Data` Property as a Base64 encoded String
typealias Base64EncodingMutable = CustomEncodingMutable<Base64DataCoder>
/// Decode this immuitable `Data` Property as a Base64 encoded String
typealias Base64DecodingMutable = CustomDecodingMutable<Base64DataCoder>
/// (En/De)code this immuitable `Data` Property as a Base64 encoded String
typealias Base64CodingMutable = CustomCodingMutable<Base64DataCoder>

//MARK: - Date

//MARK: millisecondsSince1970

/// Encode this immutable `Date` Property using millisecondsSince1970
typealias MillisecondsSince1970DateEncoding = CustomEncoding<MillisecondsSince1970DateCoder>
/// Decode this immutable `Date` Property using millisecondsSince1970
typealias MillisecondsSince1970DateDecoding = CustomDecoding<MillisecondsSince1970DateCoder>
/// (En/De)code this immutable `Date` Property using millisecondsSince1970
typealias MillisecondsSince1970DateCoding = CustomCoding<MillisecondsSince1970DateCoder>

/// Encode this mutable `Date` Property using millisecondsSince1970
typealias MillisecondsSince1970DateEncodingMutable = CustomEncodingMutable<MillisecondsSince1970DateCoder>
/// Decode this mutable `Date` Property using millisecondsSince1970
typealias MillisecondsSince1970DateDecodingMutable = CustomDecodingMutable<MillisecondsSince1970DateCoder>
/// (En/De)code this mutable `Date` Property using millisecondsSince1970
typealias MillisecondsSince1970DateCodingMutable = CustomCodingMutable<MillisecondsSince1970DateCoder>

//MARK: secondsSince1970

/// Encode this immutable `Date` Property using secondsSince1970
typealias SecondsSince1970DateEncoding = CustomEncoding<SecondsSince1970DateCoder>
/// Decode this immutable `Date` Property using secondsSince1970
typealias SecondsSince1970DateDecoding = CustomDecoding<SecondsSince1970DateCoder>
/// (En/De)code this immutable `Date` Property using secondsSince1970
typealias SecondsSince1970DateCoding = CustomCoding<SecondsSince1970DateCoder>

/// Encode this mutable `Date` Property using secondsSince1970
typealias SecondsSince1970DateEncodingMutable = CustomEncodingMutable<SecondsSince1970DateCoder>
/// Decode this mutable `Date` Property using secondsSince1970
typealias SecondsSince1970DateDecodingMutable = CustomDecodingMutable<SecondsSince1970DateCoder>
/// (En/De)code this mutable `Date` Property using secondsSince1970
typealias SecondsSince1970DateCodingMutable = CustomCodingMutable<SecondsSince1970DateCoder>

/// Encode this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateEncoding = CustomEncoding<ISO8601DateCoder>
/// Decode this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateDecoding = CustomDecoding<ISO8601DateCoder>
/// (En/De) this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateCoding = CustomCoding<ISO8601DateCoder>

/// Encode this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateEncodingMutable = CustomEncodingMutable<ISO8601DateCoder>
/// Decode this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateDecodingMutable = CustomDecodingMutable<ISO8601DateCoder>
/// (En/De) this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
typealias ISO8601DateCodingMutable = CustomCodingMutable<ISO8601DateCoder>
