# CodingKey Macros Documentation

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
</details>
