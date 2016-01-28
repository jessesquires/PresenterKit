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
    case Custom(UIViewControllerTransitioningDelegate)
}
