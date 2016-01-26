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

import Foundation
import UIKit


public struct DismissButton {
    public enum Location {
        case Left
        case Right
    }

    public enum Text {
        case Cancel
        case Done
        case Save
        case Custom(String)

        public var systemItem: UIBarButtonSystemItem? {
            switch self {
            case .Cancel:
                return .Cancel
            case .Done:
                return .Done
            case .Save:
                return .Save
            default:
                return nil
            }
        }

        public var title: String? {
            switch self {
            case .Custom(let str):
                return str
            default:
                return nil
            }
        }
    }

    public enum Style {
        case Bold
        case Plain

        public var itemStyle: UIBarButtonItemStyle {
            switch self {
            case .Bold:
                return .Done
            case .Plain:
                return .Plain
            }
        }
    }
}


public extension UIViewController {

    public func addDismissButtonIfNeeded(
        text text: DismissButton.Text = .Cancel,
        style: DismissButton.Style = .Plain,
        location: DismissButton.Location = .Left) {
            guard needsDismissButton else { return }
            addDismissButton(text: text, style: style, location: location)
    }

    public func addDismissButton(
        text text: DismissButton.Text = .Cancel,
        style: DismissButton.Style = .Plain,
        location: DismissButton.Location = .Left) {
            let selector = Selector("didTapDismissButton:")
            let button: UIBarButtonItem?

            if let title = text.title {
                button = UIBarButtonItem(title: title, style: style.itemStyle, target: self, action: selector)
            } else {
                button = UIBarButtonItem(barButtonSystemItem: text.systemItem!, target: self, action: selector)
            }

            button?.style = style.itemStyle

            switch location {
            case .Left:
                navigationItem.leftBarButtonItem = button
            case .Right:
                navigationItem.rightBarButtonItem = button
            }
    }

    @objc private func didTapDismissButton(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    private var needsDismissButton: Bool {
        return isNavigationRootViewController || isPopover
    }

    private var isNavigationRootViewController: Bool {
        return navigationController?.viewControllers.first == self
    }

    private var isPopover: Bool {
        return modalPresentationStyle == .Popover
    }
}
