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

import PresenterKit
import UIKit

enum Options: Int {
    case push
    case modal
    case show
    case showDetail
    case popover
    case halfModal
}

final class MainViewController: UITableViewController,
UIViewControllerTransitioningDelegate, UIPopoverPresentationControllerDelegate {

    @IBAction func didTapPopoverButton(_ sender: UIBarButtonItem) {
        let vc = RedViewController()
        let config = PopoverConfig(source: .barButtonItem(sender), delegate: self)
        presentController(vc, type: .popover(config)) {
            print("Completed")
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        let animated = true

        switch indexPath.section {
        case Options.push.rawValue:
            let vc = RedViewController()
            presentController(vc, type: .push, animated: animated) {
                print("Completed")
            }

        case Options.modal.rawValue:
            let image = UIImage(named: "ic_dismiss")!
            let dismissConfig = DismissButtonConfig(location: .left, style: .plain, content: .image(image))
            let vc = RedViewController(dismissConfig: dismissConfig)
            presentController(vc, type: .modal(.withNavigation, .fullScreen, .coverVertical), animated: animated) {
                print("Completed")
            }

        case Options.show.rawValue:
            let vc = RedViewController()
            presentController(vc, type: .show, animated: animated)

        case Options.showDetail.rawValue:
            let vc = RedViewController()
            presentController(vc, type: .showDetail(.withNavigation), animated: animated)

        case Options.popover.rawValue:
            let cell = tableView.cellForRow(at: indexPath)!.contentView
            let config = PopoverConfig(source: .view(container: cell, frame: nil), delegate: self)
            let vc = RedViewController()
            presentController(vc, type: .popover(config), animated: animated) {
                print("Completed")
            }

        case Options.halfModal.rawValue:
            let vc = RedViewController()
            vc.modalTransitionStyle = .coverVertical
            presentController(vc, type: .custom(self), animated: animated) {
                print("Completed")
            }

        default:
            fatalError("invalid index path: \(indexPath)")
        }
    }

    // MARK: UIViewControllerTransitioningDelegate

    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        HalfModalPresentationController(presentedViewController: presented, presenting: presenting)
    }

    // MARK: UIPopoverPresentationControllerDelegate

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
