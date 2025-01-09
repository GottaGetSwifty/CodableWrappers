//
//  File.swift
//  
//
//  Created by PJ Fechner on 10/21/19.
//

import CodableWrappers
import Foundation
//import Quick
//import Nimble

import Testing

struct CompositionTests {
    struct StaticCoder: CodingTests {
        @Test func customDecodingEncodesWithDefaults() async throws {
            let currentDate = Date()
            let encodingModel = DecodingModel(time: currentDate)
            let encoded = try Self.jsonEncoder.encode(encodingModel)
            let decoded = try Self.jsonDecoder.decode(DecodingModel.self, from: encoded)
            #expect(decoded.time.timeIntervalSince1970 == currentDate.timeIntervalSinceReferenceDate)
        }

        @Test func customEncodingDecodesWithDefaults() async throws {
            let currentDate = Date()
            let encodingModel = EncodingModel(time: currentDate)
            let encoded = try Self.jsonEncoder.encode(encodingModel)
            let decoded = try Self.jsonDecoder.decode(EncodingModel.self, from: encoded)
            #expect(decoded.time.timeIntervalSinceReferenceDate == currentDate.timeIntervalSince1970)
        }
    }
}

private struct DecodingModel: Codable {
    @Immutable @SecondsSince1970DateDecoding
    var time: Date
}

private struct EncodingModel: Codable {
    @SecondsSince1970DateEncoding
    var time: Date
}

