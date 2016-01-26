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


final class MainViewController: UITableViewController, UIPopoverPresentationControllerDelegate {

    @IBAction func didTapPopoverButton(sender: UIBarButtonItem) {
        let vc = RedViewController()
        let config = PopoverConfig(source: .BarButtonItem(sender), delegate: self)
        presentViewController(vc, type: .Popover(config))
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var type: PresentationType?

        switch indexPath.section {
        case 0:
            type = .Push
        case 1:
            type = .Modal(.WithNavigation, .FormSheet, .CoverVertical)
        case 2:
            type = .Show
        case 3:
            type = .ShowDetail(.WithNavigation)
        case 4:
            let cell = tableView.cellForRowAtIndexPath(indexPath)!.contentView
            let config = PopoverConfig(source: .View(cell), delegate: self)
            type = .Popover(config)
        case 5:
            // custom "half modal"
            return

        default:
            return
        }

        let vc = RedViewController()
        presentViewController(vc, type: type!)
    }


    // MARK: UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }

}
