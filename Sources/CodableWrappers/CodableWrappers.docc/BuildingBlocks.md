# Customization Building Blocks

These are Types used for building property wrappers. These should not need to be directly used for most use cases

## Topics

### Core Property Wrappers
These wrappers are what largely what's used to construct the more user-friendly `typealias`es

- ``CodingUses``
- ``DecodingUses``
- ``EncodingUses``
- ``Immutable``

### Static Coding

- ``StaticCoder``
- ``StaticCodingWrapper``
- ``StaticDecoder``
- ``StaticDecoderWrapper``
- ``StaticEncoder``
- ``StaticEncoderWrapper``

- ``BoolAsIntegerStaticCoder``
- ``BoolAsStringStaticCoder``

- ``ArrayNilFilteringStaticDecoder``
- ``DictionaryNilFilteringStaticDecoder``

- ``Base64DataStaticCoder``

- ``SecondsSince1970DateStaticCoder``
- ``SetNilFilteringStaticDecoder``

- ``MillisecondsSince1970DateStaticCoder``

- ``NonConformingBoolStaticCoder``
- ``NonConformingDoubleStaticCoder``
- ``NonConformingFloatStaticCoder``

- ``ISO8601DateStaticCoder``


### Optional Handling

- ``NullStaticEncoder``

- ``OptionalCoding``
- ``OptionalDecoding``
- ``OptionalEncoding``

- ``OptionalDecodable``
- ``OptionalDecodingWrapper``
- ``OptionalEncodable``
- ``OptionalEncodingWrapper``

- ``OptionalCodable``
- ``OptionalCodingWrapper``

### Others
- ``AnyImmutableWrapper``
- ``AnyNullEncoder``

- ``FallbackDecodingWrapper``
- ``FallbackEncodingWrapper``
- ``FallbackValueProvider``

- ``NonConformingBoolValueProvider``
- ``NonConformingDecimalValueProvider``

- ``OmitableFromDecoding``
- ``OmitableFromEncoding``

- ``TransientCodable``
- ``TransientDecodable``
- ``TransientEncodable``

- ``FallbackCodingWrapper``

- ``BoolAsIntegerValueProvider``
- ``BoolAsStringValueProvider``
