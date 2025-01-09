//
//  DecodingTestSpec.swift
//
//  Base Test Spec for decoding with a simple JSON and PList decoders
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation
import Quick
import Nimble

protocol CodingTests: DecodingTests, EncodingTests { }
extension CodingTests {

    static var emptyJSON: String { "{\n\n}" }
    static var emptyPList: String { """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
            <dict/>
        </plist>
        """
    }
}

protocol CodingTestSpec {

}
extension CodingTestSpec {

    static var emptyJSON: String { "{\n\n}" }
    static var emptyPList: String { """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
            <dict/>
        </plist>
        """
    }
}

protocol DecodingTests {
    static var jsonDecoder: JSONDecoder { get }
    static var plistDecoder: PropertyListDecoder { get }
}

protocol DecodingTestSpec: DecodingTests, CodingTestSpec {

}

extension DecodingTests {
    static var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }

    static var plistDecoder: PropertyListDecoder {
        let decoder = PropertyListDecoder()
        return decoder
    }
}
