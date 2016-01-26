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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapPopoverButton(sender: UIBarButtonItem) {
        let vc = RedViewController()
        vc.modalPresentationStyle = .Popover
        vc.popoverPresentationController?.barButtonItem = sender
        vc.popoverPresentationController?.permittedArrowDirections = .Any
        vc.popoverPresentationController?.delegate = self
        presentViewController(vc, animated: true, completion: nil)
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
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
            let vc = RedViewController()
            vc.modalPresentationStyle = .Popover
            vc.popoverPresentationController?.sourceView = tableView.cellForRowAtIndexPath(indexPath)?.contentView
            vc.popoverPresentationController?.sourceRect = (tableView.cellForRowAtIndexPath(indexPath)?.contentView.frame)!
            vc.popoverPresentationController?.permittedArrowDirections = .Any
            vc.popoverPresentationController?.delegate = self
            presentViewController(vc, animated: true, completion: nil)
            return
        case 5:
            // custom "half modal"
            return

        default:
            return
        }

        let vc = RedViewController()
        presentViewController(vc, type: type!)
    }

}
