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

import PresenterKit


final class MainViewController: UITableViewController, ViewControllerDismissingType {
    
    private lazy var presenter: ViewControllerPresenter = {
        return ViewControllerPresenter(fromViewController: self, style: .Push)
    }()

    func didDismiss(viewController viewController: UIViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
}
