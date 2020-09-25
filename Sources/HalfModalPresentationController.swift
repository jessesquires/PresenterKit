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

// swiftlint:disable type_contents_order

import UIKit

/// A modal presentation controller that presents the presented view controller modally,
/// covering the bottom half of the presenting view controller. This presentation controller
/// displays a transparent dimmed, tappable view over the top half of the presenting view controller.
public final class HalfModalPresentationController: UIPresentationController {

    private lazy var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(Self.dimmingViewTapped(_:)))
        view.addGestureRecognizer(tap)
        return view
    }()

    /// :nodoc:
    override public init(presentedViewController: UIViewController,
                         presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController,
                   presenting: presentingViewController)
    }

    /// :nodoc:
    override public func presentationTransitionWillBegin() {
        self.dimmingView.frame = containerView!.bounds
        self.dimmingView.alpha = 0.0
        self.containerView?.insertSubview(self.dimmingView, at: 0)

        let animations = {
            self.dimmingView.alpha = 1.0
        }

        if let transitionCoordinator = self.presentingViewController.transitionCoordinator {

            transitionCoordinator.animate(alongsideTransition: { _ in
                animations()
            }, completion: nil)
        } else {
            animations()
        }
    }

    /// :nodoc:
    override public func dismissalTransitionWillBegin() {
        let animations = {
            self.dimmingView.alpha = 0.0
        }

        if let transitionCoordinator = presentingViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { _ in
                animations()
            }, completion: nil)
        } else {
            animations()
        }
    }

    /// :nodoc:
    override public var adaptivePresentationStyle: UIModalPresentationStyle {
        .none
    }

    /// :nodoc:
    override public var shouldPresentInFullscreen: Bool {
        true
    }

    /// :nodoc:
    override public func size(
        forChildContentContainer container: UIContentContainer,
        withParentContainerSize parentSize: CGSize) -> CGSize {
        CGSize(width: parentSize.width,
               height: round(parentSize.height / 2.0))
    }

    /// :nodoc:
    override public func containerViewWillLayoutSubviews() {
        self.dimmingView.frame = self.containerView!.bounds
        self.presentedView?.frame = self.frameOfPresentedViewInContainerView
    }

    /// :nodoc:
    override public var frameOfPresentedViewInContainerView: CGRect {
        let size = self.size(forChildContentContainer: presentedViewController,
                             withParentContainerSize: containerView!.bounds.size)
        let origin = CGPoint(x: 0.0, y: self.containerView!.frame.maxY / 2)
        return CGRect(origin: origin, size: size)
    }

    // MARK: Private

    @objc
    private func dimmingViewTapped(_ tap: UITapGestureRecognizer) {
        self.presentingViewController.dismiss(animated: true, completion: nil)
    }
}

// swiftlint:enable type_contents_order
