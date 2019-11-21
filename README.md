# CodableWrappers

[![Swift Package Manager](https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Platform](https://img.shields.io/cocoapods/p/Burritos.svg)](https://github.com/GottaGetSwifty/CodableWrappers)
[![Build Status](https://travis-ci.org/GottaGetSwifty/CodableWrappers.svg?branch=master)](https://travis-ci.org/GottaGetSwifty/CodableWrappers)

## A collection of [Property Wrappers](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md) for custom serialization of Swift Codable Types

Check out [this blog post](https://www.getswifty.blog/blog/making-custom-serialization-a-breeze-in-swift-51-with-property-wrappers) for a more detailed overview.

### Advantages

- Declarative
- Extendable
- Declare once for all Encoders and Decoders. (e.g. JSONEncoder and PropertyListEncoder)
- Custom (de/en)coding without overriding `encode(to: Encoder)` or `init(with decoder)` for your whole Type
- Multiple (de/en)coding strategies within the same and child Types
- Cross Platform

## Compatibility

**Swift 5.1+** is required to build Property Wrappers (Xcode 11) which are [Backwards Deployable](https://forums.swift.org/t/which-of-swift-5-1-features-are-backwards-deployable/25610/3)

## Installation

### Swift Package Manager

If you're working directly in a Package, add CodableWrappers to your Package.swift file

```swift
dependencies: [
    .package(url: "https://github.com/GottaGetSwifty/CodableWrappers.git", .upToNextMajor(from: "1.0.0" )),
]
```

If working in an Xcode project select `File->Swift Packages->Add Package Dependency...` and search for the package name: `CodableWrappers` or the git url:

`https://github.com/GottaGetSwifty/CodableWrappers.git`

### **Note**

Since [SPM](https://swift.org/package-manager/) is now supported everywhere Swift 5.1 is used, there are currently no plans to support other dependency management tools. If SPM in unavailable, [Git-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) is an option. Or feel free to submit a pull request with support added for your preference! ️️😊

---

## Available Property Wrappers

- [@OmitCoding](#OmitCoding)
- [@Base64Coding](#base64coding)
- [@SecondsSince1970DateCoding](#secondssince1970datecoding)
- [@MillisecondsSince1970DateCoding](#millisecondssince1970datecoding)
- [@DateFormatterCoding\<DateFormatterStaticCoder>](#DateFormatterCoding\<DateFormatterStaticCoder>)
- [@ISO8601DateCoding](#iso8601datecoding)
- [@ISO8601DateFormatterCoding\<ISO8601DateFormatterStaticCoder>](#ISO8601DateFormatterCoding\<ISO8601DateFormatterStaticCoder>)
- [@NonConformingFloatCoding\<ValueProvider>](#nonconformingfloatcodingvalueprovider)
- [@NonConformingDoubleCoding\<ValueProvider>](#nonconformingdoublecodingvalueprovider)
- [Additional Customization](#Additional-Customization)
- [Property Mutability](#property-mutability)
- [Only Encoding or Decoding](#only-encoding-or-decoding)

## Other Customization

- [Optional Properties](#Optional-Properties)
- [Property Mutability](#Property-Mutability)
- [Only Encoding or Decoding](#Only-Encoding-or-Decoding)

## Additional Links

- [Introduction Blog Post](https://www.getswifty.blog/blog/making-custom-serialization-a-breeze-in-swift-51-with-property-wrappers)
- [Custom Examples](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/CustomExamples.md)
- [Release Notes](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/ReleaseNotes.md)
- [Design Footnotes](https://www.getswifty.blog/blog/design-footnotes-for-codablewrappers)

---

## @OmitCoding

For a property that should not be serialized

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

## Optional Properties

### Issues

Due to the constraints of generics / property wrappers, the same StaticCoder cannot handle both Optional and non-Optional Properties.

Also the current implementation of Codable generation for a PropertyWrapper results in a MissingKey Error if the value doesn't exist when Decoding, and always encodes with a "null" object.

### Solution

To handle this identically to a typical Optional Property, an `OptionalStaticCoder` wrapper is available.

**\*NOTE\*** Once Property Wrapper composition is available a Composable wrapper will likely be added to handle this in a more general way.

```swift
struct MyType: Codable {
    @CodingUses<OptionalStaticCoder<Base64DataStaticCoder>>
    var myData: Data?
}
```

A set of convenience Property Wrappers are also available.
E.g. `@MillisecondsSince1970DateOptionalCoding`, `@Base64OptionalCodingMutable`, etc.

```swift
struct MyType: Codable {
    @Base64OptionalCoding
    var myData: Data?
}
```

### Performance Implications

One additional note is that as of version 1.1.0 the custom encoding override uses Reflection to check if the value is nil. The performance hit should be negligible in most cases but if using an Optional Wrapper for large types or if encoding very large data sets you may see a meaningful performance hit.

## Property Mutability

The Property a Property Wrapper wraps must be declared as a `var` and the ability to mutate is defined by the Property Wrapper.

To allow flexibility all of the included Property Wrappers have a Mutable variant.

**Add `Mutable` to the end to access the Mutable Property Wrapper, making the Property mutable**
E.g. `@Base64CodingMutable`, `@SecondsSince1970DateCoding`, `@CustomCodingMutable<ACustomCoder>`, etc.

```swift
struct MyType: Codable {
    @SecondsSince1970DateCodingMutable
    var updatedAt: Date
    @SecondsSince1970DateCoding
    var createdAt: Date

    mutating func update() {
        createdAt = Date() // ERROR - Cannot assign to property: 'createdAt' is a get-only property
        updatedAt = Date() // Works!
    }
}
```

## Only Encoding or Decoding

Sometimes you are only able/wanting to implement Encoding or Decoding.

To enable this all of the included Wrappers have Encoding and Decoding variants

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

## Contributions

If there's a standard Serialization strategy that could be added, please open an issue requesting it and/or submit a pull request with passing tests.
