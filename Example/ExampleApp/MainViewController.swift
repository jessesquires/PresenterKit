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

    private lazy var pushPresenter: Presenter = {
        return Presenter(from: self, style: .Push)
    }()

    private lazy var modalPresenter: Presenter = {
        return Presenter(from: self, style: .Modal(.WithNavigation, .FullScreen, .CoverVertical))
    }()


    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.section {
        case 0:
            let vc = RedViewController()
            pushPresenter.present(vc)

        case 1:
            let vc = RedViewController()
            modalPresenter.present(vc)

        case 2: break

        default:
            break
        }
    }

}
