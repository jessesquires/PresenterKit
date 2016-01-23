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


final class MainViewController: UITableViewController {
    
    private lazy var presenter: Presenter = {
        return Presenter(from: self, style: .Push)
    }()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
}
