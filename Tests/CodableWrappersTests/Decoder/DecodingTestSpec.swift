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

protocol DecodingTestSpec {
    var jsonDecoder: JSONDecoder { get }
    var plistDecoder: PropertyListDecoder { get }
}

extension DecodingTestSpec {
    var jsonDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }

    var plistDecoder: PropertyListDecoder {
        let decoder = PropertyListDecoder()
        return decoder
    }

    static var emptyJSON: String { "{ }" }
    static var emptyPList: String { """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
            <dict>
            </dict>
        </plist>
        """
    }
}
