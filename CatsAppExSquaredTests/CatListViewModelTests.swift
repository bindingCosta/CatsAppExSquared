//
//  CatListViewModelTests.swift
//  CatsAppExSquared
//
//  Created by Marcelo Costa on 05/02/25.
//

import XCTest
@testable import CatsAppExSquared


@MainActor
class CatListViewModelTests: XCTestCase {
    
    var viewModel: CatListViewModel!
    var mockCatService: MockCatService!
    
    override func setUp() {
        super.setUp()
        mockCatService = MockCatService() /// Creating a mock service
        viewModel = CatListViewModel(catService: mockCatService) /// Injecting mock service into the view model
    }
    
    override func tearDown() {
        viewModel = nil
        mockCatService = nil
        super.tearDown()
    }
    
    func testFetchCats_success() async {
        
        mockCatService.fetchCatsResult = [.mock] // A mock cat instance
        
        /// Trigger the function to fetch cats
        await viewModel.fetchCats()
        
        XCTAssertFalse(viewModel.cats.isEmpty, "Cats should be fetched successfully")
        XCTAssertEqual(viewModel.cats.count, 1, "Should have fetched one cat")
    }
    
    func testFetchCats_error() async {
        /// Prepare mock service to throw an error
        mockCatService.fetchCatsResult = nil
        mockCatService.fetchCatsError = NSError(domain: "", code: -1, userInfo: nil)
        
        await viewModel.fetchCats()
        
        /// Verify the error is handled correctly
        XCTAssertTrue(viewModel.error != nil, "An error should be handled")
    }
}

// Mock service to simulate the behavior of the real CatService
class MockCatService: CatServiceProtocol {
    var fetchCatsResult: [Cat]?
    var fetchCatsError: Error?
    
    func fetchCats(page: Int) async throws -> [Cat] {
        if let error = fetchCatsError {
            throw error
        }
        return fetchCatsResult ?? []
    }
}
