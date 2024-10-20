import XCTest
import OSLog
import Foundation
@testable import SkipIt

let logger: Logger = Logger(subsystem: "SkipIt", category: "Tests")

@available(macOS 13, *)
final class SkipItTests: XCTestCase {
    func testSkipIt() throws {
        logger.log("running testSkipIt")
        XCTAssertEqual(1 + 2, 3, "basic test")
        
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipIt", testData.testModuleName)
    }
}

struct TestData : Codable, Hashable {
    var testModuleName: String
}