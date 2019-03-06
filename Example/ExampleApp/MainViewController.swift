//
//  Created by Jesse Squires
//  https://www.jessesquires.com
//
//
//  Documentation
//  https://jessesquires.github.io/PresenterKit
//
//
//  GitHub
//  https://github.com/jessesquires/PresenterKit
//
//
//  License
//  Copyright © 2016-present Jesse Squires
//  Released under an MIT license: https://opensource.org/licenses/MIT
//

import UIKit

import PresenterKit

final class MainViewController: UITableViewController,
UIViewControllerTransitioningDelegate, UIPopoverPresentationControllerDelegate {

    @IBAction func didTapPopoverButton(_ sender: UIBarButtonItem) {
        let vc = RedViewController()
        let config = PopoverConfig(source: .barButtonItem(sender), delegate: self)
        present(vc, type: .popover(config)) {
            print("Completed")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        let animated = true

        switch indexPath.section {
        case 0:
            let vc = RedViewController()
            present(vc, type: .push, animated: animated, completion: {
                print("Completed")
            })

        case 1:
            let image = UIImage(named: "ic_dismiss")!
            let dismissConfig = DismissButtonConfig(location: .left, style: .plain, content: .image(image))
            let vc = RedViewController(dismissConfig: dismissConfig)
            present(vc, type: .modal(.withNavigation, .formSheet, .coverVertical), animated: animated, completion: {
                print("Completed")
            })

        case 2:
            let vc = RedViewController()
            present(vc, type: .show, animated: animated)

        case 3:
            let vc = RedViewController()
            present(vc, type: .showDetail(.withNavigation), animated: animated)

        case 4:
            let cell = tableView.cellForRow(at: indexPath)!.contentView
            let config = PopoverConfig(source: .view(container: cell, frame: nil), delegate: self)
            let vc = RedViewController()
            present(vc, type: .popover(config), animated: animated, completion: {
                print("Completed")
            })

        case 5:
            let vc = RedViewController()
            vc.modalTransitionStyle = .coverVertical
            present(vc, type: .custom(self), animated: animated, completion: {
                print("Completed")
            })

        default:
            fatalError("invalid index path: \(indexPath)")
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
