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

    func test_thatBarButtonItem_initializesWith_dismissConfig_default() {
        let config = DismissButtonConfig()
        XCTAssertEqual(config.location, DismissButtonConfig.Location.left)
        XCTAssertEqual(config.style.itemStyle, UIBarButtonItemStyle.plain)
        XCTAssertEqual(config.text.systemItem, UIBarButtonSystemItem.cancel)
        XCTAssertNil(config.text.title)

        let action = #selector(tapAction(sender:))
        let item = UIBarButtonItem(config: config, target: self, action: action)

        XCTAssertEqual(item.style, config.style.itemStyle)
        XCTAssertTrue(item.target === self)
        XCTAssertEqual(item.action, action)
    }

    func test_thatBarButtonItem_initializesWith_dismissConfig_leftBoldCancel() {
        let config = DismissButtonConfig(location: .left, style: .bold, text: .systemItem(.done))
        XCTAssertEqual(config.location, DismissButtonConfig.Location.left)
        XCTAssertEqual(config.style.itemStyle, UIBarButtonItemStyle.done)
        XCTAssertEqual(config.text.systemItem, UIBarButtonSystemItem.done)
        XCTAssertNil(config.text.title)

        let action = #selector(tapAction(sender:))
        let item = UIBarButtonItem(config: config, target: self, action: action)

        XCTAssertEqual(item.style, config.style.itemStyle)
        XCTAssertTrue(item.target === self)
        XCTAssertEqual(item.action, action)
    }

    func test_thatBarButtonItem_initializesWith_dismissConfig_rightPlainCustomText() {
        let config = DismissButtonConfig(location: .right, style: .plain, text: .custom("title"))
        XCTAssertEqual(config.location, DismissButtonConfig.Location.right)
        XCTAssertEqual(config.style.itemStyle, UIBarButtonItemStyle.plain)
        XCTAssertEqual(config.text.title, "title")
        XCTAssertNil(config.text.systemItem)

        let action = #selector(tapAction(sender:))
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
        let other = controller.withPresentation(.formSheet)
        XCTAssertEqual(controller, other)
        XCTAssertEqual(controller.modalPresentationStyle, UIModalPresentationStyle.formSheet)
        XCTAssertEqual(other.modalPresentationStyle, UIModalPresentationStyle.formSheet)

        let controller2 = UIViewController()
        let other2 = controller2.withPresentation(.pageSheet)
        XCTAssertEqual(controller2, other2)
        XCTAssertEqual(controller2.modalPresentationStyle, UIModalPresentationStyle.pageSheet)
        XCTAssertEqual(other2.modalPresentationStyle, UIModalPresentationStyle.pageSheet)

        let controller3 = UIViewController()
        let other3 = controller3.withPresentation(.custom)
        XCTAssertEqual(controller3, other3)
        XCTAssertEqual(controller3.modalPresentationStyle, UIModalPresentationStyle.custom)
        XCTAssertEqual(other3.modalPresentationStyle, UIModalPresentationStyle.custom)
    }

    func test_thatViewController_appliesStyle_withTransition() {
        let controller = UIViewController()
        let other = controller.withTransition(.coverVertical)
        XCTAssertEqual(controller, other)
        XCTAssertEqual(controller.modalTransitionStyle, UIModalTransitionStyle.coverVertical)
        XCTAssertEqual(other.modalTransitionStyle, UIModalTransitionStyle.coverVertical)

        let controller2 = UIViewController()
        let other2 = controller2.withTransition(.crossDissolve)
        XCTAssertEqual(controller2, other2)
        XCTAssertEqual(controller2.modalTransitionStyle, UIModalTransitionStyle.crossDissolve)
        XCTAssertEqual(other2.modalTransitionStyle, UIModalTransitionStyle.crossDissolve)

        let controller3 = UIViewController()
        let other3 = controller3.withTransition(.flipHorizontal)
        XCTAssertEqual(controller3, other3)
        XCTAssertEqual(controller3.modalTransitionStyle, UIModalTransitionStyle.flipHorizontal)
        XCTAssertEqual(other3.modalTransitionStyle, UIModalTransitionStyle.flipHorizontal)
    }

    func test_thatViewController_appliesStyles_withStyles() {
        let controller = UIViewController()
        let other = controller.withStyles(navigation: .withNavigation,
                                          presentation: .overCurrentContext,
                                          transition: .partialCurl) as! UINavigationController
        XCTAssertEqual(controller, other.topViewController)
        XCTAssertEqual(controller.modalPresentationStyle, UIModalPresentationStyle.overCurrentContext)
        XCTAssertEqual(controller.modalTransitionStyle, UIModalTransitionStyle.partialCurl)

        let controller2 = UIViewController()
        let other2 = controller2.withStyles(navigation: .none,
                                            presentation: .none,
                                            transition: .coverVertical)
        XCTAssertEqual(controller2, other2)
        XCTAssertEqual(controller2.modalPresentationStyle, UIModalPresentationStyle.none)
        XCTAssertEqual(controller2.modalTransitionStyle, UIModalTransitionStyle.coverVertical)
    }

    func test_thatViewController_presentsViewController_withPresentationType_push() {
        let firstController = UINavigationController()
        let secondController = UIViewController()
        firstController.presentViewController(secondController, type: .push, animated: false)

        XCTAssertNotNil(secondController.navigationController)
        XCTAssertNotNil(secondController.navigationItem)
        XCTAssertEqual(firstController.topViewController, secondController)

        secondController.addDismissButtonIfNeeded()
        XCTAssertNil(secondController.navigationItem.leftBarButtonItem)
        XCTAssertNil(secondController.navigationItem.rightBarButtonItem)

        secondController.dismiss(animated: false)
        XCTAssertEqual(firstController.topViewController, secondController)
    }

    func test_thatViewController_presentsViewController_withPresentationType_push_embedded() {
        let firstController = UIViewController()
        let navController = UINavigationController(rootViewController: firstController)
        XCTAssertEqual(navController.topViewController, firstController)

        let secondController = UIViewController()
        firstController.presentViewController(secondController, type: .push, animated: false)

        XCTAssertNotNil(secondController.navigationController)
        XCTAssertNotNil(secondController.navigationItem)
        XCTAssertEqual(navController.topViewController, secondController)

        secondController.addDismissButtonIfNeeded()
        XCTAssertNil(secondController.navigationItem.leftBarButtonItem)
        XCTAssertNil(secondController.navigationItem.rightBarButtonItem)

        secondController.dismiss(animated: false)
        XCTAssertEqual(navController.topViewController, firstController)
    }

    func test_thatViewController_presentsViewController_withPresentationType_show() {
        let firstController = UINavigationController()
        let secondController = UIViewController()
        firstController.presentViewController(secondController, type: .show, animated: false)

        XCTAssertNotNil(secondController.navigationController)
        XCTAssertNotNil(secondController.navigationItem)
        XCTAssertEqual(firstController.topViewController, secondController)

        secondController.addDismissButtonIfNeeded()
        XCTAssertNil(secondController.navigationItem.leftBarButtonItem)
        XCTAssertNil(secondController.navigationItem.rightBarButtonItem)
    }
    
    
    // MARK: Helpers

    func tapAction(sender: UIBarButtonItem) { }
}
