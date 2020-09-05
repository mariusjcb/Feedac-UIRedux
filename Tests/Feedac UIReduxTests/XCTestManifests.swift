import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Feedac_UIReduxTests.allTests),
    ]
}
#endif
