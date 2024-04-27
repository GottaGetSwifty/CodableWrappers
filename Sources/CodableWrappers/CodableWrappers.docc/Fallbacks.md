# Fallback Values

For when you want a value, even when there wasn't a value

## Discussion

Fallback Values are used in conjuction with a Type adopting ``FallbackValueProvider``

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

## Topics

### FallbackCoding

- ``FallbackCoding``
- ``FallbackEncoding``
- ``FallbackDecoding``
- ``FallbackValueProvider``

### Value Provider Options

- ``BoolFalse``
- ``BoolTrue``
- ``EmptyBool``
- ``EmptyString``
- ``EmptyInt``
- ``EmptyInt16``
- ``EmptyInt32``
- ``EmptyInt64``
- ``EmptyInt8``
- ``EmptyUInt``
- ``EmptyUInt16``
- ``EmptyUInt32``
- ``EmptyUInt64``
- ``EmptyUInt8``
- ``EmptyCGFloat``
- ``EmptyDouble``
- ``EmptyFloat``
- ``EmptyFloat16``
- ``EmptyArray``
- ``EmptyDictionary``
- ``EmptySet``
