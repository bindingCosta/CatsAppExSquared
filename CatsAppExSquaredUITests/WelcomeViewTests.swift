//
//  CatsAppExSquaredUITests.swift
//  CatsAppExSquaredUITests
//
//  Created by Marcelo Costa on 05/02/25.
//

import XCTest

class CatsAppExSquaredUITests: XCTestCase {
    
    func testWelcomeViewNavigation() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Ensure the WelcomeView is loaded by checking for the presence of the "Welcome to CatsApp!" text.
        let welcomeText = app.staticTexts["Welcome to CatsApp!"]
        XCTAssertTrue(welcomeText.exists)
        
        // Tap the "See Cats" button to navigate to the CatListView
        let seeCatsButton = app.buttons["See Cats"]
        XCTAssertTrue(seeCatsButton.exists)
        seeCatsButton.tap()
        
        // Ensure that the CatListView is now visible by checking for an element from that view.
        let catListViewText = app.staticTexts["The Cats App"]
        XCTAssertTrue(catListViewText.exists)
    }
}

