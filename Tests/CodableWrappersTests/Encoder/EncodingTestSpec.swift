//
//  EncodingTestSpec.swift
//
//  Base Test Spec for encoding with a simple JSON and PList encoders
//
//  Created by PJ Fechner on 10/13/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation
import Quick
import Nimble

protocol EncodingTestSpec {
    var jsonEncoder: JSONEncoder { get }
    var plistEncoder: PropertyListEncoder { get }
}

extension EncodingTestSpec {
    var jsonEncoder: JSONEncoder {
            let encoder = JSONEncoder()
    //        if #available(OSX 10.13, *) {
    //            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    //        } else {
                encoder.outputFormatting = [.prettyPrinted]
    //        }
            return encoder
        }

    var plistEncoder: PropertyListEncoder {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        return encoder
    }
}
