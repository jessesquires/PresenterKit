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


public enum PresentationType {
    case Modal(NavigationStyle, UIModalPresentationStyle, UIModalTransitionStyle)
    case Popover
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
        case .Modal(let navigation, let presentation, let transition):
            let vc = viewController.withStyles(navigation: navigation, presentation: presentation, transition: transition)
            presentViewController(vc, animated: animated, completion: nil)
        case .Popover:
            break
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


public final class Presenter: NSObject, UIViewControllerTransitioningDelegate {

}



//public extension PresentationStyle {
//    static var Default: PresentationStyle {
//        return Modal(.Default, .FullScreen, .CoverVertical)
//    }
//
//    static var ModalFlip: PresentationStyle {
//        return Modal(.WithNavigation, .FullScreen, .FlipHorizontal)
//    }
//
//    static var ModalForm: PresentationStyle {
//        return Modal(.WithNavigation, .FormSheet, .CoverVertical)
//    }
//}
