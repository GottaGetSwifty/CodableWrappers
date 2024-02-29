# Custom Coding Keys

**\*NEW in 3.0\*** Customize your Coding Keys to something like `@SnakeCase` in one line! 

## Requrements

Add the ``CCodable()`` Macro to your Type to easily customize your CodingKeys with one line of code!

## Overview

Make CodingKey customization easy!

```swift
// Your Code:
@CCodable
struct YourType: Codable {
    @CodingKey("your-Custom_naming")
    let firstProperty: String
    @SnakeCase
    let secondProperty: String
    @KebabCase
    let thirdProperty: String
    @CamelCase
    let fourth_property: String
}
```

Generates 

```swift
enum CodingKeys: String, CodingKey {
case firstProperty = "your-Custom_naming"
case secondProperty = "second_property"
case thirdProperty = "third-property"
case fourth_property = "fourthproperty"
}
```

You can even add it to the whole Type!

```swift
@CCodable SnakeCase
struct YourType: Codable {
    let firstProperty: String
    let secondProperty: String
    let thirdProperty: String
    let fourth_property: String
}
```


## Topics

### Prerequisites 

- ``CCodable()``

### Custom Keys

- ``CodingKey(_:)``
- ``CodingKeyPrefix(_:)``
- ``CodingKeySuffix(_:)``

### NamingConventions

- ``CamelCase()``
- ``FlatCase()``
- ``PascalCase()``
- ``UpperCase()``
- ``SnakeCase()``
- ``CamelSnakeCase()``
- ``PascalSnakeCase()``
- ``ScreamingSnakeCase()``
- ``KebabCase()``
- ``CamelKebabCase()``
- ``PascalKebabCase()``
- ``ScreamingKebabCase()``
