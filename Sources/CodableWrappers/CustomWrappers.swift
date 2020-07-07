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
@available(*, deprecated, message: "Use `OptionalCoding<NonConformingFloatEncoding>` instead")
public typealias NonConformingFloatOptionalCoding<ValueProvider: NonConformingDecimalValueProvider> = OptionalCoding<NonConformingFloatCoding<ValueProvider>>

/// Use the values in `ValueProvider` when encoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, renamed: "NonConformingFloatEncoding")
public typealias NonConformingFloatEncodingMutable<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, renamed: "NonConformingFloatDecoding")
public typealias NonConformingFloatDecodingMutable<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, renamed: "NonConformingFloatCoding")
public typealias NonConformingFloatCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingFloatStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, message: "Use `OptionalCoding<NonConformingFloatCoding<ValueProvider>>` instead")
public typealias NonConformingFloatOptionalCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = OptionalCoding<NonConformingFloatCoding<ValueProvider>>

//MARK: Double

/// Use the values in `ValueProvider` when encoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleEncoding<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleDecoding<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
public typealias NonConformingDoubleCoding<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this immutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, message: "Use `OptionalCoding<NonConformingDoubleCoding<ValueProvider>>` instead")
public typealias NonConformingDoubleOptionalCoding<ValueProvider: NonConformingDecimalValueProvider> = OptionalCoding<NonConformingDoubleCoding<ValueProvider>>

/// Use the values in `ValueProvider` when encoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, renamed: "NonConformingDoubleEncoding")
public typealias NonConformingDoubleEncodingMutable<ValueProvider: NonConformingDecimalValueProvider> = EncodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when decoding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, renamed: "NonConformingDoubleDecoding")
public typealias NonConformingDoubleDecodingMutable<ValueProvider: NonConformingDecimalValueProvider> = DecodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, renamed: "NonConformingDoubleCoding")
public typealias NonConformingDoubleCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = CodingUses<NonConformingDoubleStaticCoder<ValueProvider>>
/// Use the values in `ValueProvider` when (en/de)coding this mutable Optional Property with non-conforming numbers, also known as IEEE 754 exceptional values.
@available(*, deprecated, message: "Use `OptionalCoding<NonConformingDoubleCoding<ValueProvider>>` instead")
public typealias NonConformingDoubleOptionalCodingMutable<ValueProvider: NonConformingDecimalValueProvider> = OptionalCoding<NonConformingDoubleCoding<ValueProvider>>

//MARK: - Data

//MARK: Base64

/// Encode this immutable `Data` Property as a Base64 encoded String
public typealias Base64Encoding = EncodingUses<Base64DataStaticCoder>
/// Decode this immutable `Data` Property as a Base64 encoded String
public typealias Base64Decoding = DecodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Property as a Base64 encoded String
public typealias Base64Coding = CodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Optional Property as a Base64 encoded String
@available(*, deprecated, message: "Use `OptionalCoding<Base64Encoding>` instead")
public typealias Base64OptionalCoding = OptionalCoding<Base64Coding>

/// Encode this immutable `Data` Property as a Base64 encoded String
@available(*, deprecated, renamed: "Base64Encoding")
public typealias Base64EncodingMutable = EncodingUses<Base64DataStaticCoder>
/// Decode this immutable `Data` Property as a Base64 encoded String
@available(*, deprecated, renamed: "Base64Decoding")
public typealias Base64DecodingMutable = DecodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Property as a Base64 encoded String
@available(*, deprecated, renamed: "Base64Coding")
public typealias Base64CodingMutable = CodingUses<Base64DataStaticCoder>
/// (En/De)code this immutable `Data` Optional Property as a Base64 encoded String
@available(*, deprecated, message: "Use `OptionalCoding<Base64Encoding>` instead")
public typealias Base64OptionalCodingMutable = OptionalCoding<Base64Coding>

//MARK: - Date

//MARK: millisecondsSince1970

/// Encode this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateEncoding = EncodingUses<MillisecondsSince1970DateStaticCoder>
/// Decode this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateDecoding = DecodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Property using millisecondsSince1970
public typealias MillisecondsSince1970DateCoding = CodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Optional Property using millisecondsSince1970
@available(*, deprecated, message: "Use `OptionalCoding<MillisecondsSince1970DateCoding>` instead")
public typealias MillisecondsSince1970DateOptionalCoding = OptionalCoding<MillisecondsSince1970DateCoding>


/// Encode this mutable `Date` Property using millisecondsSince1970
@available(*, deprecated, renamed: "MillisecondsSince1970DateEncoding")
public typealias MillisecondsSince1970DateEncodingMutable = EncodingUses<MillisecondsSince1970DateStaticCoder>
/// Decode this mutable `Date` Property using millisecondsSince1970
@available(*, deprecated, renamed: "MillisecondsSince1970DateDecoding")
public typealias MillisecondsSince1970DateDecodingMutable = DecodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Property using millisecondsSince1970
@available(*, deprecated, renamed: "MillisecondsSince1970DateCoding")
public typealias MillisecondsSince1970DateCodingMutable = CodingUses<MillisecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Optional Property using millisecondsSince1970
@available(*, deprecated, message: "Use `OptionalCoding<MillisecondsSince1970DateCoding>` instead")
public typealias MillisecondsSince1970DateOptionalCodingMutable = OptionalCoding<MillisecondsSince1970DateCoding>

//MARK: secondsSince1970

/// Encode this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateEncoding = EncodingUses<SecondsSince1970DateStaticCoder>
/// Decode this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateDecoding = DecodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Property using secondsSince1970
public typealias SecondsSince1970DateCoding = CodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this immutable `Date` Optional Property using secondsSince1970
@available(*, deprecated, message: "Use `OptionalCoding<SecondsSince1970DateCoding>` instead")
public typealias SecondsSince1970DateOptionalCoding = OptionalCoding<SecondsSince1970DateCoding>


/// Encode this mutable `Date` Property using secondsSince1970
@available(*, deprecated, renamed: "SecondsSince1970DateEncoding")
public typealias SecondsSince1970DateEncodingMutable = EncodingUses<SecondsSince1970DateStaticCoder>
/// Decode this mutable `Date` Property using secondsSince1970
@available(*, deprecated, renamed: "SecondsSince1970DateDecoding")
public typealias SecondsSince1970DateDecodingMutable = DecodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Property using secondsSince1970
@available(*, deprecated, renamed: "SecondsSince1970DateCoding")
public typealias SecondsSince1970DateCodingMutable = CodingUses<SecondsSince1970DateStaticCoder>
/// (En/De)code this mutable `Date` Optional Property using secondsSince1970
@available(*, deprecated, message: "Use `OptionalCoding<SecondsSince1970DateCoding>` instead")
public typealias SecondsSince1970DateOptionalCodingMutable = OptionalCoding<SecondsSince1970DateCoding>

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
@available(*, deprecated, message: "Use `OptionalCoding<ISO8601DateCoding>` instead")
public typealias ISO8601DateOptionalCoding = OptionalCoding<ISO8601DateCoding>

/// Encode this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, renamed: "SecondsSince1970DateCoding")
public typealias ISO8601DateEncodingMutable = EncodingUses<ISO8601DateStaticCoder>
/// Decode this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, renamed: "SecondsSince1970DateCoding")
public typealias ISO8601DateDecodingMutable = DecodingUses<ISO8601DateStaticCoder>
/// (En/De) this mutable `Date` Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, renamed: "SecondsSince1970DateCoding")
public typealias ISO8601DateCodingMutable = CodingUses<ISO8601DateStaticCoder>
/// (En/De) this mutable `Date` Optional Property using a ISO8601DateFormatter with `formatOptions` set to `.withInternetDateTime`
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, message: "Use `OptionalCoding<ISO8601DateCoding>` instead")
public typealias ISO8601DateOptionalCodingMutable = OptionalCoding<ISO8601DateCoding>

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
@available(*, deprecated, message: "Use `OptionalCoding<ISO8601DateFormatterCoding<CustomCoder>>` instead")
public typealias ISO8601DateFormatterOptionalCoding<CustomCoder: ISO8601DateFormatterStaticCoder> = OptionalCoding<ISO8601DateFormatterCoding<CustomCoder>>

/// Encode this mutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, renamed: "ISO8601DateFormatterEncoding")
public typealias ISO8601DateFormatterEncodingMutable<CustomEncoder: ISO8601DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>
/// Decode this mutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, renamed: "ISO8601DateFormatterDecoding")
public typealias ISO8601DateFormatterDecodingMutable<CustomDecoder: ISO8601DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this mutable `Date` Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, renamed: "ISO8601DateFormatterCoding")
public typealias ISO8601DateFormatterCodingMutable<CustomCoder: ISO8601DateFormatterStaticCoder> = CodingUses<CustomCoder>
/// (En/De)code this mutable `Date` Optional Property using the passed formatter
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
@available(*, deprecated, message: "Use `OptionalCoding<ISO8601DateFormatterCoding<CustomCoder>>` instead")
public typealias ISO8601DateFormatterOptionalCodingMutable<CustomCoder: ISO8601DateFormatterStaticCoder> = OptionalCoding<ISO8601DateFormatterCoding<CustomCoder>>

//MARK: DateFormatter

/// Encode this immutable `Date` Property using the passed formatter
public typealias DateFormatterEncoding<CustomEncoder: DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>
/// Decode this immutable `Date` Property using the passed formatter
public typealias DateFormatterDecoding<CustomDecoder: DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this immutable `Date` Property using the passed formatter
public typealias DateFormatterCoding<CustomCoder: DateFormatterStaticCoder> = CodingUses<CustomCoder>
/// (En/De)code this immutable `Date` Optional Property using the passed formatter
@available(*, deprecated, message: "Use `OptionalCoding<DateFormatterCoding<CustomCoder>>` instead")
public typealias DateFormatterOptionalCoding<CustomCoder: DateFormatterStaticCoder> = OptionalCoding<DateFormatterCoding<CustomCoder>>

/// Encode this mutable `Date` Property using the passed formatter
@available(*, deprecated, renamed: "DateFormatterEncoding")
public typealias DateFormatterEncodingMutable<CustomEncoder: DateFormatterStaticEncoder> = EncodingUses<CustomEncoder>
/// Decode this mutable `Date` Property using the passed formatter
@available(*, deprecated, renamed: "DateFormatterDecoding")
public typealias DateFormatterDecodingMutable<CustomDecoder: DateFormatterStaticDecoder> = DecodingUses<CustomDecoder>
/// (En/De)code this mutable `Date` Property using the passed formatter
@available(*, deprecated, renamed: "DateFormatterCoding")
public typealias DateFormatterCodingMutable<CustomCoder: DateFormatterStaticCoder> = CodingUses<CustomCoder>
/// (En/De)code this mutable `Date` Optional Property using the passed formatter
@available(*, deprecated, message: "Use `OptionalCoding<DateFormatterCoding<CustomCoder>>` instead")
public typealias DateFormatterOptionalCodingMutable<CustomCoder: DateFormatterStaticCoder> = OptionalCoding<DateFormatterCoding<CustomCoder>>

//MARK: - Bool

//MARK: NonConformingBool

/// Encode this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolEncoding<ValueProvider: NonConformingBoolValueProvider> = EncodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// Decode this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolDecoding<ValueProvider: NonConformingBoolValueProvider> = DecodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this immutable `Bool` Property using the passed NonConformingBoolValueProvider
public typealias NonConformingBoolCoding<ValueProvider: NonConformingBoolValueProvider> = CodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this immutable `Bool` Property using the passed NonConformingBoolValueProvider
@available(*, deprecated, message: "Use `OptionalCoding<NonConformingBoolCoding<ValueProvider>>` instead")
public typealias NonConformingBoolOptionalCoding<ValueProvider: NonConformingBoolValueProvider> = OptionalCoding<NonConformingBoolCoding<ValueProvider>>

/// Encode this mutable `Bool` Property using the passed NonConformingBoolValueProvider
@available(*, deprecated, renamed: "NonConformingBoolEncoding")
public typealias NonConformingBoolEncodingMutable<ValueProvider: NonConformingBoolValueProvider> = EncodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// Decode this mutable `Bool` Property using the passed NonConformingBoolValueProvider
@available(*, deprecated, renamed: "NonConformingBoolDecoding")
public typealias NonConformingBoolDecodingMutable<ValueProvider: NonConformingBoolValueProvider> = DecodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this mutable `Bool` Property using the passed NonConformingBoolValueProvider
@available(*, deprecated, renamed: "NonConformingBoolCoding")
public typealias NonConformingBoolCodingMutable<ValueProvider: NonConformingBoolValueProvider> = CodingUses<NonConformingBoolStaticCoder<ValueProvider>>
/// (En/De)code this mutable `Bool` Property using the passed NonConformingBoolValueProvider
@available(*, deprecated, message: "Use `OptionalCoding<NonConformingBoolCoding<ValueProvider>>` instead")
public typealias NonConformingBoolOptionalCodingMutable<ValueProvider: NonConformingBoolValueProvider> = OptionalCoding<NonConformingBoolCoding<ValueProvider>>

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
@available(*, deprecated, message: "Use `OptionalCoding<BoolAsIntegerCoding<ValueType>>` instead")
public typealias BoolAsIntegerOptionalCoding<ValueType: FixedWidthInteger & Codable> = OptionalCoding<BoolAsIntegerCoding<ValueType>>

/// Encode this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
@available(*, deprecated, renamed: "BoolAsIntegerEncoding")
public typealias BoolAsIntegerEncodingMutable<ValueType: FixedWidthInteger & Codable> = EncodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// Decode this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
@available(*, deprecated, renamed: "BoolFromIntegerDecoding")
public typealias BoolFromIntegerDecodingMutable<ValueType: FixedWidthInteger & Codable> = DecodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Property as passed Integer Type using 1 as true and 0 as false
@available(*, deprecated, renamed: "BoolAsIntegerCoding")
public typealias BoolAsIntegerCodingMutable<ValueType: FixedWidthInteger & Codable> = CodingUses<BoolAsIntegerStaticCoder<ValueType>>
/// (En/De)code this immutable `Bool` Optional Property as passed Integer Type using 1 as true and 0 as false
@available(*, deprecated, message: "Use `OptionalCoding<BoolAsIntegerCoding<ValueType>>` instead")
public typealias BoolAsIntegerOptionalCodingMutable<ValueType: FixedWidthInteger & Codable> = OptionalCoding<BoolAsIntegerCoding<ValueType>>


//MARK: BoolAsInt

/// Encode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntEncoding = BoolAsIntegerEncoding<Int>
/// Decode this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolFromIntDecoding = BoolFromIntegerDecoding<Int>
/// (En/De)code this immutable `Bool` Property as an Int using 1 as true and 0 as false
public typealias BoolAsIntCoding = BoolAsIntegerCoding<Int>
/// (En/De)code this immutable `Bool` Optional Property as an Int using 1 as true and 0 as false
@available(*, deprecated, message: "Use `OptionalCoding<BoolAsIntCoding>` instead")
public typealias BoolAsIntOptionalCoding = OptionalCoding<BoolAsIntCoding>

/// Encode this immutable `Bool` Property as an Int using 1 as true and 0 as false
@available(*, deprecated, renamed: "BoolAsIntEncoding")
public typealias BoolAsIntEncodingMutable = BoolAsIntegerEncodingMutable<Int>
/// Decode this immutable `Bool` Property as an Int using 1 as true and 0 as false
@available(*, deprecated, renamed: "BoolFromIntDecoding")
public typealias BoolFromIntDecodingMutable = BoolFromIntegerDecodingMutable<Int>
/// (En/De)code this immutable `Bool` Property as an Int using 1 as true and 0 as false
@available(*, deprecated, renamed: "BoolAsIntCoding")
public typealias BoolAsIntCodingMutable = BoolAsIntegerCodingMutable<Int>
/// (En/De)code this immutable `Bool` Optional Property as an Int using 1 as true and 0 as false
@available(*, deprecated, message: "Use `OptionalCoding<BoolAsIntCoding>` instead")
public typealias BoolAsIntOptionalCodingMutable = OptionalCoding<BoolAsIntCoding>

/// Convenience typealias
public typealias BoolAsStringStaticCoder = NonConformingBoolStaticCoder<BoolAsStringValueProvider>

/// Encode this immutable `Bool` Property as a String using "true" for true and "false" for false
public typealias BoolAsStringEncoding = EncodingUses<BoolAsStringStaticCoder>
/// Decode this immutable `Bool` Property as a String using "true" for true and "false" for false
public typealias BoolFromStringDecoding = DecodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Property a String using "true" for true and "false" for false
public typealias BoolAsStringCoding = CodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Optional Property a String using "true" for true and "false" for false
@available(*, deprecated, message: "Use `OptionalCoding<BoolAsStringCoding>` instead")
public typealias BoolAsStringOptionalCoding = OptionalCoding<BoolAsStringCoding>

/// Encode this immutable `Bool` Property a String using "true" for true and "false" for false
@available(*, deprecated, renamed: "BoolAsStringEncoding")
public typealias BoolAsStringEncodingMutable = EncodingUses<BoolAsStringStaticCoder>
/// Decode this immutable `Bool` Property a String using "true" for true and "false" for false
@available(*, deprecated, renamed: "BoolFromStringDecoding")
public typealias BoolFromStringDecodingMutable = DecodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Property a String using "true" for true and "false" for false
@available(*, deprecated, renamed: "BoolAsStringCoding")
public typealias BoolAsStringCodingMutable = CodingUses<BoolAsStringStaticCoder>
/// (En/De)code this immutable `Bool` Optional Property a String using "true" for true and "false" for false
@available(*, deprecated, message: "Use `OptionalCoding<BoolAsStringCoding>` instead")
public typealias BoolAsStringOptionalCodingMutable = OptionalCoding<BoolAsStringCoding>
