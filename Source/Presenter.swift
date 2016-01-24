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


public protocol ViewControllerDismissing: class {
    func didDismissViewController(viewController: UIViewController, animated: Bool) -> Void
}


public protocol DismissableViewController: class {
    weak var dismissingDelegate: ViewControllerDismissing? { get set }
}


public final class Presenter: ViewControllerDismissing {

    private weak var fromViewController: UIViewController?
    private let style: PresentationStyle

    public init(from viewController: UIViewController, style: PresentationStyle = .Default) {
        self.fromViewController = viewController
        self.style = style

        if style == .Push && viewController.navigationController == nil {
            fatalError("\(self.dynamicType) Error: Inconsistent presenter. " +
                "Cannot present view controller with \(style) style and nil navigationController")
        }
    }

    public func present<T: UIViewController where T: DismissableViewController>(toViewController: T, animated: Bool = true) {
        toViewController.dismissingDelegate = self

        if case .Push = style {
            fromViewController?.navigationController?.pushViewController(toViewController, animated: animated)
            return
        }

        fromViewController?.presentViewController(
            toViewController.controllerByApplyingStyle(style),
            animated: animated,
            completion: nil)
    }


    // MARK: ViewControllerDismissingType

    public func didDismissViewController(viewController: UIViewController, animated: Bool = true) {
        if style == .Push {
            fromViewController?.navigationController?.popViewControllerAnimated(animated)
            return
        }
        
        fromViewController?.dismissViewControllerAnimated(animated, completion: nil)
    }
}


private extension UIViewController {
    func controllerByApplyingStyle(style: PresentationStyle) -> UIViewController {
        if case let .Modal(embed, presentationStyle, transitionStyle) = style {
            let vc = (embed == .WithNavigation) ? UINavigationController(rootViewController: self) : self
            vc.modalPresentationStyle = presentationStyle
            vc.modalTransitionStyle = transitionStyle
            return vc
        }
        return self
    }
}
