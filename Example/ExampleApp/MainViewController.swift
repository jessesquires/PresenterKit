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
UIViewControllerTransitioningDelegate, UIPopoverPresentationControllerDelegate {

    @IBAction func didTapPopoverButton(_ sender: UIBarButtonItem) {
        let vc = RedViewController()
        let config = PopoverConfig(source: .barButtonItem(sender), delegate: self)
        present(vc, type: .popover(config))
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        let animated = true

        switch indexPath.section {
        case 0:
            let vc = RedViewController()
            present(vc, type: .push, animated: animated)

        case 1:
            let image = #imageLiteral(resourceName: "ic_dismiss")
            let dismissConfig = DismissButtonConfig(location: .left, style: .plain, content: .image(image))
            let vc = RedViewController(dismissConfig: dismissConfig)
            present(vc, type: .modal(.withNavigation, .formSheet, .coverVertical), animated: animated)

        case 2:
            let vc = RedViewController()
            present(vc, type: .show, animated: animated)

        case 3:
            let vc = RedViewController()
            present(vc, type: .showDetail(.withNavigation), animated: animated)

        case 4:
            let cell = tableView.cellForRow(at: indexPath)!.contentView
            let config = PopoverConfig(source: .view(cell), delegate: self)
            let vc = RedViewController()
            present(vc, type: .popover(config), animated: animated)

        case 5:
            let vc = RedViewController()
            vc.modalTransitionStyle = .coverVertical
            present(vc, type: .custom(self), animated: animated)

        default:
            return
        }
    }

    // MARK: UIViewControllerTransitioningDelegate

    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        return HalfModalPresentationController(presentedViewController: presented, presenting: presenting)
    }

    // MARK: UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
