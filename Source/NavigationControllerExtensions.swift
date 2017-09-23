//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://jessesquires.github.io/PresenterKit
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

extension UINavigationController {
    
    /**
     Pushes the given view controller and calls the given closure upon completion.
     
     - parameter viewController: The view controller to push onto the stack.
     - parameter animated: Specify `true` to animate the transition or `false`
     if you do not want the transition to be animated.
     - parameter completion: The closure to be called upon completion.
     */
    public func push(_ viewController: UIViewController,
                     animated: Bool = true,
                     completion: (() -> Void)? = nil) {
        self.pushViewController(viewController, animated: animated)

        guard let completion = completion else {
            return
        }

        guard animated, let coordinator = self.transitionCoordinator else {
            completion()
            return
        }

        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
}
