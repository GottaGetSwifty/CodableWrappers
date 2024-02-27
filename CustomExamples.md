# CodableWrappers Custom Examples

Examples of ways to customize encoding

## IntToStringCoder

```swift
/// (en/de)codes an Int to a String rather than a number
struct IntToStringCoder: StaticCoder {

    static func decode(from decoder: Decoder) throws -> Int {
        let stringValue = try String(from: decoder)

        guard let value = Int(stringValue) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: "Expected \(Int.self)) but could not convert \(stringValue) to \(Int.self)"))
        }
        return value
    }

    static func encode(value: Int, to encoder: Encoder) throws {
        try "\(value)".encode(to: encoder)
    }
}
```

## ASCIIDataCoder

```swift
/// (en/de)codes a String to/from Data using ASCII
struct ASCIIDataCoder: StaticCoder {

    static func decode(from decoder: Decoder) throws -> String {
        let dataValue = try Data(from: decoder)

        guard let value = String(data: dataValue, encoding: .ascii) else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: decoder.codingPath,
                                                                    debugDescription: "Expected \(String.self)) but could not convert \(dataValue) to \(String.self)"))
        }
        return value
    }

    static func encode(value: String, to encoder: Encoder) throws {
        try value.data(using: .ascii)?.encode(to: encoder)
    }
}
```

## IntAsBoolStaticCoder

```swift
struct IntAsBoolStaticCoder: StaticCoder {

    static func decode(from decoder: Decoder) throws -> Bool {
        let intValue = try Int(from: decoder)
        return intValue > 0 ? true : false
    }

    static func encode(value: Bool, to encoder: Encoder) throws {
        try (value ? 1 : 0).encode(to: encoder)
    }
}

struct MyType: Codable {
    @CodingUses<IntAsBoolStaticCoder>
    var myBool: Bool
}
```
