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
}
