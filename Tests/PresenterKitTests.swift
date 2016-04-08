//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://www.jessesquires.com/PresenterKit
//
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//
//  License
//  Copyright © 2016-Present Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import XCTest
import UIKit

@testable import PresenterKit


final class PresenterKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_thatBarButtonItem_initializesWith_dismissConfig_default() {
        let config = DismissButtonConfig()
        XCTAssertEqual(config.location, DismissButtonConfig.Location.left)
        XCTAssertEqual(config.style.itemStyle, UIBarButtonItemStyle.Plain)
        XCTAssertEqual(config.text.systemItem, UIBarButtonSystemItem.Cancel)
        XCTAssertNil(config.text.title)

        let action = #selector(tapAction(_:))
        let item = UIBarButtonItem(config: config, target: self, action: action)
        
        XCTAssertEqual(item.style, config.style.itemStyle)
        XCTAssertTrue(item.target === self)
        XCTAssertEqual(item.action, action)
    }

    func test_thatBarButtonItem_initializesWith_dismissConfig_leftBoldCancel() {
        let config = DismissButtonConfig(location: .left, style: .bold, text: .systemItem(.Done))
        XCTAssertEqual(config.location, DismissButtonConfig.Location.left)
        XCTAssertEqual(config.style.itemStyle, UIBarButtonItemStyle.Done)
        XCTAssertEqual(config.text.systemItem, UIBarButtonSystemItem.Done)
        XCTAssertNil(config.text.title)

        let action = #selector(tapAction(_:))
        let item = UIBarButtonItem(config: config, target: self, action: action)

        XCTAssertEqual(item.style, config.style.itemStyle)
        XCTAssertTrue(item.target === self)
        XCTAssertEqual(item.action, action)
    }

    func test_thatBarButtonItem_initializesWith_dismissConfig_rightPlainCustomText() {
        let config = DismissButtonConfig(location: .right, style: .plain, text: .custom("title"))
        XCTAssertEqual(config.location, DismissButtonConfig.Location.right)
        XCTAssertEqual(config.style.itemStyle, UIBarButtonItemStyle.Plain)
        XCTAssertEqual(config.text.title, "title")
        XCTAssertNil(config.text.systemItem)

        let action = #selector(tapAction(_:))
        let item = UIBarButtonItem(config: config, target: self, action: action)

        XCTAssertEqual(item.style, config.style.itemStyle)
        XCTAssertTrue(item.target === self)
        XCTAssertEqual(item.action, action)
    }


    // MARK: Helpers

    func tapAction(sender: UIBarButtonItem) { }
}
