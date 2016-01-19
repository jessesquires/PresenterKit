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


public protocol ViewControllerDismissingType: class {
    func didDismiss(viewController viewController: UIViewController) -> Void
}


public protocol DismissableViewControllerType: class {
    weak var dismissingDelegate: ViewControllerDismissingType? { get set }
}


public final class ViewControllerPresenter : ViewControllerDismissingType {

    private weak var fromViewController: UIViewController?
    private let style: PresentationStyle

    public init(fromViewController: UIViewController, style: PresentationStyle = .Default) {
        self.fromViewController = fromViewController
        self.style = style

        if style == .Push && fromViewController.navigationController == nil {
            fatalError("\(self.dynamicType) Error: Inconsistent presenter. " +
                "Cannot present view controller with \(style) style and nil navigationController")
        }
    }

    public func presentViewController<T: UIViewController where T: DismissableViewControllerType>(toViewController: T) {
        toViewController.dismissingDelegate = self

        if case .Push = style {
            fromViewController?.navigationController?.pushViewController(toViewController, animated: true)
            return
        }

        fromViewController?.presentViewController(
            toViewController.controllerByApplyingStyle(style),
            animated: true,
            completion: nil)
    }


    // MARK: ViewControllerDismissingType

    public func didDismiss(viewController viewController: UIViewController) {
        if style == .Push {
            fromViewController?.navigationController?.popViewControllerAnimated(true)
            return
        }

        fromViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}


private extension UIViewController {
    func controllerByApplyingStyle(style: PresentationStyle) -> UIViewController {
        if case let .Modal(embed, presentationStyle, transitionStyle) = style {
            let vc = (embed == .EmbedInNavigation) ? UINavigationController(rootViewController: self) : self
            vc.modalPresentationStyle = presentationStyle
            vc.modalTransitionStyle = transitionStyle
            return vc
        }
        return self
    }
}
