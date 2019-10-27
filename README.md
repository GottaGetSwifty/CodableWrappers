# CodableWrappers

[![Swift Package Manager](https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Platform](https://img.shields.io/cocoapods/p/Burritos.svg)](https://github.com/GottaGetSwifty/CodableWrappers)

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

- [@Base64Coding](#base64coding)
 [@SecondsSince1970DateCoding](#secondssince1970datecoding)
- [@MillisecondsSince1970DateCoding](#millisecondssince1970datecoding)
- [@ISO8601DateCoding](#iso8601datecoding)
- [@DateFormatterCoding\<DateFormatterStaticCoder>](#DateFormatterCoding\<DateFormatterStaticCoder>)
- [@NonConformingFloatCoding\<ValueProvider>](#nonconformingfloatcodingvalueprovider)
- [@NonConformingDoubleCoding\<ValueProvider>](#nonconformingdoublecodingvalueprovider)
- [Other Customization](#other-customization-1)
- [Property Mutability](#property-mutability)
- [Only Encoding or Decoding](#only-encoding-or-decoding)

## Other Customization

- [Property Mutability](#Property-Mutability)
- [Only Encoding or Decoding](#Only-Encoding-or-Decoding)

---

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

## @ISO8601DateCoding

For a Date property that should be serialized using the ISO8601DateFormatter

```swift
struct MyType: Codable {
    @ISO8601DateCoding
    var myDate: Date // Now encodes to ISO8601
}
```

## @DateFormatterCoding\<DateFormatterStaticCoder>

For other Date formats, create a Type that adheres to the `DateFormatterStaticCoder` Protocol and use the `@CodingUses<StaticCoder>` generic Property Wrapper. A convenience `@DateFormatterCoding` `typealias` is also available.

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

## Other Customization

The architecture was built with extensibility in mind so Implementing your own custom coding is as simple as implementing the StaticCoder `protocol`. You can then simply add `@CodingUses<YourCustomCoder>` to your property, or create a `typealias` to make it cleaner: `typealias YourCustomCoding = CodingUses<YourCustomCoder>`

In fact all the included Property Wrappers are built the same way!

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

// Approach 2: CustomEncoding propertyWrapper typealias

typealias NanosecondsSince9170Coding = CodingUses<NanosecondsSince9170Coder>

struct MyType: Codable {
    @NanosecondsSince9170Coding
    var myData: Date // Now uses the NanosecondsSince9170Coder for serialization
}
```

Take a look at [these other examples](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/CustomExamples.md) to see what else is possible.

---

## Property Mutability

Currently the Property a propertyWrapper wraps must be declared as a `var` and the ability to mutate is defined by the propertyWrapper.

To allow flexibility all of the included propertyWrappers have a Mutable variant.

**Add `Mutable` to the end to access the Mutable propertyWrapper, making the Property mutable**
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

To allow flexibility all of the included propertyWrappers/protocols have strictly Encoding and Decoding variants

**Change Coder to Encoder/Decoder or Coding to Encoding/Decoding to implement only one**
E.g. `@Base64Encoding`, `@SecondsSince1970DateDecoding`, `@CustomEncodingMutable<ACustomEncoder>`, etc.

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
