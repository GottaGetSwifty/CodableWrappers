# CodableWrappers

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGottaGetSwifty%2FCodableWrappers%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/GottaGetSwifty/CodableWrappers)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGottaGetSwifty%2FCodableWrappers%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/GottaGetSwifty/CodableWrappers)

## Simplified Serialization with [Property Wrappers](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md)

Make Complex Codable Serializate a breeze with declarative annotations!

```swift
@CustomCodable @SnakeCase
struct User: Codable {
    let firstName: String
    let lastName: String
    @SecondsSince1970DateCoding
    var joinDate: Date
    @CustomCodingKey("data")
    var imageData: Data
}
```

3.0 released! [Release Notes](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/ReleaseNotes.md)

---

## Installation

### Swift Package Manager \***Preferred***

URL:

`https://github.com/GottaGetSwifty/CodableWrappers.git`

Manifest:

```swift
dependencies: [
    .package(url: "https://github.com/GottaGetSwifty/CodableWrappers.git", .upToNextMajor(from: "3.0.0" )),
]
```

### CocoaPods

```ruby
pod 'CodableWrappers', '~> 3.0.0'
```

## Available CodingKey Macros

- [@CustomCodable](#customcodable) \*New in 3.0!*
- [@CustomCodingKey(String)](#customcodingkeystring) \*New in 3.0!*
- [@CodingKeyPrefix(String)](#codingkeyprefixstring) \*New in 3.0!*
- [@CodingKeySuffix(String)](#codingkeysuffixstring) \*New in 3.0!*
- [@CamelCase](#camelcase) \*New in 3.0!*
- [@FlatCase](#flatcase) \*New in 3.0!*
- [@PascalCase](#pascalcase) \*New in 3.0!*
- [@UpperCase](#uppercase) \*New in 3.0!*
- [@SnakeCase](#snakecase) \*New in 3.0!*
- [@CamelSnakeCase](#camelsnakecase) \*New in 3.0!*
- [@PascalSnakeCase](#pascalsnakecase) \*New in 3.0!*
- [@ScreamingSnakeCase](#screamingsnakecase) \*New in 3.0!*
- [@KebabCase](#kebabcase) \*New in 3.0!*
- [@CamelKebabCase](#camelkebabcase) \*New in 3.0!*
- [@PascalKebabCase](#pascalkebabcase) \*New in 3.0!*
- [@ScreamingKebabCase](#screamingkebabcase) \*New in 3.0!*

## Available Property Wrappers

- [@EncodeNulls](#encodenulls)
- [Lossy Collections](#lossy-collections)
- [Empty Defaults](#empty-defaults)
- [Other Fallbacks](#other-fallbacks)
- [@OmitCoding](#omitcoding)
- [@Base64Coding](#base64coding)
- [@SecondsSince1970DateCoding](#secondssince1970datecoding)
- [@MillisecondsSince1970DateCoding](#millisecondssince1970datecoding)
- [@DateFormatterCoding\<DateFormatterStaticCoder>](#dateformattercodingdateformatterstaticcoder)
- [@ISO8601DateCoding](#iso8601datecoding)
- [@ISO8601DateFormatterCoding\<ISO8601DateFormatterStaticCoder>](#iso8601dateformattercodingiso8601dateformatterstaticcoder)
- [@NonConformingFloatCoding\<ValueProvider>](#nonconformingfloatcodingvalueprovider)
- [@NonConformingDoubleCoding\<ValueProvider>](#nonconformingdoublecodingvalueprovider)
- [Bool Coding](#bool-coding)
- [Additional Customization](#additional-customization)
- [Property Mutability](#property-mutability)
- [Only Encoding or Decoding](#only-encoding-or-decoding)

## Other Customization

- [Property Mutability](#property-mutability) \*New in 2.0*
- [Optionals](#optionals) \*New in 2.0*
- [Only Encoding or Decoding](#only-encoding-or-decoding)

## Additional Links

- [Introduction Blog Post](https://www.getswifty.blog/blog/making-custom-serialization-a-breeze-in-swift-51-with-property-wrappers)
- [Custom Examples](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/CustomExamples.md)
- [Release Notes](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/ReleaseNotes.md)

---

## @CustomCodable

Prerequisite for customizing CodingKeys

```swift
@Codable
struct MyType: Codable {
}
```

## @CustomCodingKey\(String)

Use a custom String value for a Property's CodingKey

```swift
@CustomCodable
struct YourType: Codable {
    @CodingKey("your-Custom_naming")
    let firstProperty: String // Coding key will be "your-Custom_naming"
}
```

## CodingKeyPrefix\(String)

Set a property's CodingKey with a custom value

```swift
@CustomCodable
struct YourType: Codable {
    @CodingKeyPrefix("beta-")
    let firstProperty: String // CodingKey will be "beta-firstProperty"
}
```

```swift
@CustomCodable @CodingKeyPrefix("beta-")
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "beta-firstProperty"
}
```

## CodingKeySuffix\(String)

/// Add a Suffix a property's CodingKey or Type's CodingKeys with a custom value

```swift
@CustomCodable
struct YourType: Codable {
    @CodingKeySuffix("-beta")
    let firstProperty: String // CodingKey will be "firstProperty-beta"
}
```

```swift
@CustomCodable @CodingKeySuffix("-beta")
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "firstProperty-beta"
}
```

## CamelCase

/// Make the CodingKey for a property or Type `camelCase`

```swift
@CustomCodable
struct YourType: Codable {
    @CamelCase
    let first-property: String // CodingKey will be "firstProperty"
}
```

```swift
@CustomCodable @CamelCase
struct YourType: Codable {
    let first-property: String // CodingKey will be "firstProperty"
}
```

## @FlatCase

Make the CodingKey for a property or Type `flatcase`

```swift
@CustomCodable
struct YourType: Codable {
    @FlatCase
    let firstProperty: String // CodingKey will be "firstproperty"
}
```

```swift
@CustomCodable @FlatCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "firstproperty"
}
```

## @PascalCase

Make the CodingKey for a property or Type `PascalCase`

```swift
@CustomCodable
struct YourType: Codable {
    @PascalCase
    let firstProperty: String // CodingKey will be "FirstProperty"
}
```

```swift
@CustomCodable @PascalCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "FirstProperty"
}
```

## @UpperCase

Make the CodingKey for a property or Type `UPPERCASE`

```swift
@CustomCodable
struct YourType: Codable {
    @UpperCase
    let firstProperty: String // CodingKey will be "FIRSTPROPERTY"
}
```

```swift
@CustomCodable @UpperCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "FIRSTPROPERTY"
}
```

## @SnakeCase

Make the CodingKey for a property or Type `snake_case`

```swift
@CustomCodable
struct YourType: Codable {
    @SnakeCase
    let firstProperty: String // CodingKey will be "first_property"
}
```

```swift
@CustomCodable @SnakeCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "first_property"
}
```

## @CamelSnakeCase

Make the CodingKey for a property or Type `camel_Snake_Case`

```swift
@CustomCodable
struct YourType: Codable {
    @CamelSnakeCase
    let firstProperty: String // CodingKey will be "first_Property"
}
```

```swift
@CustomCodable @CamelSnakeCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "first_Property"
}
```

## @PascalSnakeCase

Make the CodingKey for a property or Type `Pascal_Snake_Case`

```swift
@CustomCodable
struct YourType: Codable {
    @PascalSnakeCase
    let firstProperty: String // CodingKey will be "First_Property"
}
```

```swift
@CustomCodable @PascalSnakeCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "First_Property"
}
```

## @ScreamingSnakeCase

Make the CodingKey for a property or Type `SCREAMING_SNAKE_CASE`

```swift
@CustomCodable
struct YourType: Codable {
    @ScreamingSnakeCase
    let firstProperty: String // CodingKey will be "FIRST_PROPERTY"
}
```

```swift
@CustomCodable @ScreamingSnakeCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "FIRST_PROPERTY"
}
```

## @KebabCase

Make the CodingKey for a property or Type `kebab-case`

```swift
@CustomCodable
struct YourType: Codable {
    @KebabCase
    let firstProperty: String // CodingKey will be "first-property"
}
```

```swift
@CustomCodable @KebabCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "first-property"
}
```

## @CamelKebabCase

Make the CodingKey for a property or Type `camel-Kebab-Case`

```swift
@CustomCodable
struct YourType: Codable {
    @CamelKebabCase
    let firstProperty: String // CodingKey will be "first-Property"
}
```

```swift
@CustomCodable @CamelKebabCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "first-Property"
}
```

## @PascalKebabCase

Make the CodingKey for a property or Type `Pascal-Kebab-Case`

```swift
@CustomCodable
struct YourType: Codable {
    @PascalKebabCase
    let firstProperty: String // CodingKey will be "First-Property"
}
```

```swift
@CustomCodable @PascalKebabCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "First-Property"
}
```

## @ScreamingKebabCase

Make the CodingKey for a property or Type `SCREAMING-KEBAB-CASE`

```swift
@CustomCodable
struct YourType: Codable {
    @ScreamingKebabCase
    let firstProperty: String // CodingKey will be "FIRST-PROPERTY"
}
```

```swift
@CustomCodable @ScreamingKebabCase 
struct YourType: Codable {
    let firstProperty: String // CodingKey will be "FIRST-PROPERTY"
}
```

## @EncodeNulls

For a Property that should encode `null` for `nil` values

```swift
struct MyType: Codable {
    @EncodeNulls
    var myText: String? // Will not be omitted when nil, e.g. will encode to `null` in JSON and `$null` in PLISTs
}
```

## Lossy Collections

```swift
@LossyArrayDecoding
@LossyDictionaryDecoding
@LossySetDecoding
```

Filters null values during decoding without throwing an Error

```swift
private struct LossyCollectionModel: Codable, Equatable {
    @LossyArrayDecoding
    var array: [String] // Ignores null values without throwing an Error
    @LossyDictionaryDecoding
    var dictionary: [String:String] // Ignores null values without throwing an Error
    @LossySetDecoding
    var set: Set<String> // Ignores null values without throwing an Error
}
```

## Empty Defaults

When you want to encode/decode an empty value rather than decoding nil or omitting encoding

```swift
struct MyType: Codable {
    @FallbackEncoding<EmptyInt>
    var int: Int? // will encode `0` when nil
    @FallbackDecoding<EmptyString>
    var string: String // will decode to "" when value was missing/nil
    @FallbackCoding<EmptyArray>
    var array: [Int]? // will encode/decode to [] when missing/nil
}
```

<details>

<summary>All Empty Values</summary>

</br>

```swift
BoolTrue
BoolFalse
EmptyBool
EmptyString
EmptyInt
EmptyInt16
EmptyInt32
EmptyInt64
EmptyInt8
EmptyUInt
EmptyUInt16
EmptyUInt32
EmptyUInt64
EmptyUInt8
EmptyCGFloat
EmptyDouble
EmptyFloat
EmptyFloat16
EmptyArray
EmptyDictionary
EmptySet
```

</details>

`Empty` defaults are available for most typical Foundation Types

## Other Fallbacks

Any other kind of default can be provided by a custom `FallbackValueProvider`

```swift
public struct DistantFutureDateProvider: FallbackValueProvider {
    public static var defaultValue: Date { Date.distantFuture }
}

struct MyType: Codable {
    @FallbackEncoding<DistantFutureDateProvider>
    var updatedDate: Date?
}

```

## @OmitCoding

For a Property you want to be ignore when (en/de)coding

```swift
struct MyType: Codable {
    @OmitCoding
    var myText: String? // Never encodes and ignores a value if one is in decoded data.
}
```

## @Base64Coding

For a Data property that should be serialized to a Base64 encoded String

```swift
struct MyType: Codable {
    @Base64Coding
    var myData: Data // Now encodes to a Base64 String
}
```

## @SecondsSince1970DateCoding

For a Date property that should be serialized to SecondsSince1970

```swift
struct MyType: Codable {
    @SecondsSince1970DateCoding
    var myDate: Date // Now encodes to SecondsSince1970
}
```

## @MillisecondsSince1970DateCoding

For a Date property that should be serialized to MillisecondsSince1970

```swift
struct MyType: Codable {
    @MillisecondsSince1970DateCoding
    var myDate: Date // Now encodes to MillisecondsSince1970
}
```

## @DateFormatterCoding\<DateFormatterStaticCoder>

For other Date formats create a Type that adheres to the `DateFormatterStaticCoder` Protocol and use the convenience `@DateFormatterCoding` `typealias` or `@CodingUses<StaticCoder>`.

```swift
struct MyCustomDateCoder: DateFormatterStaticCoder {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM:dd:yy H:mm:ss"
        return formatter
    }()
}

struct MyType: Codable {
    @DateFormatterCoding<MyCustomDateCoder>
    var myDate: Date // Now encodes to the format: "MM:dd:yy H:mm:ss"
}
```

## @ISO8601DateCoding

For a Date property that should be serialized using the ISO8601DateFormatter

```swift
struct MyType: Codable {
    @ISO8601DateCoding
    var myDate: Date // Now encodes to ISO8601
}
```

## @ISO8601DateFormatterCoding\<ISO8601DateFormatterStaticCoder>

For other Date formats create a Type that adheres to the `ISO8601DateFormatterStaticCoder` Protocol and use the convenience `@ISO8601DateFormatterCoding` `typealias` or `@CodingUses<StaticCoder>`.

```swift
@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)
struct MyCustomISO8601DateFormatter: ISO8601DateFormatterStaticCoder {
    static let iso8601DateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withDashSeparatorInDate]
        return formatter
    }()
}


struct MyType: Codable {
    @ISO8601DateFormatterCoding<MyCustomISO8601DateFormatter>
    var myDate: Date // Now encodes with MyCustomISO8601DateFormatter's formatter
}
```

## @NonConformingFloatCoding\<ValueProvider>

When using a non-conforming Float, create a Type that adheres to NonConformingDecimalValueProvider and use `@NonConformingFloatCoding<NonConformingDecimalValueProvider>`

```swift
struct MyNonConformingValueProvider: NonConformingDecimalValueProvider {
    static var positiveInfinity: String = "100"
    static var negativeInfinity: String = "-100"
    static var nan: String = "-1"
}

struct MyType: Codable {
    @NonConformingFloatCoding<MyNonConformingValueProvider>
    var myFloat: Float // Now encodes with the MyNonConformingValueProvider values for infinity/NaN
}
```

## @NonConformingDoubleCoding\<ValueProvider>

When using a non-conforming Double, create a Type that adheres to NonConformingDecimalValueProvider and use `@NonConformingDoubleCoding<NonConformingDecimalValueProvider>`

```swift
struct MyNonConformingValueProvider: NonConformingDecimalValueProvider {
    static var positiveInfinity: String = "100"
    static var negativeInfinity: String = "-100"
    static var nan: String = "-1"
}

struct MyType: Codable {
    @NonConformingDoubleCoding<MyNonConformingValueProvider>
    var myFloat: Float // Now encodes with the MyNonConformingValueProvider values for infinity/NaN
}
```

## Bool Coding

Sometimes an API uses an `Int` or `String` for a booleans.

`@BoolAsStringCoding`

```swift
struct MyType: Codable {
    @BoolAsStringCoding
    var myBool: Bool // Now encodes/decodes as a String. `"true"` for `true` and `"false"` for `false`. (Values are lower-cased before decoding)
}
```

`@BoolAsIntCoding`

```swift
struct MyType: Codable {
    @BoolAsIntCoding
    var myBool: Bool // Now encodes/decodes as an Int. `1` for `true` and `0` for `false`.
}
```

## Additional Customization

The architecture was built with extensibility in mind so Implementing your own custom coding is as simple as adhering to the `StaticCoder` `protocol`. You can then simply add `@CodingUses<YourCustomCoder>` to your property, or create a `typealias` to make it cleaner: `typealias YourCustomCoding = CodingUses<YourCustomCoder>`

In fact all the included Wrappers are built the same way!

### Full Example

```swift

struct NanosecondsSince9170Coder: StaticCoder {

    static func decode(from decoder: Decoder) throws -> Date {
        let nanoSeconds = try Double(from: decoder)
        let seconds = nanoSeconds * 0.000000001
        return Date(secondsSince1970: seconds)
    }

    static func encode(value: Date, to encoder: Encoder) throws {
        let nanoSeconds = value.secondsSince1970 / 0.000000001
        return try nanoSeconds.encode(to: encoder)
    }
}

// Approach 1: CustomCoding
struct MyType: Codable {
    @CodingUses<NanosecondsSince9170Coder>
    var myData: Date // Now uses the NanosecondsSince9170Coder for serialization
}

// Approach 2: CustomEncoding Property Wrapper typealias

typealias NanosecondsSince9170Coding = CodingUses<NanosecondsSince9170Coder>

struct MyType: Codable {
    @NanosecondsSince9170Coding
    var myData: Date // Now uses the NanosecondsSince9170Coder for serialization
}
```

Take a look at [these other examples](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/CustomExamples.md) to see what else is possible.

---

## Property Mutability

In 2.0 all wrappers are Mutable by default and can be made Immutable via Property Wrapper Composition

```swift
struct MyType: Codable {
    @Immutable @SecondsSince1970DateCoding
    var createdAt: Date

    @SecondsSince1970DateCoding
    var updatedAt: Date

    mutating func update() {
        createdAt = Date() // ERROR - Cannot assign to property: 'createdAt' is a get-only property
        updatedAt = Date() // Works!
    }
}
```

## Optionals

2.0 introduces `@OptionalCoding<StaticCodingWrapper>` to enable Optionals for a property.

```swift
struct MyType: Codable {
    @SecondsSince1970DateCoding
    var createdAt: Date

    @OptionalCoding<SecondsSince1970DateCoding>
    var updatedAt: Date?
}
```

## Only Encoding or Decoding

Sometimes you are only able/wanting to implement Encoding or Decoding.

To enable this, (where practical/possible), all of the included Wrappers have Encoding and Decoding variants

**Change Coder to Encoder/Decoder or Coding to Encoding/Decoding to implement only one**
E.g. `@Base64Encoding`, `@SecondsSince1970DateDecoding`, `@EncodingUses<ACustomEncoder>`, etc.

```swift
struct MyType: Encodable {
    @SecondsSince1970DateEncoding
    var myDate: Date
}

struct MyType: Decodable {
    @SecondsSince1970DateDecoding
    var myDate: Date
}

```

---

## Compatibility

- 3.x supports Swift 5.9  
- 2.x supports Swift 5.2
- 1.x supports Swift 5.1

---

## Contributions

If there is a standard Serialization or Coding Key strategy that could be added feel free to open an issue requesting it and/or submit a pull request with the new option.
