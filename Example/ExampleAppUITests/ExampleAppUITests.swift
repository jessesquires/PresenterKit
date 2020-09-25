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

import UIKit
import XCTest

final class ExampleAppUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func test_popover() {
        let app = XCUIApplication()
        app.navigationBars["PresenterKit"].buttons["Popover"].tap()
        app.otherElements["PopoverDismissRegion"].tap()
    }

    func test_push() {
        let app = XCUIApplication()
        app.tables.staticTexts["Push"].tap()
        app.navigationBars["Red View"].buttons["PresenterKit"].tap()
    }

    func test_modal() {
        let app = XCUIApplication()
        app.tables.staticTexts["Modal"].tap()
        app.navigationBars["Red View"].children(matching: .button).element.tap()
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
        app.otherElements["PopoverDismissRegion"].tap()
    }

    func test_halfModal() {
        let app = XCUIApplication()
        app.tables.staticTexts["Custom (\"Half Modal\")"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).tap()
    }
}
