import XCTest
import Quick

@testable import CodableWrappersTests

let allTestClasses = [
    CustomFloatingPointDecoderTests.self,
    DataDecodingTests.self,
    DateDecodingTests.self,
    CustomFloatingPointEncoderTests.self,
    DataEncodingTests.self,
    DateEncodingTests.self,
]
Quick.QCKMain(allTestClasses)
