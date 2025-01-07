# CodableWrappers
[![API Docs](http://img.shields.io/badge/Read_the-docs-2196f3.svg)](https://swiftpackageindex.com/GottaGetSwifty/CodableWrappers/documentation/codablewrappers)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGottaGetSwifty%2FCodableWrappers%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/GottaGetSwifty/CodableWrappers)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FGottaGetSwifty%2FCodableWrappers%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/GottaGetSwifty/CodableWrappers)
[![codecov](https://codecov.io/github/GottaGetSwifty/CodableWrappers/graph/badge.svg?token=3F2A9MM6ED)](https://codecov.io/github/GottaGetSwifty/CodableWrappers)

## Simplified Serialization with [Property Wrappers](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md)

Make Complex Codable Serialization a breeze with declarative annotations!

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

## Documentation

[Full DocC documentation here](https://swiftpackageindex.com/GottaGetSwifty/CodableWrappers/documentation/codablewrappers) thanks to the Swift Package Index!

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

\***WARNING*** CocoaPods is not supported from version 3.0 to avoid complications with Swift Macros.
--- 


```ruby
pod 'CodableWrappers', '~> 2.0.0'
```

## Available CodingKey Macros

- [@CustomCodable](CodingKeyMacrosDocumentation.md/#customcodable)
- [@CustomCodingKey(String)](CodingKeyMacrosDocumentation.md/#customcodingkeystring)
- [@CodingKeyPrefix(String)](CodingKeyMacrosDocumentation.md/#codingkeyprefixstring)
- [@CodingKeySuffix(String)](CodingKeyMacrosDocumentation.md/#codingkeysuffixstring)
- [@CamelCase](CodingKeyMacrosDocumentation.md/#camelcase)
- [@FlatCase](CodingKeyMacrosDocumentation.md/#flatcase)
- [@PascalCase](CodingKeyMacrosDocumentation.md/#pascalcase)
- [@UpperCase](CodingKeyMacrosDocumentation.md/#uppercase)
- [@SnakeCase](CodingKeyMacrosDocumentation.md/#snakecase)
- [@CamelSnakeCase](CodingKeyMacrosDocumentation.md/#camelsnakecase)
- [@PascalSnakeCase](CodingKeyMacrosDocumentation.md/#pascalsnakecase)
- [@ScreamingSnakeCase](CodingKeyMacrosDocumentation.md/#screamingsnakecase)
- [@KebabCase](CodingKeyMacrosDocumentation.md/#kebabcase)
- [@CamelKebabCase](CodingKeyMacrosDocumentation.md/#camelkebabcase)
- [@PascalKebabCase](CodingKeyMacrosDocumentation.md/#pascalkebabcase)
- [@ScreamingKebabCase](CodingKeyMacrosDocumentation.md/#screamingkebabcase)

## Available Property Wrappers

- [@EncodeNulls](PropertyWrappersDocumentation.md/#encodenulls)
- [Lossy Collections](PropertyWrappersDocumentation.md/#lossy-collections)
- [Empty Defaults](PropertyWrappersDocumentation.md/#empty-defaults)
- [Other Fallbacks](PropertyWrappersDocumentation.md/#other-fallbacks)
- [@OmitCoding](PropertyWrappersDocumentation.md/#omitcoding)
- [@Base64Coding](PropertyWrappersDocumentation.md/#base64coding)
- [@SecondsSince1970DateCoding](PropertyWrappersDocumentation.md/#secondssince1970datecoding)
- [@MillisecondsSince1970DateCoding](PropertyWrappersDocumentation.md/#millisecondssince1970datecoding)
- [@DateFormatterCoding\<DateFormatterStaticCoder>](PropertyWrappersDocumentation.md/#dateformattercodingdateformatterstaticcoder)
- [@ISO8601Coding](PropertyWrappersDocumentation.md/#iso8601coding)
- [@ISO8601DateFormatStyleCoding\<ISO8601DateFormatterStaticCoder>](PropertyWrappersDocumentation.md/#iso8601dateformatstylecodingiso8601dateformatstylestaticcoder)
- [@NonConformingFloatCoding\<ValueProvider>](PropertyWrappersDocumentation.md/#nonconformingfloatcodingvalueprovider)
- [@NonConformingDoubleCoding\<ValueProvider>](PropertyWrappersDocumentation.md/#nonconformingdoublecodingvalueprovider)
- [Bool Coding](PropertyWrappersDocumentation.md/#bool-coding)
- [Additional Customization](PropertyWrappersDocumentation.md/#additional-customization)
- [Property Mutability](PropertyWrappersDocumentation.md/#property-mutability)
- [Only Encoding or Decoding](PropertyWrappersDocumentation.md/#only-encoding-or-decoding)

## Additional Customization

- [Property Mutability](PropertyWrappersDocumentation.md/#property-mutability)
- [Optionals](PropertyWrappersDocumentation.md/#optionals)
- [Only Encoding or Decoding](PropertyWrappersDocumentation.md/#only-encoding-or-decoding)

## Additional Links

- [Introduction Blog Post](https://www.getswifty.blog/blog/making-custom-serialization-a-breeze-in-swift-51-with-property-wrappers)
- [Custom Examples](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/CustomExamples.md)
- [Release Notes](https://github.com/GottaGetSwifty/CodableWrappers/blob/master/ReleaseNotes.md)

---

## Compatibility

- 3.x supports Swift 5.9+  
- 2.x supports Swift 5.2+
- 1.x supports Swift 5.1+

---

## Contributions

If there is a standard Serialization or Coding Key strategy that could be added feel free to open an issue requesting it and/or submit a pull request with the new option.
