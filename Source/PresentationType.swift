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

import UIKit

/**
 Specifies the navigation style for a view controller.
 */
public enum NavigationStyle {
    /// Do not embed view controller in a `UINavigationController`.
    case None

    /// Embed view controller in a `UINavigationController.
    case WithNavigation
}


/**
 A configuration for `UIPopoverPresentationController`.
 */
public struct PopoverConfig {

    /**
     Describes the source view from which the popover is showing.
     */
    public enum Source {
        /// Specifies that the popover should display from a `UIBarButtonItem` instance.
        case BarButtonItem(UIBarButtonItem)

        /// Specifies that the popover should display from a `UIView` instance.
        case View(UIView)
    }

    /// The source view for the popover.
    let source: Source

    /// The arrow direction of the popover.
    let arrowDirection: UIPopoverArrowDirection

    /// The delegate object for the popover presentation controller, or `nil`.
    let delegate: UIPopoverPresentationControllerDelegate?

    /**
     Initializes and returns a new `PopoverConfig` object.

     - parameter source:         The source for the popoever.
     - parameter arrowDirection: The arrow direction for the popover.
     - parameter delegate:       The delegate for the popover.

     - returns: A new `PopoverConfig` object.
     */
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
    case Custom(UIViewControllerTransitioningDelegate)
}
