//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//
//  Documentation
//  https://jessesquires.github.io/PresenterKit
//
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//
//  License
//  Copyright © 2016-present Jesse Squires
//  Released under an MIT license: https://opensource.org/licenses/MIT
//

import XCTest
import UIKit


final class ExampleAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_popover() {
        let presenterkitNavigationBar = XCUIApplication().navigationBars["PresenterKit"]
        presenterkitNavigationBar.buttons["Popover"].tap()
        presenterkitNavigationBar.staticTexts["PresenterKit"].tap()
    }
    
    func test_push() {
        let app = XCUIApplication()
        app.tables.staticTexts["Push"].tap()
        app.navigationBars["Red View"].buttons["PresenterKit"].tap()
    }

    func test_modal() {
        let app = XCUIApplication()
        app.tables.staticTexts["Modal"].tap()
        app.navigationBars["Red View"].buttons["ic dismiss"].tap()
    }
    
    func test_show() {
        let app = XCUIApplication()
        app.tables.staticTexts["Show"].tap()
        app.navigationBars["Red View"].buttons["PresenterKit"].tap()
    }

    func test_showDetail() {
        let app = XCUIApplication()
        app.tables.staticTexts["ShowDetail"].tap()
        app.navigationBars["Red View"].buttons["Cancel"].tap()
    }

    func test_popoverFromView() {
        let app = XCUIApplication()
        app.tables.staticTexts["PopoverFromView"].tap()
        app.navigationBars["PresenterKit"].staticTexts["PresenterKit"].tap()
    }

    func test_custom() {
        let app = XCUIApplication()
        app.tables.staticTexts["Custom (\"Half Modal\")"].tap()
        app.navigationBars["PresenterKit"].staticTexts["PresenterKit"].tap()
    }
}
