import XCTest
import Quick

@testable import CodableWrappersTests
//@testable import CodableWrapperMacrosTests

let allTestClasses = [
//    CodingKeyMacroErrorTests.self,
//    CodingKeyMacroTests.self,
//    CodingKeyPrefixSuffixTests.self,
//    KeyConverterTests.self,

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
#if os(Linux)
@main struct Main {
    static func main() {
        QCKMain(allTestClasses)
    }
}
#endif
