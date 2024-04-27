# ``CodableWrappers``

Easily customize you Codable Types!

## Overview

Make complicated serialization a breeze!:

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

## Topics

### Coding Keys

- <doc:CustomCodingKeys>

### Serialization Customization

- <doc:SerializationCustomization>



