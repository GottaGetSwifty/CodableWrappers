# ``CodableWrappers``

Easily customize you Codable Types!

## Overview

Make complicated serialization a breeze!:

```swift
@CCodable @SnakeCase
struct User: Codable {
    let firstName: String
    let lastName: String
    
    let joinDate: Date
}
```

## Topics

### Coding Keys

- <doc:CustomCodingKeys>

### Serialization Customization

- <doc:SerializationCustomization>



