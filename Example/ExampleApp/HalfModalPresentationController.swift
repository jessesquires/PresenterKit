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

final class HalfModalPresentationController: UIPresentationController {

    lazy private var dimmingView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        view.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(HalfModalPresentationController.dimmingViewTapped(_:)))
        view.addGestureRecognizer(tap)
        return view
    }()

    override init(presentedViewController: UIViewController, presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }

    override func presentationTransitionWillBegin() {
        dimmingView.frame = containerView!.bounds
        dimmingView.alpha = 0.0
        containerView?.insertSubview(dimmingView, atIndex: 0)

        let animations = {
            self.dimmingView.alpha = 1.0
        }

        if let transitionCoordinator = presentingViewController.transitionCoordinator() {

            transitionCoordinator.animateAlongsideTransition({ (context) in
                animations()
                },
                completion: nil)
        } else {
            animations()
        }
    }

    override func dismissalTransitionWillBegin() {
        let animations = {
            self.dimmingView.alpha = 0.0
        }

        if let transitionCoordinator = presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({ (context) in
                animations()
                }, completion: nil)
        } else {
            animations()
        }
    }

    override func adaptivePresentationStyle() -> UIModalPresentationStyle {
        return .None
    }

    override func shouldPresentInFullscreen() -> Bool {
        return true
    }

    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(
            width: parentSize.width,
            height: round(parentSize.height / 2.0))
    }

    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView!.bounds
        presentedView()?.frame = frameOfPresentedViewInContainerView()
    }

    override func frameOfPresentedViewInContainerView() -> CGRect {
        let size = sizeForChildContentContainer(presentedViewController, withParentContainerSize: containerView!.bounds.size)

        return CGRect(
            origin: CGPoint(x: 0.0, y: containerView!.frame.maxY / 2),
            size: size)
    }

    // MARK: Private

    @objc private func dimmingViewTapped(tap: UITapGestureRecognizer) {
        presentingViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}
