# CodableWrappers

[![Swift Package Manager](https://img.shields.io/badge/swift%20package%20manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Platform](https://img.shields.io/cocoapods/p/Burritos.svg)](https://github.com/GottaGetSwifty/CodableWrappers)

## A collection of [Property Wrappers](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md) for customizing (de)serialization of Codable Types

Customize your Codable Types in a declarative and property constrained manor. No more relying on the (En/De)coders supporting your customization or writing your 

### Advantages

- Declarative
- Extendable
- Declare once for all Encoders and Decoders. (e.g. JSONEncoder and PropertyListEncoder)
- Can customize (de/en)coding without overriding `encode(to: Encoder)` or `init(with decoder)`!
- Multiple (de/en)coding strategies within the same or nested Types
- Cross Platform

## Compatibility

**Swift 5.1+** is required to build Property Wrappers (Xcode 11) and are [Backwards Deployable](https://forums.swift.org/t/which-of-swift-5-1-features-are-backwards-deployable/25610/3?u=getswifty)

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

### Note

Since SPM now has integrated support everywhere Swift 5.1 is used, there are currently no plans to support other dependency management tools. If SPM in unavailable, [Git-Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) is an option. More info can be found at the [SPM Website](https://swift.org/package-manager/)

---

## Available Property Wrappers

  - [@Base64Coding](#base64coding)
  - [@SecondsSince1970DateCoding](#secondssince1970datecoding)
  - [@MillisecondsSince1970DateCoding](#millisecondssince1970datecoding)
  - [@ISO8601DateCoding](#iso8601datecoding)
  - [Custom DateFormatter](#custom-dateformatter)
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
## Custom DateFormatter

For other Date formats, create a Type that adheres to the `CustomDateFormatterCoder` Protocol and use the `@CustomCoding<StaticCoder>` generic Property Wrapper

```swift
struct MyCustomDateCoder: CustomDateFormatterCoder {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM:dd:yy H:mm:ss"
        return formatter
    }()
}

struct MyType: Codable {
    @CustomCoding<MyCustomDateCoder>
    var myDate: Date // Now encodes to the format: "MM:dd:yy H:mm:ss"
}
```

## @NonConformingFloatCoding<ValueProvider>

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

## @NonConformingDoubleCoding<ValueProvider>

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

This is build to allow easy extension the base Types for any custom (de/en)coding needed.

In fact all the above Property Wrappers are built the same way!

All that's needed for your custom Coder is to implement `StaticCoder`

```swift

struct CustomBase64Coder: StaticCoder {

    static func decode(from decoder: Decoder) throws -> Data {
        let stringValue = try String(from: decoder)

        guard let value = Data.init(base64Encoded: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }
    static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}

// Approach 1: CustomCoding
struct MyType: Codable {
    @CustomCoding<CustomBase64Coder>
    var myData: Data // Now uses the CustomBase64Coder for serialization
}

// Approach 2: CustomEncoding typealias

typealias CustomBase64Coding = CustomCoding<CustomBase64Coder>

struct MyType: Codable {
    @CustomBase64Coding
    var myData: Data // Now uses the CustomBase64Coder for serialization
}
```

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

If there's a standard Serialization strategy you'd like added, please open an issue to request it to be added and/or implement it and create a pull request with passing Unit Tests.
