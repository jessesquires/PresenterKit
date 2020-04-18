//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//
//  Documentation
//  https://jessesquires.github.io/PresenterKit
//
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//
//  License
//  Copyright © 2016-present Jesse Squires
//  Released under an MIT license: https://opensource.org/licenses/MIT
//

import UIKit

// MARK: - Styles
extension UIViewController {

    /**
     Wraps the receiving view controller in a navigation controller.
     The receiver is set as the `rootViewController` of the navigation controller.

     - returns: The navigation controller that contains the receiver as the `rootViewController`.
     */
    @discardableResult
    public func withNavigation() -> UINavigationController {
        UINavigationController(rootViewController: self)
    }

    /**
     Applies the specified modal presentation style to the view controller.

     - parameter presentation: A modal presentation style.

     - returns: The view controller after applying the style.
     */
    @discardableResult
    public func withPresentation(_ presentation: UIModalPresentationStyle) -> Self {
        self.modalPresentationStyle = presentation
        return self
    }

    /**
     Applies the specified modal transition style to the view controller.

     - parameter transition: A modal transition style.

     - returns: The view controller after applying the style.
     */
    @discardableResult
    public func withTransition(_ transition: UIModalTransitionStyle) -> Self {
        self.modalTransitionStyle = transition
        return self
    }

    /**
     Applies the specified navigation style to the view controller.

     - parameter navigationStyle: A navigation style.

     - returns: The view controller after applying the style.

     - note: If `navigationStyle` is `.withNavigation`, then calling this method is equivalent to calling `withNavigation()`.
     If `navigationStyle` is `.none`, then calling this method does nothing.
     */
    @discardableResult
    public func withNavigationStyle(_ navigationStyle: NavigationStyle) -> UIViewController {
        switch navigationStyle {
        case .none:
            return self

        case .withNavigation:
            return self.withNavigation()
        }
    }

    /**
     Applies the specified navigation style to the view controller.

     - parameter navigation:   A navigation style.
     - parameter presentation: A modal presentation style.
     - parameter transition:   A modal transition style.

     - returns: The view controller after applying the style.
     */
    @discardableResult
    public func withStyles(navigation: NavigationStyle,
                           presentation: UIModalPresentationStyle,
                           transition: UIModalTransitionStyle) -> UIViewController {
        // apple styles to self, then to navigation controller
        self.withPresentation(presentation).withTransition(transition)
        return self.withNavigationStyle(navigation).withPresentation(presentation).withTransition(transition)
    }
}

// MARK: - Presentation
extension UIViewController {

    /**
     Presents a view controller using the specified presentation type.

     - parameter viewController: The view controller to display over the current view controller.
     - parameter type:           The presentation type to use.
     - parameter animated:       Pass `true` to animate the presentation, `false` otherwise.
     - parameter completion:     The closure to be called.

     - warning: The `completion` parameter is ignored for `show` and `showDetail` presentation types.
     */
    public func presentController(_ controller: UIViewController,
                                  type: PresentationType,
                                  animated: Bool = true,
                                  completion: (() -> Void)? = nil) {
        switch type {
        case .modal(let n, let p, let t):
            let vc = controller.withStyles(navigation: n, presentation: p, transition: t)
            self.present(vc, animated: animated, completion: completion)

        case .popover(let c):
            controller.withStyles(navigation: .none, presentation: .popover, transition: .crossDissolve)

            let popoverController = controller.popoverPresentationController
            popoverController?.delegate = c.delegate
            popoverController?.permittedArrowDirections = c.arrowDirection
            switch c.source {
            case .barButtonItem(let item):
                popoverController?.barButtonItem = item

            case .view(let container, let frame):
                popoverController?.sourceView = container
                popoverController?.sourceRect = frame ?? container.bounds
            }
            self.present(controller, animated: animated, completion: completion)

        case .push:
            if let nav = self as? UINavigationController {
                nav.push(controller, animated: animated, completion: completion)
            } else {
                self.navigationController!.push(controller, animated: animated, completion: completion)
            }

        case .show:
            assert(completion == nil, "Completion closure parameter is ignored for `.show`")
            self.show(controller, sender: self)

        case .showDetail(let navigation):
            assert(completion == nil, "Completion closure parameter is ignored for `.showDetail`")
            self.showDetailViewController(controller.withNavigationStyle(navigation), sender: self)

        case .custom(let delegate):
            controller.modalPresentationStyle = .custom
            controller.transitioningDelegate = delegate
            self.present(controller, animated: animated, completion: completion)

        case .none:
            self.present(controller, animated: animated, completion: completion)
        }
    }
}

// MARK: - Dismissal
extension UIViewController {

    private var needsDismissButton: Bool {
        self.isModallyPresented
    }

    private var isModallyPresented: Bool {
        (self.hasPresentingController && !self.hasNavigationController)
            || (self.hasPresentingController && self.hasNavigationController && self.isNavigationRootViewController)
    }

    private var hasPresentingController: Bool {
        self.presentingViewController != nil
    }

    private var hasNavigationController: Bool {
        self.navigationController != nil
    }

    private var isNavigationRootViewController: Bool {
        self.navigationController?.viewControllers.first == self
    }

    /**
     Dismisses the receiving view controller.

     - parameter animated: Pass `true` to animate the presentation, `false` otherwise.
     - parameter completion: The closure to be called upon completion.
     */
    public func dismissController(animated: Bool = true, completion: (() -> Void)? = nil) {
        if self.isModallyPresented {
            assert(presentingViewController != nil)
            self.dismiss(animated: animated, completion: completion)
        } else {
            assert(navigationController != nil)
            _ = self.navigationController?.pop(animated: animated, completion: completion)
        }
    }

    /**
     Adds a dismiss button having the provided configuration, if needed.

     - parameter config: The configuration to apply to the dismiss button.

     - note: This method does nothing if the view controller is not presented modally.
     */
    public func addDismissButtonIfNeeded(config: DismissButtonConfig = DismissButtonConfig()) {
        guard self.needsDismissButton else { return }
        self.addDismissButton(config: config)
    }

    /**
     Adds a dismiss button having the provided configuration.

     - parameter config: The configuration to apply to the dismiss button.

     - note: The view controller must have a non-nil `navigationItem`.
     */
    public func addDismissButton(config: DismissButtonConfig = DismissButtonConfig()) {
        let button = UIBarButtonItem(config: config,
                                     target: self,
                                     action: #selector(Self._didTapDismissButton(_:)))

        switch config.location {
        case .left:
            self.navigationItem.leftBarButtonItem = button

        case .right:
            self.navigationItem.rightBarButtonItem = button
        }
    }

    @objc
    private func _didTapDismissButton(_ sender: UIBarButtonItem) {
        self.dismissController()
    }
}
