//
//  File.swift
//  
//
//  Created by PJ Fechner on 10/21/19.
//

import CodableWrappers
import Foundation
import Quick
import Nimble

class CompositionTests: QuickSpec, DecodingTestSpec, EncodingTestSpec {
    override func spec() {
        describe("StaticCoder") {
            context("OnlyCustomDecoding") {
                it("EncodesWithDefault") {
                    let currentDate = Date()
                    let encodingModel = DecodingModel(time: currentDate)
                    let encoded = try! self.jsonEncoder.encode(encodingModel)
                    expect {_ = try self.jsonDecoder.decode(DecodingModel.self, from: encoded)}.toNot(throwError())
                    let decoded = try? self.jsonDecoder.decode(DecodingModel.self, from: encoded)
                    expect(decoded).toNot(beNil())
                    // This means it was decoded using the SecondsSince1970DateDecoding, but encoded using the default
                    expect(decoded?.time.timeIntervalSince1970) == currentDate.timeIntervalSinceReferenceDate
                }
            }
            context("OnlyCustomEncoding") {
                it("DecodesWithDefault") {
                    let currentDate = Date()
                    let encodingModel = EncodingModel(time: currentDate)
                    let encoded = try! self.jsonEncoder.encode(encodingModel)
                    expect {_ = try self.jsonDecoder.decode(EncodingModel.self, from: encoded)}.toNot(throwError())
                    let decoded = try? self.jsonDecoder.decode(EncodingModel.self, from: encoded)
                    expect(decoded).toNot(beNil())
                    // This means it was decoded using the SecondsSince1970DateDecoding, but encoded using the default
                    expect(decoded?.time.timeIntervalSinceReferenceDate) == currentDate.timeIntervalSince1970
                }
            }
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

