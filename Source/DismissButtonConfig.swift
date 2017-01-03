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

/**
 A configuration for `UIBarButtonItem`.
 Use this configuration to create dismissal/cancel buttons for modally presented view controllers.
 */
public struct DismissButtonConfig {

    /// The location for the bar button.
    public let location: Location

    /// The style for the bar button.
    public let style: Style

    /// The itemType for the bar button.
    public let itemType: ItemType

    /**
     Initializes a new configuration instance.

     - parameter location: The location for the bar button.
     - parameter style:    The style for the bar button.
     - parameter itemType: The itemType for the bar button.

     - returns: A new configuration instance.
     */
    public init(location: Location = .left, style: Style = .plain, itemType: ItemType = .systemItem(.cancel)) {
        self.location = location
        self.style = style
        self.itemType = itemType
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

    /// Specifies the itemType for the bar button.
    public enum ItemType {
        /// Specifies a `UIBarButtonSystemItem`.
        case systemItem(UIBarButtonSystemItem)

        /// Specifies custom text for the bar button.
        case custom(String)
        
        /// Specifies custom image for the bar button.
        case image(UIImage)
    }
}


public extension UIBarButtonItem {
    /**
     Initializes a new bar button item using the specified configuration.

     - parameter config: The configuration for the item.
     - parameter target: The object that receives the action message.
     - parameter action: The action to send to target when this item is selected.

     - returns: A new bar button item instance.
     */
    public convenience init(config: DismissButtonConfig, target: AnyObject?, action: Selector) {
        
        switch config.itemType {
        case .custom(let title):
            self.init(title: title, style: config.style.itemStyle, target: target, action: action)
        case .image(let image):
            self.init(image: image, style: config.style.itemStyle, target: target, action: action)
        case .systemItem(let systemItem):
            self.init(barButtonSystemItem: systemItem, target: target, action: action)
        }
        style = config.style.itemStyle
    }
}


internal extension DismissButtonConfig.Style {
    var itemStyle: UIBarButtonItemStyle {
        switch self {
        case .bold:
            return .done
        case .plain:
            return .plain
        }
    }
}


internal extension DismissButtonConfig.ItemType {
    var systemItem: UIBarButtonSystemItem? {
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
        case .custom(let str):
            return str
        default:
            return nil
        }
    }
}
