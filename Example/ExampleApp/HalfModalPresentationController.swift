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

final class HalfModalPresentationController: UIPresentationController {

    lazy private var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(HalfModalPresentationController.dimmingViewTapped(_:)))
        view.addGestureRecognizer(tap)
        return view
    }()

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }

    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        dimmingView.alpha = 0.0
        containerView?.insertSubview(dimmingView, at: 0)

        let animations = {
            self.dimmingView.alpha = 1.0
        }

        if let transitionCoordinator = presentingViewController.transitionCoordinator {

            transitionCoordinator.animate(alongsideTransition: { (context) in
                animations()
                }, completion: nil)
        }
        else {
            animations()
        }
    }

    override func dismissalTransitionWillBegin() {
        let animations = {
            self.dimmingView.alpha = 0.0
        }

        if let transitionCoordinator = presentingViewController.transitionCoordinator {
            transitionCoordinator.animate(alongsideTransition: { (context) in
                animations()
                }, completion: nil)
        }
        else {
            animations()
        }
    }

    override var adaptivePresentationStyle: UIModalPresentationStyle {
        get {
            return .none
        }
    }

    override var shouldPresentInFullscreen: Bool {
        get {
            return true
        }
    }

    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width,
                      height: round(parentSize.height / 2.0))
    }

    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            let size = self.size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)

            return CGRect(origin: CGPoint(x: 0.0, y: containerView!.frame.maxY / 2),
                          size: size)
        }
    }

    // MARK: Private

    @objc private func dimmingViewTapped(_ tap: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}
