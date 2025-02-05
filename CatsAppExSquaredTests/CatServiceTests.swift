//
//  CatServiceTests.swift
//  CatsAppExSquaredTests
//
//  Created by Marcelo Costa on 06/02/25.
//

import XCTest
@testable import CatsAppExSquared

class CatServiceTests: XCTestCase {

    var catService: CatService!

    override func setUp() {
        super.setUp()
        catService = CatService(session: URLSession.shared)
    }

    override func tearDown() {
        catService = nil
        super.tearDown()
    }

    func testFetchCats_Success() async {
        do {
            let cats = try await catService.fetchCats(page: 1)
            /// We expect at least one cat in the response, otherwise, it should fail.
            XCTAssertGreaterThan(cats.count, 0)
            XCTAssertNotNil(cats.first?.id)
            XCTAssertNotNil(cats.first?.url)
            XCTAssertNotNil(cats.first?.breeds?.first?.name)
        } catch {
            XCTFail("Expected successful fetch, but got error: \(error)")
        }
    }

    func testFetchCats_Failure_InvalidURL() async {
        /// Temporarily simulate an invalid URL situation by modifying the base URL or handling the error
        let invalidService = CatService(session: MockInvalidURLSession())
        do {
            _ = try await invalidService.fetchCats(page: 1)
            XCTFail("Expected failure due to invalid URL")
        } catch {
            XCTAssertTrue(error is NetworkError)
        }
    }
}
