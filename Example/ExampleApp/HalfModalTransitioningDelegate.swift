//
//  HalfModalTransitioningDelegate.swift
//  ExampleApp
//
//  Created by Jesse Squires on 1/27/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

import UIKit

class HalfModalTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    func presentationControllerForPresentedViewController(
        presented: UIViewController,
        presentingViewController presenting: UIViewController,
        sourceViewController source: UIViewController) -> UIPresentationController? {
            
            return HalfModalPresentationController(
                presentedViewController: presented,
                presentingViewController: presenting)
    }

}
