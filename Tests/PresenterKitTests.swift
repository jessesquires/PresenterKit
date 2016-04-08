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

    func test_thatViewController_appliesStyle_withNavigation() {
        let controller = UIViewController()
        let nav = controller.withNavigationStyle(.withNavigation) as! UINavigationController
        XCTAssertEqual(controller, nav.topViewController)
    }

    func test_thatViewController_appliesStyle_withNavigation_none() {
        let controller = UIViewController()
        let other = controller.withNavigationStyle(.none)
        XCTAssertEqual(controller, other)
    }

    func test_thatViewController_appliesStyle_withPresentation() {
        let controller = UIViewController()
        let other = controller.withPresentation(.FormSheet)
        XCTAssertEqual(controller, other)
        XCTAssertEqual(controller.modalPresentationStyle, UIModalPresentationStyle.FormSheet)
        XCTAssertEqual(other.modalPresentationStyle, UIModalPresentationStyle.FormSheet)

        let controller2 = UIViewController()
        let other2 = controller2.withPresentation(.PageSheet)
        XCTAssertEqual(controller2, other2)
        XCTAssertEqual(controller2.modalPresentationStyle, UIModalPresentationStyle.PageSheet)
        XCTAssertEqual(other2.modalPresentationStyle, UIModalPresentationStyle.PageSheet)

        let controller3 = UIViewController()
        let other3 = controller3.withPresentation(.Custom)
        XCTAssertEqual(controller3, other3)
        XCTAssertEqual(controller3.modalPresentationStyle, UIModalPresentationStyle.Custom)
        XCTAssertEqual(other3.modalPresentationStyle, UIModalPresentationStyle.Custom)
    }

    func test_thatViewController_appliesStyle_withTransition() {
        let controller = UIViewController()
        let other = controller.withTransition(.CoverVertical)
        XCTAssertEqual(controller, other)
        XCTAssertEqual(controller.modalTransitionStyle, UIModalTransitionStyle.CoverVertical)
        XCTAssertEqual(other.modalTransitionStyle, UIModalTransitionStyle.CoverVertical)

        let controller2 = UIViewController()
        let other2 = controller2.withTransition(.CrossDissolve)
        XCTAssertEqual(controller2, other2)
        XCTAssertEqual(controller2.modalTransitionStyle, UIModalTransitionStyle.CrossDissolve)
        XCTAssertEqual(other2.modalTransitionStyle, UIModalTransitionStyle.CrossDissolve)

        let controller3 = UIViewController()
        let other3 = controller3.withTransition(.FlipHorizontal)
        XCTAssertEqual(controller3, other3)
        XCTAssertEqual(controller3.modalTransitionStyle, UIModalTransitionStyle.FlipHorizontal)
        XCTAssertEqual(other3.modalTransitionStyle, UIModalTransitionStyle.FlipHorizontal)
    }

    func test_thatViewController_appliesStyles_withStyles() {
        let controller = UIViewController()
        let other = controller.withStyles(navigation: .withNavigation,
                                          presentation: .OverCurrentContext,
                                          transition: .PartialCurl) as! UINavigationController
        XCTAssertEqual(controller, other.topViewController)
        XCTAssertEqual(controller.modalPresentationStyle, UIModalPresentationStyle.OverCurrentContext)
        XCTAssertEqual(controller.modalTransitionStyle, UIModalTransitionStyle.PartialCurl)

        let controller2 = UIViewController()
        let other2 = controller2.withStyles(navigation: .none,
                                          presentation: .None,
                                          transition: .CoverVertical)
        XCTAssertEqual(controller2, other2)
        XCTAssertEqual(controller2.modalPresentationStyle, UIModalPresentationStyle.None)
        XCTAssertEqual(controller2.modalTransitionStyle, UIModalTransitionStyle.CoverVertical)
    }

    func test_thatViewController_presentsViewController_withPresentationType_push() {
        let firstController = UINavigationController()
        let secondController = UIViewController()
        firstController.presentViewController(secondController, type: .push, animated: false)

        XCTAssertNotNil(secondController.navigationController)
        XCTAssertEqual(firstController.topViewController, secondController)
    }

    func test_thatViewController_presentsViewController_withPresentationType_push_embedded() {
        let firstController = UIViewController()
        let navController = UINavigationController(rootViewController: firstController)
        XCTAssertEqual(navController.topViewController, firstController)

        let secondController = UIViewController()
        firstController.presentViewController(secondController, type: .push, animated: false)

        XCTAssertNotNil(secondController.navigationController)
        XCTAssertEqual(navController.topViewController, secondController)
    }

    func test_thatViewController_presentsViewController_withPresentationType_show() {
        let firstController = UINavigationController()
        let secondController = UIViewController()
        firstController.presentViewController(secondController, type: .show, animated: false)

        XCTAssertNotNil(secondController.navigationController)
        XCTAssertEqual(firstController.topViewController, secondController)
    }

    func test_thatViewController_presentsViewController_withPresentationType_modal() {
        let firstController = UIViewController()
        let secondController = UIViewController()
        let type = PresentationType.modal(.none, .FormSheet, .CrossDissolve)
        firstController.presentViewController(secondController, type: type, animated: false) {
            XCTAssertEqual(firstController.presentedViewController, secondController)

            XCTAssertNil(secondController.navigationController)
            XCTAssertEqual(secondController.presentingViewController, firstController)
            XCTAssertEqual(secondController.modalPresentationStyle, UIModalPresentationStyle.FormSheet)
            XCTAssertEqual(secondController.modalTransitionStyle, UIModalTransitionStyle.CrossDissolve)
        }
    }

    func test_thatViewController_presentsViewController_withPresentationType_modal_withNavigation() {
        let firstController = UIViewController()
        let secondController = UIViewController()
        let type = PresentationType.modal(.withNavigation, .FormSheet, .CrossDissolve)
        firstController.presentViewController(secondController, type: type, animated: false) {
            XCTAssertEqual(firstController.presentedViewController, secondController)
            XCTAssertEqual(firstController.presentedViewController, secondController.navigationController)

            XCTAssertNotNil(secondController.navigationController)
            XCTAssertEqual(secondController.presentingViewController, firstController)
            XCTAssertEqual(secondController.modalPresentationStyle, UIModalPresentationStyle.FormSheet)
            XCTAssertEqual(secondController.modalTransitionStyle, UIModalTransitionStyle.CrossDissolve)
        }
    }


    // MARK: Helpers

    func tapAction(sender: UIBarButtonItem) { }
}
