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


final class RedViewController: UIViewController, DismissableViewController {

    weak var dismissingDelegate: ViewControllerDismissing?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .redColor()

        if navigationItem.leftBarButtonItem == nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .Cancel,
                target: self,
                action: Selector("didTapCancel:"))
        }

    }

    func didTapCancel(sender: UIBarButtonItem) {
        dismiss()
    }
    
}
