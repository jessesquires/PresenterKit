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
//  Copyright © 2016-present Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

import Foundation
import UIKit

//
//public final class Presenter {
//
//    private weak var fromViewController: UIViewController?
//    private let style: PresentationStyle
//
//    public init(from viewController: UIViewController, style: PresentationStyle) {
//        self.fromViewController = viewController
//        self.style = style
//
//        if style == .Push && viewController.navigationController == nil {
//            fatalError("\(self.dynamicType) Error: Inconsistent presenter. " +
//                "Cannot present view controller with \(style) style and nil navigationController")
//        }
//    }
//
//    public func present(toViewController: UIViewController, animated: Bool = true) {
//        //        toViewController.dismissingDelegate = self
//
//        if case .Push = style {
//            fromViewController?.navigationController?.pushViewController(toViewController, animated: animated)
//            return
//        }
//
//        fromViewController?.presentViewController(
//            toViewController.controllerByApplyingStyle(style),
//            animated: animated,
//            completion: nil)
//    }
//}
