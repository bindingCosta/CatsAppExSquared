//
//  WelcomeViewModelTests.swift
//  CatsAppExSquaredTests
//
//  Created by Marcelo Costa on 06/02/25.
//

import XCTest
@testable import CatsAppExSquared

@MainActor
class WelcomeViewModelTests: XCTestCase {
    
    var viewModel: WelcomeViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = WelcomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testInitialState_IsNotNavigating() {
        XCTAssertFalse(viewModel.isNavigatingToCatsList)
    }
    
    func testStartNavigation_SetsIsNavigatingToTrue() {
        viewModel.startNavigation()
        XCTAssertTrue(viewModel.isNavigatingToCatsList)
    }
}
