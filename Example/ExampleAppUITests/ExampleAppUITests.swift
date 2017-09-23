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
        let app = XCUIApplication()
        app.navigationBars["PresenterKit"].buttons["Popover"].tap()
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
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
        app/*@START_MENU_TOKEN@*/.otherElements["PopoverDismissRegion"]/*[[".otherElements[\"dismiss popup\"]",".otherElements[\"PopoverDismissRegion\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

    func test_custom() {
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Custom (\"Half Modal\")"]/*[[".cells.staticTexts[\"Custom (\\\"Half Modal\\\")\"]",".staticTexts[\"Custom (\\\"Half Modal\\\")\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).tap()
    }
}
