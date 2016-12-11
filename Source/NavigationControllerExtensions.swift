//
//  NavigationControllerExtensions.swift
//  Pods
//
//  Created by Lluís Ulzurrun de Asanza Sàez on 14/11/16.
//
//

import UIKit

extension UINavigationController {
    
    /**
     Pushes given view controller, optionally animated, calling given block on
     completion.
     
     - parameter viewController: View controller to be pushed.
     - parameter animated: Whether view controller should be pushed animated or not.
     - parameter completion: Block to be called on animation completion.
     */
    public func pushViewController(_ viewController: UIViewController,
                                   animated: Bool,
                                   completion: @escaping (Void) -> Void) {
        self.pushViewController(viewController, animated: animated)
        
        guard animated, let coordinator = self.transitionCoordinator else {
            completion()
            return
        }
        
        coordinator.animate(alongsideTransition: nil) { _ in completion() }
    }
    
}
