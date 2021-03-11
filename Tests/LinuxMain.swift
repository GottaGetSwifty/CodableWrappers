import XCTest
import Quick

@testable import CodableWrappersTests

let allTestClasses = [
    BoolDecodingTests.self,
    CustomFloatingPointDecoderTests.self,
    DataDecodingTests.self,
    DateDecodingTests.self,
    EmptyDefaultsDecodingTests.self,
    LossyCollectionDecodingTests.self,
    OptionalDecodingTests.self,
    BoolEncodingTests.self,
    CustomFloatingPointEncoderTests.self,
    DataEncodingTests.self,
    DateEncodingTests.self,
    EmptyDefaultsEncodingTests.self,
    NullEncodingTests.self,
    OptionalEncodingTests.self,
    CompositionTests.self,
    PartialImplementationTests.self,
]
Quick.QCKMain(allTestClasses)
