////
////  DataDecodingTests.swift
////
////  Created by PJ Fechner on 10/13/19.
////  Copyright © 2019 PJ Fechner. All rights reserved.
//
import CodableWrappers
import Foundation
import Quick
import Nimble

class OtherTests: QuickSpec, DecodingTestSpec, EncodingTestSpec {

    override func spec() {
        describe("Decoder") {
            it("Stuff") {
                let data = try! self.jsonEncoder.encode(TestThing(testString: "Hi"))
                let json = String(data: data, encoding: .utf8)!
                print(json)
                let decoded = try! self.jsonDecoder.decode(TestThing.self, from: data)
                print(decoded)
            }
        }
    }
}

struct TestThing: Codable {
    let testString: String

    enum CodingKeys: String, SnakeCaseCodingKey {
        case testString
    }
}

protocol SnakeCaseCodingKey: CodingKey where Self: RawRepresentable, Self.RawValue == String {

}

extension SnakeCaseCodingKey {
    var stringValue: String {
        Self.convertToSnakeCase(rawValue)
    }

    fileprivate static func convertToSnakeCase(_ stringKey: String) -> String {
        guard !stringKey.isEmpty else { return stringKey }

        var words : [Range<String.Index>] = []
        // The general idea of this algorithm is to split words on transition from lower to upper case, then on transition of >1 upper case characters to lowercase
        //
        // myProperty -> my_property
        // myURLProperty -> my_url_property
        //
        // We assume, per Swift naming conventions, that the first character of the key is lowercase.
        var wordStart = stringKey.startIndex
        var searchRange = stringKey.index(after: wordStart)..<stringKey.endIndex

        // Find next uppercase character
        while let upperCaseRange = stringKey.rangeOfCharacter(from: CharacterSet.uppercaseLetters, options: [], range: searchRange) {
            let untilUpperCase = wordStart..<upperCaseRange.lowerBound
            words.append(untilUpperCase)

            // Find next lowercase character
            searchRange = upperCaseRange.lowerBound..<searchRange.upperBound
            guard let lowerCaseRange = stringKey.rangeOfCharacter(from: CharacterSet.lowercaseLetters, options: [], range: searchRange) else {
                // There are no more lower case letters. Just end here.
                wordStart = searchRange.lowerBound
                break
            }

            // Is the next lowercase letter more than 1 after the uppercase? If so, we encountered a group of uppercase letters that we should treat as its own word
            let nextCharacterAfterCapital = stringKey.index(after: upperCaseRange.lowerBound)
            if lowerCaseRange.lowerBound == nextCharacterAfterCapital {
                // The next character after capital is a lower case character and therefore not a word boundary.
                // Continue searching for the next upper case for the boundary.
                wordStart = upperCaseRange.lowerBound
            } else {
                // There was a range of >1 capital letters. Turn those into a word, stopping at the capital before the lower case character.
                let beforeLowerIndex = stringKey.index(before: lowerCaseRange.lowerBound)
                words.append(upperCaseRange.lowerBound..<beforeLowerIndex)

                // Next word starts at the capital before the lowercase we just found
                wordStart = beforeLowerIndex
            }
            searchRange = lowerCaseRange.upperBound..<searchRange.upperBound
        }
        words.append(wordStart..<searchRange.upperBound)
        let result = words.map({ (range) in
            return stringKey[range].lowercased()
        }).joined(separator: "_")
        return result
    }
}

//
//protocol TransientCoding: Codable {
//    associatedtype T: Codable
//    var wrappedValue: T { get }
//    init(wrappedValue: T)
//}
//
//extension TransientCoding {
//
//    init(from decoder: Decoder) throws {
//        self.init(wrappedValue: try T(from: decoder))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        try wrappedValue.encode(to: encoder)
//    }
//}
//
//@propertyWrapper
//struct VarWrapper<T: Codable>: Codable {
//    var wrappedValue: T
//
//    init(wrappedValue: T) {
//        self.wrappedValue = wrappedValue
//    }
//}
//
//@propertyWrapper
//struct Immutable<T:Codable>: TransientCoding {
//    let wrappedValue: T
//
//    init(wrappedValue: T) {
//        self.wrappedValue = wrappedValue
//    }
//}
//
//extension Immutable: Equatable where T: Equatable {
//
//}
//
//class Test {
//
//    @VarWrapper var test: String
//
//    init(test: String) {
//        self.test = test
////        self._test = .init(wrappedValue: .init(wrappedValue: test))
////        self.test =
////        self.test = LetWrapper(wrappedValue: test)
//    }
//    func doAThing() {
////        self._test = .init(wrappedValue: .init(wrappedValue: test))
//    }
//
////    func test()
//}
//
//@propertyWrapper
//struct EncUses<SEncoder: StaticEncoder, T: Encodable> {
//    let wrappedValue: T
//
//    init(wrappedValue: T) {
//        self.wrappedValue = wrappedValue
//    }
//}
//
//extension EncUses: Encodable {
//
//    func encode(to encoder: Encoder) throws {
//        if let thing = wrappedValue as? StaticEncoder.OriginalType? {
//            print("hi")
//        }
//        if let moreSpecific = self as? MoreSpecific {
//            try moreSpecific.encode(to: encoder)
//        }
//        print("hi")
//    }
//}
//
//protocol MoreSpecific: Encodable {}
//extension EncUses: MoreSpecific where T == SEncoder.OriginalType {
//    func encode(to encoder: Encoder) throws {
//        print("here")
//        try SEncoder.encode(value: wrappedValue, to: encoder)
//    }
//}
//
//extension EncUses where T == SEncoder.OriginalType? {
//
//    func encode(to encoder: Encoder) throws {
//        print("OrHere")
//        if let value = wrappedValue {
//            try SEncoder.encode(value: value, to: encoder)
//        }
//    }
//}
//
//
//struct MyTestType: Encodable {
//    @EncUses<SecondsSince1970DateStaticCoder, Date>
//    var realTest: Date
//
////    @EncUses<SecondsSince1970DateStaticCoder, Date?>
//    var otherTest: Date?
//}
//
//
////public struct ContainerTest: Codable {
////    let internalType: TestType
////}
//
////public struct TestType: Codable {
////
////    @MyWrapper
////    var myText: String
////}
////
////@propertyWrapper public struct MyWrapper: TestCodingWrapper {
////    public let wrappedValue: String
////    public init(wrappedValue: String) {
////        self.wrappedValue = wrappedValue
////    }
////
////    public init(from decoder: Decoder) throws {
////        self.wrappedValue = try String(from: decoder)
////    }
////
////    public func encode(to encoder: Encoder) throws {
////        try wrappedValue.encode(to: encoder)
////    }
////
////    struct CodingKeys: CodingKey {
////        var stringValue: String
////
////        init?(stringValue: String) {
////            self.stringValue = stringValue
////        }
////
////        var intValue: Int?
////
////        init?(intValue: Int) {
////            self.intValue = intValue
////            self.stringValue = String(intValue)
////        }
////    }
////}
//
////extension KeyedEncodingContainer {
////    // Used to make make sure OptionalCodingWrappers encode no value when it's wrappedValue is nil.
////    public mutating func encode<T>(_ value: T, forKey key: KeyedEncodingContainer<K>.Key) throws where T: Encodable, T: TestCodingWrapper {
//////        nestedContainer(keyedBy: MyWrapper.CodingKeys, forKey: MyWrapper.CodingKeys(stringValue: "test")!)
////        path
////        KeyedEncodingContainer<MyWrapper.CodingKeys>.init(self)
////////        let encoder = superEncoder()
//////
////////        var newContainer = encoder.container(keyedBy: TestCodingKey.self)
//////        try encodeIfPresent(value, forKey: Key(stringValue: "test")!)
////    }
////}
////
//struct TestCodingKey: CodingKey {
//    var stringValue: String
//
//    init?(stringValue: String) {
//        self.stringValue = stringValue
//    }
//
//    var intValue: Int?
//
//    init?(intValue: Int) {
//        self.intValue = intValue
//        self.stringValue = String(intValue)
//    }
//}
//
//
//
////private let testItem = Parent(child: Child(name: "Charley"))
////
////private struct Child: Codable {
////    let name: String
////}
////private struct Parent: Codable {
////
////    var child: Child
////}
//
////private struct FlattenedCoding<T: Codable>: StaticCoder {
////    static func decode(from decoder: Decoder) throws -> T {
////        return try T(from: decoder)
////    }
////
////    static func encode(value: T, to encoder: Encoder) throws {
////        try value.encode(to: encoder)
////    }
////}
//
////@propertyWrapper
////struct MyWrapper: Codable, OmittableType {
////    static var nilValue: MyWrapper = MyWrapper(wrappedValue: nil)
////
////    var wrappedValue: String?
////    init(wrappedValue: String?) {
////        self.wrappedValue = wrappedValue
////    }
////    init(from decoder: Decoder) throws {
////        wrappedValue = try? String(from: decoder)
////    }
////
////    func encode(to encoder: Encoder) throws {
////
////        if let wrappedValue = wrappedValue {
////            try wrappedValue.encode(to: encoder)
////        }
//////        else {
//////            var container = encoder.singleValueContainer()
//////            try container.encodeNil()
//////        }
////    }
////}
//
////struct MyType: Codable {
////
////    @MillisecondsSince1970DateOptionalCoding
////    var date: Date?
////}
