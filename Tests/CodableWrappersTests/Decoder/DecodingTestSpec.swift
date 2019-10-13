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

class DecodingTestSpec: QuickSpec {
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()

    let plistDecoder: PropertyListDecoder = {
        let decoder = PropertyListDecoder()
        return decoder
    }()
}
