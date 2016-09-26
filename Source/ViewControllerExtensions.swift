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


// MARK: - Styles
public extension UIViewController {

    /**
     Wraps the receiving view controller in a navigation controller.
     The receiver is set as the `rootViewController` of the navigation controller.

     - returns: The navigation controller that contains the receiver as the `rootViewController`.
     */
    @discardableResult
    public func withNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }

    /**
     Applies the specified modal presentation style to the view controller.

     - parameter presentation: A modal presentation style.

     - returns: The view controller after applying the style.
     */
    @discardableResult
    public func withPresentation(_ presentation: UIModalPresentationStyle) -> Self {
        modalPresentationStyle = presentation
        return self
    }

    /**
     Applies the specified modal transition style to the view controller.

     - parameter transition: A modal transition style.

     - returns: The view controller after applying the style.
     */
    @discardableResult
    public func withTransition(_ transition: UIModalTransitionStyle) -> Self {
        modalTransitionStyle = transition
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
            return withNavigation()
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
        withPresentation(presentation).withTransition(transition)
        return withNavigationStyle(navigation).withPresentation(presentation).withTransition(transition)
    }
}


// MARK: - Presentation
public extension UIViewController {

    /**
     Presents a view controller using the specified presentation type.

     - parameter viewController: The view controller to display over the current view controller.
     - parameter type:           The presentation type to use.
     - parameter animated:       Pass `true` to animate the presentation, `false` otherwise.
     */
    public func present(_ controller: UIViewController, type: PresentationType, animated: Bool = true) {
        switch type {
        case .modal(let n, let p, let t):
            let vc = controller.withStyles(navigation: n, presentation: p, transition: t)
            present(vc, animated: animated, completion: nil)

        case .popover(let c):
            controller.withStyles(navigation: .none, presentation: .popover, transition: .crossDissolve)

            let popoverController = controller.popoverPresentationController
            popoverController?.delegate = c.delegate
            popoverController?.permittedArrowDirections = c.arrowDirection
            switch c.source {
            case .barButtonItem(let item):
                popoverController?.barButtonItem = item
            case .view(let v):
                popoverController?.sourceView = v
                popoverController?.sourceRect = v.frame
            }
            present(controller, animated: animated, completion: nil)

        case .push:
            if let nav = self as? UINavigationController {
                nav.pushViewController(controller, animated: animated)
            }
            else {
                navigationController!.pushViewController(controller, animated: animated)
            }

        case .show:
            show(controller, sender: self)

        case .showDetail(let navigation):
            showDetailViewController(controller.withNavigationStyle(navigation), sender: self)

        case .custom(let delegate):
            controller.modalPresentationStyle = .custom
            controller.transitioningDelegate = delegate
            present(controller, animated: animated, completion: nil)

        case .none:
            present(controller, animated: animated, completion: nil)
        }
    }
}


// MARK: - Dismissal
public extension UIViewController {

    /**
     Dismisses the receiving view controller.

     - parameter animated: Pass `true` to animate the presentation, `false` otherwise.
     */
    public func dismiss(animated: Bool = true) {
        if isModallyPresented {
            dismiss(animated: animated, completion: nil)
        } else {
            assert(navigationController != nil)
            _ = navigationController?.popViewController(animated: animated)
        }
    }

    /**
     Adds a dismiss button having the provided configuration, if needed.

     - parameter config: The configuration to apply to the dismiss button.

     - note: This method does nothing if the view controller is not presented modally.
     */
    public func addDismissButtonIfNeeded(config: DismissButtonConfig = DismissButtonConfig()) {
        guard needsDismissButton else { return }
        addDismissButton(config: config)
    }

    /**
     Adds a dismiss button having the provided configuration.

     - parameter config: The configuration to apply to the dismiss button.

     - note: The view controller must have a non-nil `navigationItem`.
     */
    public func addDismissButton(config: DismissButtonConfig = DismissButtonConfig()) {
        let button = UIBarButtonItem(config: config,
                                     target: self,
                                     action: #selector(_didTapDismissButton(_:)))

        switch config.location {
        case .left:
            navigationItem.leftBarButtonItem = button
        case .right:
            navigationItem.rightBarButtonItem = button
        }
    }

    @objc private func _didTapDismissButton(_ sender: UIBarButtonItem) {
        dismiss()
    }

    private var needsDismissButton: Bool {
        return isModallyPresented
    }

    private var isModallyPresented: Bool {
        return (hasPresentingController && !hasNavigationController)
            || (hasPresentingController && hasNavigationController && isNavigationRootViewController)
    }

    private var hasPresentingController: Bool {
        return presentingViewController != nil
    }

    private var hasNavigationController: Bool {
        return navigationController != nil
    }
    
    private var isNavigationRootViewController: Bool {
        return navigationController?.viewControllers.first == self
    }
}
