//
//  CustomWrappers.swift
//  
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

// MARK: - Non-Conforming Floating Point

// MARK: Float

/// Use the values in `ValueProvider` when encoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatEncoding<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatDecoding<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingFloatStaticCoder<ValueProvider>>

// MARK: Double

/// Use the values in `ValueProvider` when encoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleEncoding<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleDecoding<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingDoubleStaticCoder<ValueProvider>>

// MARK: - Data

// MARK: Base64

/// Encode this immutable `Data` Property as a Base64 encoded String
public typealias Base64Encoding = EncodingUses<Base64DataStaticCoder>
/// Decode this immutable `Data` Property as a Base64 encoded String
public typealias Base64Decoding = DecodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Property as a Base64 encoded String
public typealias Base64Coding = CodingUses<Base64DataStaticCoder>

// MARK: - Date

// MARK: millisecondsSince1970

/// Encode this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateEncoding = EncodingUses<MillisecondsSince1970DateStaticCoder>
/// Decode this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateDecoding = DecodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateCoding = CodingUses<MillisecondsSince1970DateStaticCoder>

// MARK: secondsSince1970

/// Encode this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateEncoding = EncodingUses<SecondsSince1970DateStaticCoder>
/// Decode this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateDecoding = DecodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateCoding = CodingUses<SecondsSince1970DateStaticCoder>

// MARK: ISO8601 Date

/// Encode this immutable `Date` Property using `Date.ISO8601FormatStyle`
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601Encoding = EncodingUses<ISO8601StaticCoder>
/// Decode this immutable `Date` Property using `Date.ISO8601FormatStyle`
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601Decoding = DecodingUses<ISO8601StaticCoder>
/// (En/De) this immutable `Date` Property using `Date.ISO8601FormatStyle`
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601Coding = CodingUses<ISO8601StaticCoder>

// MARK: CustomISO8601DateFormat

/// Encode this immutable `Date` Property using the passed formatter
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601DateFormatStyleEncoding<CustomEncoder: ISO8601DateFormatStyleStaticEncoder> = EncodingUses<CustomEncoder>
/// Decode this immutable `Date` Property using the passed formatter
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601DateFormatStyleDecoding<CustomDecoder: ISO8601DateFormatStyleStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this immutable `Date` Property using the passed formatter
@available(swift, introduced: 5.4) @available(macOS, introduced: 12)
@available(iOS, introduced: 15.0) @available(tvOS, introduced: 15.0)
@available(watchOS, introduced: 8.0)
public typealias ISO8601DateFormatStyleCoding<CustomCoder: ISO8601DateFormatStyleStaticCoder> = CodingUses<CustomCoder>

// MARK: Custom DateFormatter

/// Encode this immutable `Date` Property using the passed formatter
public typealias DateFormatterEncoding<CustomEncoder: DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>
/// Decode this immutable `Date` Property using the passed formatter
public typealias DateFormatterDecoding<CustomDecoder: DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this immutable `Date` Property using the passed formatter
public typealias DateFormatterCoding<CustomCoder: DateFormatterStaticCoder> = CodingUses<CustomCoder>

// MARK: - Bool

// MARK: NonConformingBool

/// Encode this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolEncoding<ValueProvider: NonConformingBoolValueProvider> = EncodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// Decode this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolDecoding<ValueProvider: NonConformingBoolValueProvider> = DecodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolCoding<ValueProvider: NonConformingBoolValueProvider> = CodingUses<NonConformingBoolStaticCoder<ValueProvider>>

// MARK: BoolAsInteger

/// Convenience typealias
public typealias BoolAsIntegerStaticCoder<ValueType: FixedWidthInteger & Codable> = NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<ValueType>>

/// Encode this immutable `Bool` Property as the passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerEncoding<ValueType: FixedWidthInteger & Codable> = EncodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// Decode this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolFromIntegerDecoding<ValueType: FixedWidthInteger & Codable> = DecodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerCoding<ValueType: FixedWidthInteger & Codable> = CodingUses<BoolAsIntegerStaticCoder<ValueType>>

// MARK: BoolAsInt

/// Encode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntEncoding = BoolAsIntegerEncoding<Int>
/// Decode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolFromIntDecoding = BoolFromIntegerDecoding<Int>
/// (En/De)code this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntCoding = BoolAsIntegerCoding<Int>

/// Convenience typealias
public typealias BoolAsStringStaticCoder = NonConformingBoolStaticCoder<BoolAsStringValueProvider>

/// Encode this immutable `Bool` Property as a String using "true" for true and "false" for false
public typealias BoolAsStringEncoding = EncodingUses<BoolAsStringStaticCoder>
/// Decode this immutable `Bool` Property as a String using "true" for true and "false" for false
public typealias BoolFromStringDecoding = DecodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Property a String using "true" for true and "false" for false
public typealias BoolAsStringCoding = CodingUses<BoolAsStringStaticCoder>

// MARK: NilFiltering

/// Filters any nil values when decoding
public typealias LossyArrayDecoding<T: Decodable> = DecodingUses<ArrayNilFilteringStaticDecoder<T>>

/// Filters any nil values when decoding
public typealias LossySetDecoding<T: Decodable & Hashable> = DecodingUses<SetNilFilteringStaticDecoder<T>>

/// Filters any nil values when decoding
public typealias LossyDictionaryDecoding<T: Decodable, Key: Decodable & Hashable> = DecodingUses<DictionaryNilFilteringStaticDecoder<T, Key>>

// MARK: NullEncoding

/// Encodes a nil value in a singleValueContainer using `encodeNil` rather than it being omitted.
public typealias EncodeNulls<T: Encodable & ExpressibleByNilLiteral> = EncodingUses<NullStaticEncoder<T>>
