//
//  DataDecodingTests.swift
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import CodableWrappers
import Foundation
import Quick
import Nimble

class OtherTests: QuickSpec {

    override func spec() {
        describe("Decoder") {
            it("Stuff") {
//                let testJSON = #"{ "date" : 590277534123 }"#
//                let testJSON = #"{  }"#
//
//                let jsonData = testJSON.data(using: .utf8)!
//                do {
//                    let decoded = try JSONDecoder().decode(MyType.self, from: jsonData)
//                    print(decoded)
//                    let encoded = try JSONEncoder().encode(decoded)
//                    let json = String(data: encoded, encoding: .utf8)
//                }
//                catch let error {
//                    print(error)
//                }
//}
//                let json = try! JSONEncoder().encode(testItem)
//                let jsonString = String.init(data: json, encoding: .utf8)
//                print(jsonString)
//                print("here")
            }
        }
    }
}

//private let testItem = Parent(child: Child(name: "Charley"))
//
//private struct Child: Codable {
//    let name: String
//}
//private struct Parent: Codable {
//
//    var child: Child
//}

//private struct FlattenedCoding<T: Codable>: StaticCoder {
//    static func decode(from decoder: Decoder) throws -> T {
//        return try T(from: decoder)
//    }
//
//    static func encode(value: T, to encoder: Encoder) throws {
//        try value.encode(to: encoder)
//    }
//}

//@propertyWrapper
//struct MyWrapper: Codable, OmittableType {
//    static var nilValue: MyWrapper = MyWrapper(wrappedValue: nil)
//
//    var wrappedValue: String?
//    init(wrappedValue: String?) {
//        self.wrappedValue = wrappedValue
//    }
//    init(from decoder: Decoder) throws {
//        wrappedValue = try? String(from: decoder)
//    }
//
//    func encode(to encoder: Encoder) throws {
//
//        if let wrappedValue = wrappedValue {
//            try wrappedValue.encode(to: encoder)
//        }
////        else {
////            var container = encoder.singleValueContainer()
////            try container.encodeNil()
////        }
//    }
//}

struct MyType: Codable {

    @MillisecondsSince1970DateOptionalCoding
    var date: Date?
}
