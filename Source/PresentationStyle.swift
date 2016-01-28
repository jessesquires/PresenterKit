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


public enum NavigationStyle {
    case None
    case WithNavigation
}


public struct PopoverConfig {
    public enum Source {
        case BarButtonItem(UIBarButtonItem)
        case View(UIView)
    }

    let source: Source
    let arrowDirection: UIPopoverArrowDirection
    let delegate: UIPopoverPresentationControllerDelegate?

    public init(source: Source, arrowDirection: UIPopoverArrowDirection = .Any, delegate: UIPopoverPresentationControllerDelegate? = nil) {
        self.source = source
        self.arrowDirection = arrowDirection
        self.delegate = delegate
    }
}


public enum PresentationType {
    case Modal(NavigationStyle, UIModalPresentationStyle, UIModalTransitionStyle)
    case Popover(PopoverConfig)
    case Push
    case Show
    case ShowDetail(NavigationStyle)
    case Custom
}


public extension UIViewController {

    public func withNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }

    public func withPresentation(presentation: UIModalPresentationStyle) -> Self {
        modalPresentationStyle = presentation
        return self
    }

    public func withTransition(transition: UIModalTransitionStyle) -> Self {
        modalTransitionStyle = transition
        return self
    }

    public func withNavigationStyle(navigationStyle: NavigationStyle) -> UIViewController {
        switch navigationStyle {
        case .None:
            return self
        case .WithNavigation:
            return withNavigation()
        }
    }

    public func withStyles(
        navigation navigation: NavigationStyle,
        presentation: UIModalPresentationStyle,
        transition: UIModalTransitionStyle) -> UIViewController {
            return withPresentation(presentation).withTransition(transition).withNavigationStyle(navigation)
    }
}


public extension UIViewController {

    public func presentViewController(viewController: UIViewController, type: PresentationType, animated: Bool = true) {
        switch type {
        case .Modal(let n, let p, let t):
            let vc = viewController.withStyles(navigation: n, presentation: p, transition: t)
            presentViewController(vc, animated: animated, completion: nil)

        case .Popover(let c):
            viewController.withStyles(navigation: .None, presentation: .Popover, transition: .CrossDissolve)

            let popoverController = viewController.popoverPresentationController
            popoverController?.delegate = c.delegate
            popoverController?.permittedArrowDirections = c.arrowDirection
            switch c.source {
            case .BarButtonItem(let item):
                popoverController?.barButtonItem = item
            case .View(let v):
                popoverController?.sourceView = v
                popoverController?.sourceRect = v.frame
            }
            presentViewController(viewController, animated: animated, completion: nil)

        case .Push:
            navigationController!.pushViewController(viewController, animated: animated)

        case .Show:
            showViewController(viewController, sender: self)

        case .ShowDetail(let navigation):
            showDetailViewController(viewController.withNavigationStyle(navigation), sender: self)

        case .Custom:
            break
        }
    }
}

