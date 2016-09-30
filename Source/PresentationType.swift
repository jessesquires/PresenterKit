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
    /// Do not embed a view controller in a `UINavigationController`.
    case none

    /// Embed view controller in a `UINavigationController`.
    case withNavigation
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
        case barButtonItem(UIBarButtonItem)

        /// Specifies that the popover should display from a `UIView` instance.
        case view(UIView)
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
    public init(source: Source,
                arrowDirection: UIPopoverArrowDirection = .any,
                delegate: UIPopoverPresentationControllerDelegate? = nil) {
        self.source = source
        self.arrowDirection = arrowDirection
        self.delegate = delegate
    }
}


/**
 Describes the type of presentation for a view controller.
 */
public enum PresentationType {
    /// A modal presentation type with the specified navigation, presentation, and transition styles.
    case modal(NavigationStyle, UIModalPresentationStyle, UIModalTransitionStyle)

    /// A popover presentation type with the specified configuration.
    case popover(PopoverConfig)

    /// A push presentation type.
    case push

    /// A "show" presentation type. This is an adaptive presentation that usually corresponds to `.Push`.
    case show

    /// A "show detail" presentation type. This is an adaptive presentation that usually corresponds to `.Modal`.
    case showDetail(NavigationStyle)

    /// A custom presentation style that uses the specified delegate.
    case custom(UIViewControllerTransitioningDelegate)

    /// No presentation type specified, use UIKit defaults. Use this when presenting system controllers, like `UIAlertController`.
    case none
}
