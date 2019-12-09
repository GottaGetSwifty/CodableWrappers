//
//  CustomWrappers.swift
//  
//
//  Created by Paul Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

//MARK: - Non-Conforming Floating Point

//MARK: Float

/// Use the values in `ValueProvider` when encoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatEncoding<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatDecoding<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatOptionalCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<OptionalNonConformingFloatStaticCoder<ValueProvider>>

/// Use the values in `ValueProvider` when encoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatEncodingMutable<ValueProvider: NonConformingDecimalValueProvider> = EncodingUsesMutable<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatDecodingMutable<ValueProvider: NonConformingDecimalValueProvider> = DecodingUsesMutable<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CodingUsesMutable<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingFloatOptionalCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CodingUsesMutable<OptionalNonConformingFloatStaticCoder<ValueProvider>>

//MARK: Double

/// Use the values in `ValueProvider` when encoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleEncoding<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleDecoding<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleOptionalCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<OptionalNonConformingDoubleStaticCoder<ValueProvider>>

/// Use the values in `ValueProvider` when encoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleEncodingMutable<ValueProvider: NonConformingDecimalValueProvider> = EncodingUsesMutable<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleDecodingMutable<ValueProvider: NonConformingDecimalValueProvider> = DecodingUsesMutable<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CodingUsesMutable<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleOptionalCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CodingUsesMutable<OptionalNonConformingDoubleStaticCoder<ValueProvider>>

//MARK: - Data

//MARK: Base64

/// Encode this immutable `Data` Property as a Base64 encoded String
public typealias Base64Encoding = EncodingUses<Base64DataStaticCoder>
/// Decode this immutable `Data` Property as a Base64 encoded String
public typealias Base64Decoding = DecodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Property as a Base64 encoded String
public typealias Base64Coding = CodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Optional Property as a Base64 encoded String
public typealias Base64OptionalCoding = CodingUses<OptionalBase64DataStaticCoder>

/// Encode this immutable `Data` Property as a Base64 encoded String
public typealias Base64EncodingMutable = EncodingUsesMutable<Base64DataStaticCoder>
/// Decode this immutable `Data` Property as a Base64 encoded String
public typealias Base64DecodingMutable = DecodingUsesMutable<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Property as a Base64 encoded String
public typealias Base64CodingMutable = CodingUsesMutable<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Optional Property as a Base64 encoded String
public typealias Base64OptionalCodingMutable = CodingUsesMutable<OptionalBase64DataStaticCoder>

//MARK: - Date

//MARK: millisecondsSince1970

/// Encode this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateEncoding = EncodingUses<MillisecondsSince1970DateStaticCoder>
/// Decode this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateDecoding = DecodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateCoding = CodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Optional Property using millisecondsSince1970
public typealias MillisecondsSince1970DateOptionalCoding = CodingUses<OptionalMillisecondsSince1970DateStaticCoder>


/// Encode this mutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateEncodingMutable = EncodingUsesMutable<MillisecondsSince1970DateStaticCoder>
/// Decode this mutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateDecodingMutable = DecodingUsesMutable<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateCodingMutable = CodingUsesMutable<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Optional Property using millisecondsSince1970
public typealias MillisecondsSince1970DateOptionalCodingMutable = CodingUsesMutable<OptionalMillisecondsSince1970DateStaticCoder>

//MARK: secondsSince1970

/// Encode this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateEncoding = EncodingUses<SecondsSince1970DateStaticCoder>
/// Decode this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateDecoding = DecodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateCoding = CodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Optional Property using secondsSince1970
public typealias SecondsSince1970DateOptionalCoding = CodingUses<OptionalSecondsSince1970DateStaticCoder>

/// Encode this mutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateEncodingMutable = EncodingUsesMutable<SecondsSince1970DateStaticCoder>
/// Decode this mutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateDecodingMutable = DecodingUsesMutable<SecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateCodingMutable = CodingUsesMutable<SecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Optional Property using secondsSince1970
public typealias SecondsSince1970DateOptionalCodingMutable = CodingUsesMutable<OptionalSecondsSince1970DateStaticCoder>

//MARK: ISO8601Date

/// Encode this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateEncoding = EncodingUses<ISO8601DateStaticCoder>
/// Decode this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateDecoding = DecodingUses<ISO8601DateStaticCoder>
/// (En/De) this immutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateCoding = CodingUses<ISO8601DateStaticCoder>
/// (En/De) this immutable `Date` Optional Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateOptionalCoding = CodingUses<OptionalISO8601DateStaticCoder>

/// Encode this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateEncodingMutable = EncodingUsesMutable<ISO8601DateStaticCoder>
/// Decode this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateDecodingMutable = DecodingUsesMutable<ISO8601DateStaticCoder>
/// (En/De) this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateCodingMutable = CodingUsesMutable<ISO8601DateStaticCoder>
/// (En/De) this mutable `Date` Optional Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateOptionalCodingMutable = CodingUsesMutable<OptionalISO8601DateStaticCoder>

//MARK: CustomISO8601Date

/// Encode this immutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterEncoding<CustomEncoder: ISO8601DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
/// Decode this immutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterDecoding<CustomDecoder: ISO8601DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this immutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterCoding<CustomCoder: ISO8601DateFormatterStaticCoder> = CodingUses<CustomCoder>
/// (En/De)code this immutable `Date` Optional Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterOptionalCoding<CustomCoder: ISO8601DateFormatterStaticCoder> = CodingUses<OptionalStaticCoder<CustomCoder>>

/// Encode this mutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterEncodingMutable<CustomEncoder: ISO8601DateFormatterStaticEncoder> = EncodingUsesMutable<CustomEncoder>
/// Decode this mutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterDecodingMutable<CustomDecoder: ISO8601DateFormatterStaticDecoder> = DecodingUsesMutable<CustomDecoder>
/// (En/De)code this mutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterCodingMutable<CustomCoder: ISO8601DateFormatterStaticCoder> = CodingUsesMutable<CustomCoder>
/// (En/De)code this mutable `Date` Optional Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
public typealias ISO8601DateFormatterOptionalCodingMutable<CustomCoder: ISO8601DateFormatterStaticCoder> = CodingUsesMutable<OptionalStaticCoder<CustomCoder>>

//MARK: DateFormatter

/// Encode this immutable `Date` Property using the passed formatter
public typealias DateFormatterEncoding<CustomEncoder: DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>
/// Decode this immutable `Date` Property using the passed formatter
public typealias DateFormatterDecoding<CustomDecoder: DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this immutable `Date` Property using the passed formatter
public typealias DateFormatterCoding<CustomCoder: DateFormatterStaticCoder> = CodingUses<CustomCoder>
/// (En/De)code this immutable `Date` Optional Property using the passed formatter
public typealias DateFormatterOptionalCoding<CustomCoder: DateFormatterStaticCoder> = CodingUses<OptionalStaticCoder<CustomCoder>>

/// Encode this mutable `Date` Property using the passed formatter
public typealias DateFormatterEncodingMutable<CustomEncoder: DateFormatterStaticEncoder> = EncodingUsesMutable<CustomEncoder>
/// Decode this mutable `Date` Property using the passed formatter
public typealias DateFormatterDecodingMutable<CustomDecoder: DateFormatterStaticDecoder> = DecodingUsesMutable<CustomDecoder>
/// (En/De)code this mutable `Date` Property using the passed formatter
public typealias DateFormatterCodingMutable<CustomCoder: DateFormatterStaticCoder> = CodingUsesMutable<CustomCoder>
/// (En/De)code this mutable `Date` Optional Property using the passed formatter
public typealias DateFormatterOptionalCodingMutable<CustomCoder: DateFormatterStaticCoder> = CodingUsesMutable<OptionalStaticCoder<CustomCoder>>

//MARK: - Bool

//MARK: NonConformingBool

/// Encode this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolEncoding<ValueProvider: NonConformingBoolValueProvider> = EncodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// Decode this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolDecoding<ValueProvider: NonConformingBoolValueProvider> = DecodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolCoding<ValueProvider: NonConformingBoolValueProvider> = CodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolOptionalCoding<ValueProvider: NonConformingBoolValueProvider> = CodingUses<OptionalNonConformingBoolStaticCoder<ValueProvider>>

/// Encode this mutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolEncodingMutable<ValueProvider: NonConformingBoolValueProvider> = EncodingUsesMutable<NonConformingBoolStaticCoder<ValueProvider>>
/// Decode this mutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolDecodingMutable<ValueProvider: NonConformingBoolValueProvider> = DecodingUsesMutable<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this mutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolCodingMutable<ValueProvider: NonConformingBoolValueProvider> = CodingUsesMutable<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this mutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolOptionalCodingMutable<ValueProvider: NonConformingBoolValueProvider> = CodingUsesMutable<OptionalNonConformingBoolStaticCoder<ValueProvider>>

//MARK: BoolAsInteger

/// Convenience typealias
public typealias BoolAsIntegerStaticCoder<ValueType: FixedWidthInteger & Codable> = NonConformingBoolStaticCoder<BoolAsIntegerValueProvider<ValueType>>

/// Encode this immutable `Bool` Property as the passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerEncoding<ValueType: FixedWidthInteger & Codable> = EncodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// Decode this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolFromIntegerDecoding<ValueType: FixedWidthInteger & Codable> = DecodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerCoding<ValueType: FixedWidthInteger & Codable> = CodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Optional Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerOptionalCoding<ValueType: FixedWidthInteger & Codable> = CodingUses<OptionalNonConformingBoolStaticCoder<BoolAsIntegerValueProvider<ValueType>>>

/// Encode this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerEncodingMutable<ValueType: FixedWidthInteger & Codable> = EncodingUsesMutable<BoolAsIntegerStaticCoder<ValueType>>
/// Decode this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolFromIntegerDecodingMutable<ValueType: FixedWidthInteger & Codable> = DecodingUsesMutable<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerCodingMutable<ValueType: FixedWidthInteger & Codable> = CodingUsesMutable<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Optional Property as passed Integer Type using 1 as true and 0 as false
public typealias BoolAsIntegerOptionalCodingMutable<ValueType: FixedWidthInteger & Codable> = CodingUsesMutable<OptionalNonConformingBoolStaticCoder<BoolAsIntegerValueProvider<ValueType>>>


//MARK: BoolAsInt

/// Encode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntEncoding = BoolAsIntegerEncoding<Int>
/// Decode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolFromIntDecoding = BoolFromIntegerDecoding<Int>
/// (En/De)code this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntCoding = BoolAsIntegerCoding<Int>
/// (En/De)code this immutable `Bool` Optional Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntOptionalCoding = BoolAsIntegerOptionalCodingMutable<Int>

/// Encode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntEncodingMutable = BoolAsIntegerEncodingMutable<Int>
/// Decode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolFromIntDecodingMutable = BoolFromIntegerDecodingMutable<Int>
/// (En/De)code this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntCodingMutable = BoolAsIntegerCodingMutable<Int>
/// (En/De)code this immutable `Bool` Optional Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntOptionalCodingMutable = BoolAsIntegerOptionalCodingMutable<Int>

//MARK: BoolAsString

/// Convenience typealias
public typealias BoolAsStringStaticCoder = NonConformingBoolStaticCoder<BoolAsStringValueProvider>

/// Encode this immutable `Bool` Property as a String using "true" for true and "false" for false
public typealias BoolAsStringEncoding = EncodingUses<BoolAsStringStaticCoder>
/// Decode this immutable `Bool` Property as a String using "true" for true and "false" for false
public typealias BoolFromStringDecoding = DecodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Property a String using "true" for true and "false" for false
public typealias BoolAsStringCoding = CodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Optional Property a String using "true" for true and "false" for false
public typealias BoolAsStringOptionalCoding = CodingUses<OptionalNonConformingBoolStaticCoder<BoolAsStringValueProvider>>

/// Encode this immutable `Bool` Property a String using "true" for true and "false" for false
public typealias BoolAsStringEncodingMutable = EncodingUsesMutable<BoolAsStringStaticCoder>
/// Decode this immutable `Bool` Property a String using "true" for true and "false" for false
public typealias BoolFromStringDecodingMutable = DecodingUsesMutable<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Property a String using "true" for true and "false" for false
public typealias BoolAsStringCodingMutable = CodingUsesMutable<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Optional Property a String using "true" for true and "false" for false
public typealias BoolAsStringOptionalCodingMutable = CodingUsesMutable<OptionalNonConformingBoolStaticCoder<BoolAsStringValueProvider>>
