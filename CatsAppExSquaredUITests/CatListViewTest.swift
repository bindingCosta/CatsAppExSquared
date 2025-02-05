//
//  CatDetailsViewTest.swift
//  CatsAppExSquaredUITests
//
//  Created by Marcelo Costa on 06/02/25.
//

import XCTest

class CatListViewTests: XCTestCase {
    
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
        
        // Wait for the CatListView to load
        let catListViewText = app.staticTexts["The Cats App"]
        
        // Ensure that the CatListView is now visible by checking for an element from that view.
        let existsPredicate = NSPredicate(format: "exists == 1")
        expectation(for: existsPredicate, evaluatedWith: catListViewText, handler: nil)
        
        // Waiting for up to 5 seconds for the view to load.
        waitForExpectations(timeout: 5, handler: nil)
        
        // Verify that the text is visible on the screen
        XCTAssertTrue(catListViewText.exists)
    }
}



