//
//  main.swift
//

import Foundation
import CodableMacros
print("CodableWrapperMacros Testing")

struct TestThing: Codable {
    let thing: String
}

//let testKey = "a_key"

@Codable @ScreamingSnakeCase
struct OtherThing: Codable {
    var thing: String { "hi" }
    @CodingKeyPrefix("asdf_")
    let oneThing: String
    @CodingKey("testKey")
    let twoThing: TestThing
    @SnakeCase
    private let threeThing: String

    func test() {
        @SnakeCase
        let test = "hi"
        print(test)
    }
}
