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


// MARK: - Presentation
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

        case .Custom(let delegate):
            viewController.modalPresentationStyle = .Custom
            viewController.transitioningDelegate = delegate
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
}


// MARK: - Dismissal
public extension UIViewController {

    public func dismiss(completion: (() -> Void)? = nil) {
        if isModallyPresented {
            dismissViewControllerAnimated(true, completion: completion)
        } else {
            assert(navigationController != nil)
            navigationController?.popViewControllerAnimated(true)
        }
    }

    public func addDismissButtonIfNeeded(config config: DismissButtonConfig = DismissButtonConfig()) {
        guard needsDismissButton else { return }
        addDismissButton(config: config)
    }

    public func addDismissButton(config config: DismissButtonConfig = DismissButtonConfig()) {
        let button = UIBarButtonItem(config: config, target: self, action: #selector(UIViewController._didTapDismissButton(_:)))

        switch config.location {
        case .Left:
            navigationItem.leftBarButtonItem = button
        case .Right:
            navigationItem.rightBarButtonItem = button
        }
    }

    @objc private func _didTapDismissButton(sender: UIBarButtonItem) {
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
        return self.presentingViewController != nil
    }

    private var hasNavigationController: Bool {
        return self.navigationController != nil
    }
    
    private var isNavigationRootViewController: Bool {
        return navigationController?.viewControllers.first == self
    }
}
