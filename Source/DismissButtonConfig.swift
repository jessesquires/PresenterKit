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

/**
 A configuration for `UIBarButtonItem`.
 Use this configuration to create dismissal/cancel buttons for modally presented view controllers.
 */
public struct DismissButtonConfig {

    /// The location for the bar button.
    /// The default is `.left`.
    public let location: Location

    /// The style for the bar button.
    ///  The default is `.plain`.
    public let style: Style

    /// The content for the bar button.
    ///  The default is `.plain`.
    public let content: Content

    /**
     Initializes a new configuration instance.

     - parameter location: The location for the bar button. The default is `.left`.
     - parameter style:    The style for the bar button. The default is `.plain`.
     - parameter content:  The content for the bar button. The default is `.systemItem(.cancel)`.

     - returns: A new configuration instance.
     */
    public init(location: Location = .left, style: Style = .plain, content: Content = .systemItem(.cancel)) {
        self.location = location
        self.style = style
        self.content = content
    }

    /// Specifies a bar button's location in a navigation bar.
    public enum Location {
        /// The left side of the navigation bar.
        case left

        /// The right side of the navigation bar.
        case right
    }

    /// Specifies a bar button's item style.
    public enum Style {
        /// Use bold text, `.Done` style.
        case bold

        /// Use regular text, `.Plain` style.
        case plain
    }

    /// Specifies the content (title or image) for the bar button.
    public enum Content {
        /// Specifies a `UIBarButtonSystemItem`.
        case systemItem(UIBarButtonItem.SystemItem)

        /// Specifies custom text for the bar button.
        case text(String)

        /// Specifies a custom image for the bar button.
        case image(UIImage)
    }
}

extension UIBarButtonItem {
    /**
     Initializes a new bar button item using the specified configuration.

     - parameter config: The configuration for the item.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.

     - returns: A new bar button item instance.
     */
    public convenience init(config: DismissButtonConfig, target: AnyObject?, action: Selector) {

        switch config.content {
        case .text(let title):
            self.init(title: title, style: config.style.itemStyle, target: target, action: action)

        case .image(let image):
            self.init(image: image, style: config.style.itemStyle, target: target, action: action)

        case .systemItem(let systemItem):
            self.init(barButtonSystemItem: systemItem, target: target, action: action)
        }
        style = config.style.itemStyle
    }
}

extension DismissButtonConfig.Style {
    var itemStyle: UIBarButtonItem.Style {
        switch self {
        case .bold:
            return .done

        case .plain:
            return .plain
        }
    }
}

extension DismissButtonConfig.Content {
    var systemItem: UIBarButtonItem.SystemItem? {
        switch self {
        case .systemItem(let item):
            return item

        default:
            return nil
        }
    }

    var image: UIImage? {
        switch self {
        case .image(let image):
            return image

        default:
            return nil
        }
    }

    var title: String? {
        switch self {
        case .text(let str):
            return str

        default:
            return nil
        }
    }
}
