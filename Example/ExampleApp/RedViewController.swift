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


final class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Red View"
        view.backgroundColor = .redColor()

//        print("nav item = ", navigationItem)
//        print("nav controller = ", navigationController)
//        print("nav root = ", navigationController?.viewControllers.first)
//        print("trans style = ", modalTransitionStyle.rawValue)
//        print("pres style = ", modalPresentationStyle.rawValue)
//        print("pres controller = ", presentationController)

        addDismissButtonIfNeeded()

    }
    
}
