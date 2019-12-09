////
////  DataDecodingTests.swift
////
////  Created by PJ Fechner on 10/13/19.
////  Copyright © 2019 PJ Fechner. All rights reserved.
//
//import CodableWrappers
//import Foundation
//import Quick
//import Nimble
//
//class OtherTests: QuickSpec {
//
//    override func spec() {
//        describe("Decoder") {
//            it("Stuff") {
//                let testJSON = #"{ "myText" : "1" }"#
////                let testJSON = #"{  }"#
//
////                let jsonData = testJSON.data(using: .utf8)!
//                do {
////                    let decoded = try JSONDecoder().decode(TestType.self, from: jsonData)
////                    print(decoded)
//                    let encoded = try JSONEncoder().encode(ContainerTest(internalType: TestType(myText: "hi")))
//                    let json = String(data: encoded, encoding: .utf8)!
//                    print(json)
//                }
//                catch let error {
//                    print(error)
//                }
//            }
//        }
//    }
//}
//
//struct IntAsBoolStaticCoder: StaticCoder {
//
//    static func decode(from decoder: Decoder) throws -> Bool {
//        let intValue = try Int(from: decoder)
//        return intValue > 0 ? true : false
//    }
//
//    static func encode(value: Bool, to encoder: Encoder) throws {
//        try (value ? 1 : 0).encode(to: encoder)
//    }
//}
//
//typealias IntAsBoolOptionalCoding = CodingUses<OptionalStaticCoder<IntAsBoolStaticCoder>>
//
//class MyType: Codable {
//    @IntAsBoolOptionalCoding
//    var myBool: Bool?
//    @OmitCoding
//    var myStringNotToBeSerialized: String?
//}
//
//
//public struct ContainerTest: Codable {
//    let internalType: TestType
//}
//
//public struct TestType: Codable {
//
//    @MyWrapper
//    var myText: String
//}
//
//@propertyWrapper public struct MyWrapper: TestCodingWrapper {
//    public let wrappedValue: String
//    public init(wrappedValue: String) {
//        self.wrappedValue = wrappedValue
//    }
//
//    public init(from decoder: Decoder) throws {
//        self.wrappedValue = try String(from: decoder)
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        try wrappedValue.encode(to: encoder)
//    }
//
//    struct CodingKeys: CodingKey {
//        var stringValue: String
//
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//
//        var intValue: Int?
//
//        init?(intValue: Int) {
//            self.intValue = intValue
//            self.stringValue = String(intValue)
//        }
//    }
//}
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
