# CodableWrappers Release Notes

## Version 3.1

### New Features

- Full support for Swift 6's Strict concurrency checking
- New `@ISO8601Coding` Property Wrappers using `Date.ISO8601FormatStyle` to fully support `Sendable`

### Bug Fixes

- Updating Manifest to avoid versioning issues for Swift and SwiftSyntax

### Deprecations

- `@ISO8601DateCoding` and `@ISO8601DateFormatterCoding` and related Types are deprecated due to `ISO8601DateFormatter` not being Thread Safe. 

    Generally any current usage should work fine as-is, but it may be removed in a future major release.

## Version 3.0

CodingKey macro support! Customized CodingKeys can now be generated with annotation!

### Breaking Changes

- Deprectated symbols from 2.0 have been removed

### Added in 3.0

- `@CustomCodable()` Macro to customize Codable

- `CustomCodingKey(_:)`
- `CodingKeyPrefix(_:)`
- `CodingKeySuffix(_:)`

- `CamelCase()`
- `FlatCase()`
- `PascalCase()`
- `UpperCase()`
- `SnakeCase()`
- `CamelSnakeCase()`
- `PascalSnakeCase()`
- `ScreamingSnakeCase()`
- `KebabCase()`
- `CamelKebabCase()`
- `PascalKebabCase()`
- `ScreamingKebabCase()`

See documentation for more details.

## Version 2.0

The major goal for this release is to reduce API surface level by unifying Property variation, make the abstractions more meaningful, and add a couple useful wrappers.

### Major (Sometimes) Breaking Changes

- Wrappers are now Mutable by default. `@Immutable` can be composed in front of a wrapper if a property is meant to be immutable. Types this replaces are marked as deprecated with renaming/fixits where possible.
- Wrappers can now be made Optional by including it in the Type `@OptionalCoding`. e.g. `OptionalCoding<Base64Coding>`. Types this replaces are marked as deprecated with renaming/fixits where possible.

### Added in v2.0

- `@Immutable`: wrapper for simple composition of mutability
- `@OptionalCoding<CodingWrapper>`: Unified composition of Optionality.
- `@TransientCoding`: Handles (en/de)coding at current level of nesting
- `protocol TransientCodable`: Implements `Codable` for the adhering Type and handles (en/de)coding at the current level of nesting.
- `@FallbackEncoding<FallbackValueProvider>`: A Wrapper that will encode a fallback value when nil. e.g. `@FallbackEncoding<EmptyString>`
- `@FallbackDecoding<FallbackValueProvider>`: A Wrapper that will decode a fallback value when nil. e.g. `@FallbackDecoding<EmptyString>`
- `@FallbackCoding<FallbackValueProvider>`: A combination of the above two. e.g. `@FallbackCoding<EmptyString>`
- `FallbackValueProvider`: A Protocol to provide a value. Implementations included for typical Empty Types (.e.g `EmptyString`)
- `@EncodeNulls`: Encodes a `nil` value with an Encoder's `singleValueContainer.encodeNil()`, so e.g. in JSON; `"key": null`
- `@Lossy(Array/Dictionary/Set)Decoding`: Filters any nil items from the collection
- `EmptyBool`
- `EmptyString`
- `EmptyInt`
- `EmptyInt16`
- `EmptyInt32`
- `EmptyInt64`
- `EmptyInt8`
- `EmptyUInt`
- `EmptyUInt16`
- `EmptyUInt32`
- `EmptyUInt64`
- `EmptyUInt8`
- `EmptyCGFloat`
- `EmptyDouble`
- `EmptyFloat`
- `EmptyFloat16`
- `EmptyArray`
- `EmptyDictionary`
- `EmptySet`

### Deprecated

`EncodingUsesMutable`: Wrappers are now mutable by default
`DecodingUsesMutable`: Wrappers are now mutable by default
`CodingUsesMutable`: Wrappers are now mutable by default
`EncodingUsesMutable`: Wrappers are now mutable by default
`DecodingUsesMutable`: Wrappers are now mutable by default
`EncodingUsesMutable`: Wrappers are now mutable by default
`DecodingUsesMutable`: Wrappers are now mutable by default
`CodingUsesMutable`: Wrappers are now mutable by default
`DecodingUsesMutable`: Wrappers are now mutable by default
`EncodingUsesMutable`: Wrappers are now mutable by default
`CodingUsesMutable`: Wrappers are now mutable by default

`OptionalStaticCoder`: Use `@OptionalCoding<YourWrapperType>` instead
`OptionalBase64DataStaticCoder`: Use `@OptionalCoding<Base64DataCoding>` instead
`OptionalNonConformingBoolStaticCoderOptionalStaticCoder`: Use `@OptionalCoding<NonConformingBoolCoding<ValueProvider>>` instead
`OptionalSecondsSince1970DateStaticCoder`: Use `@OptionalCoding<SecondsSince1970DateCoding>` instead
`OptionalMillisecondsSince1970DateStaticCoder`: Use `@OptionalCoding<MillisecondsSince1970DateCoding>` instead
`OptionalISO8601DateStaticCoder`: Use `@OptionalCoding<ISO8601DateCoding>` instead
`OptionalNonConformingDoubleStaticCoderOptionalStaticCoder`: Use `@OptionalCoding<NonConformingDoubleCoding<ValueProvider>>` instead
`OptionalNonConformingFloatStaticCoderOptionalStaticCoder`: Use `@OptionalCoding<NonConformingFloatCoding<ValueProvider>>` instead


`NonConformingFloatOptionalCoding`: Use `OptionalCoding<NonConformingFloatEncoding>` instead
`NonConformingFloatEncodingMutable`: renamed `NonConformingFloatEncoding`
`NonConformingFloatDecodingMutable`: renamed `NonConformingFloatDecoding`
`NonConformingFloatCodingMutable`: renamed `NonConformingFloatCoding`
`NonConformingFloatOptionalCodingMutable`: Use `OptionalCoding<NonConformingFloatCoding<ValueProvider>>` instead
`NonConformingDoubleOptionalCoding`: Use `OptionalCoding<NonConformingDoubleCoding<ValueProvider>>` instead
`NonConformingDoubleEncodingMutable`: renamed: `NonConformingDoubleEncoding`
`NonConformingDoubleDecodingMutable`: renamed: `NonConformingDoubleDecoding`
`NonConformingDoubleCodingMutable`: renamed: `NonConformingDoubleCoding`
`NonConformingDoubleOptionalCodingMutable`: Use `OptionalCoding<NonConformingDoubleCoding<ValueProvider>>` instead

`Base64OptionalCoding`: Use `OptionalCoding<Base64Encoding>` instead
`Base64EncodingMutable`: renamed: `Base64Encoding`
`Base64DecodingMutable`: renamed: `Base64Decoding`
`Base64CodingMutable`: renamed: `Base64Coding`
`Base64OptionalCodingMutable`: Use `OptionalCoding<Base64Encoding>` instead

`MillisecondsSince1970DateOptionalCoding`: Use `OptionalCoding<MillisecondsSince1970DateCoding>` instead
`MillisecondsSince1970DateEncodingMutable`: renamed: `MillisecondsSince1970DateEncoding`
`MillisecondsSince1970DateDecodingMutable`: renamed: `MillisecondsSince1970DateDecoding`
`MillisecondsSince1970DateCodingMutable`: renamed: `MillisecondsSince1970DateCoding`
`MillisecondsSince1970DateOptionalCodingMutable`: Use `OptionalCoding<MillisecondsSince1970DateCoding>` instead
`SecondsSince1970DateOptionalCoding`: Use `OptionalCoding<SecondsSince1970DateCoding>` instead

`SecondsSince1970DateEncodingMutable`: renamed: `SecondsSince1970DateEncoding`
`SecondsSince1970DateDecodingMutable`: renamed: `SecondsSince1970DateDecoding`
`SecondsSince1970DateCodingMutable`: renamed: `SecondsSince1970DateCoding`
`SecondsSince1970DateOptionalCodingMutable`: Use `OptionalCoding<SecondsSince1970DateCoding>` instead
`ISO8601DateOptionalCoding`: Use `OptionalCoding<ISO8601DateCoding>` instead
`ISO8601DateEncodingMutable`: renamed: `SecondsSince1970DateCoding`
`ISO8601DateDecodingMutable`: renamed: `SecondsSince1970DateCoding`
`ISO8601DateCodingMutable`: renamed: `SecondsSince1970DateCoding`
`ISO8601DateOptionalCodingMutable`: Use `OptionalCoding<ISO8601DateCoding>` instead
`ISO8601DateFormatterOptionalCoding`: Use `OptionalCoding<ISO8601DateFormatterCoding<CustomCoder>>` instead
`ISO8601DateFormatterEncodingMutable`: renamed: `ISO8601DateFormatterEncoding`
`ISO8601DateFormatterDecodingMutable`: renamed: `ISO8601DateFormatterDecoding`
`ISO8601DateFormatterCodingMutable`: renamed: `ISO8601DateFormatterCoding`
`ISO8601DateFormatterOptionalCodingMutable`: Use `OptionalCoding<ISO8601DateFormatterCoding<CustomCoder>>` instead

`DateFormatterOptionalCoding`: Use `OptionalCoding<DateFormatterCoding<CustomCoder>>` instead
`DateFormatterEncodingMutable`: renamed: `DateFormatterEncoding`
`DateFormatterDecodingMutable`: renamed: `DateFormatterDecoding`
`DateFormatterCodingMutable`: renamed: `DateFormatterCoding`
`DateFormatterOptionalCodingMutable`: Use `OptionalCoding<DateFormatterCoding<CustomCoder>>` instead

`NonConformingBoolOptionalCoding`: Use `OptionalCoding<NonConformingBoolCoding<ValueProvider>>` instead
`NonConformingBoolEncodingMutable`: renamed: `NonConformingBoolEncoding`
`NonConformingBoolDecodingMutable`: renamed: `NonConformingBoolDecoding`
`NonConformingBoolCodingMutable`: renamed: `NonConformingBoolCoding`
`NonConformingBoolOptionalCodingMutable`: Use `OptionalCoding<NonConformingBoolCoding<ValueProvider>>` instead

`BoolAsIntegerOptionalCoding`: Use `OptionalCoding<BoolAsIntegerCoding<ValueType>>` instead
`BoolAsIntegerEncodingMutable`: renamed: `BoolAsIntegerEncoding`
`BoolFromIntegerDecodingMutable`: renamed: `BoolFromIntegerDecoding`
`BoolAsIntegerCodingMutable`: renamed: `BoolAsIntegerCoding`
`BoolAsIntegerOptionalCodingMutable`: Use `OptionalCoding<BoolAsIntegerCoding<ValueType>>` instead
`BoolAsIntOptionalCoding`: Use `OptionalCoding<BoolAsIntCoding>` instead
`BoolAsIntEncodingMutable`: renamed: `BoolAsIntEncoding`
`BoolFromIntDecodingMutable`: renamed: `BoolFromIntDecoding`
`BoolAsIntCodingMutable`: renamed: `BoolAsIntCoding`
`BoolAsIntOptionalCodingMutable`: Use `OptionalCoding<BoolAsIntCoding>` instead
`BoolAsStringOptionalCoding`: Use `OptionalCoding<BoolAsStringCoding>` instead
`BoolAsStringEncodingMutable`: renamed: `BoolAsStringEncoding`
`BoolFromStringDecodingMutable`: renamed: `BoolFromStringDecoding`
`BoolAsStringCodingMutable`: renamed: `BoolAsStringCoding`
`BoolAsStringOptionalCodingMutable`: Use `OptionalCoding<BoolAsStringCoding>` instead

## Version 1.2

### Added in v1.2

Bool <-> Int

`@BoolAsIntEncoding`
`@BoolFromIntDecoding`
`@BoolAsIntCoding`
`@BoolAsIntEncodingMutable`
`@BoolFromIntDecodingMutable`
`@BoolAsIntCodingMutable`
`@BoolAsIntOptionalCodingMutable`

Bool <-> String

`@BoolAsStringEncoding`
`@BoolFromStringDecoding`
`@BoolAsStringCoding`
`@BoolAsStringOptionalCoding`
`@BoolAsStringEncodingMutable`
`@BoolFromStringDecodingMutable`
`@BoolAsStringCodingMutable`
`@BoolAsStringOptionalCodingMutable`

## Version 1.1

### Added in v1.1

#### Optional Wrappers

- `@NonConformingFloatOptionalCoding`
- `@NonConformingFloatOptionalCodingMutable`
- `@NonConformingDoubleOptionalCoding`
- `@NonConformingDoubleOptionalCodingMutable`
- `@Base64OptionalCoding`
- `@Base64OptionalCodingMutable`
- `@MillisecondsSince1970DateOptionalCoding`
- `@MillisecondsSince1970DateOptionalCodingMutable`
- `@SecondsSince1970DateOptionalCoding`
- `@SecondsSince1970DateOptionalCodingMutable`
- `@ISO8601DateOptionalCoding`
- `@ISO8601DateOptionalCodingMutable`
- `@DateFormatterOptionalCoding`
- `@DateFormatterOptionalCodingMutable`

#### Custom ISO8601DateEncoder

- `ISO8601DateFormatterStaticDecoder`
- `ISO8601DateFormatterStaticEncoder`
- `ISO8601DateFormatterStaticCoder`

- `@ISO8601DateFormatterEncoding`
- `@ISO8601DateFormatterDecoding`
- `@ISO8601DateFormatterCoding`
- `@ISO8601DateFormatterOptionalCoding`

- `@ISO8601DateFormatterEncodingMutable`
- `@ISO8601DateFormatterDecodingMutable`
- `@ISO8601DateFormatterCodingMutable`
- `@ISO8601DateFormatterOptionalCodingMutable`

#### OmitCoding

- `@OmitCoding`

#### Travis Integration with MacOS CI
