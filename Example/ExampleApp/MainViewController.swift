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


final class MainViewController: UITableViewController,
                                UIViewControllerTransitioningDelegate,
                                UIPopoverPresentationControllerDelegate {

    @IBAction func didTapPopoverButton(sender: UIBarButtonItem) {
        let vc = RedViewController()
        let config = PopoverConfig(source: .barButtonItem(sender), delegate: self)
        presentViewController(vc, type: .popover(config))
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        defer {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }

        let animated = true

        switch indexPath.section {
        case 0:
            let vc = RedViewController()
            presentViewController(vc, type: .push, animated: animated)

        case 1:
            let vc = RedViewController()
            presentViewController(vc, type: .modal(.withNavigation, .FormSheet, .CoverVertical), animated: animated)

        case 2:
            let vc = RedViewController()
            presentViewController(vc, type: .show, animated: animated)

        case 3:
            let vc = RedViewController()
            presentViewController(vc, type: .showDetail(.withNavigation), animated: animated)

        case 4:
            let cell = tableView.cellForRowAtIndexPath(indexPath)!.contentView
            let config = PopoverConfig(source: .view(cell), delegate: self)
            let vc = RedViewController()
            presentViewController(vc, type: .popover(config), animated: animated)

        case 5:
            let vc = RedViewController()
            vc.modalTransitionStyle = .CoverVertical
            presentViewController(vc, type: .custom(self), animated: animated)

        default:
            return
        }
    }


    // MARK: UIViewControllerTransitioningDelegate

    func presentationControllerForPresentedViewController(
        presented: UIViewController,
        presentingViewController presenting: UIViewController,
        sourceViewController source: UIViewController) -> UIPresentationController? {

            return HalfModalPresentationController(
                presentedViewController: presented,
                presentingViewController: presenting)
    }


    // MARK: UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

}
