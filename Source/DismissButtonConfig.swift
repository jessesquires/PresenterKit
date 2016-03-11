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

    /// The text for the bar button.
    public let text: Text

    /**
     Initializes a new configuration instance.

     - parameter location: The location for the bar button.
     - parameter style:    The style for the bar button.
     - parameter text:     The text for the bar button.

     - returns: A new configuration instance.
     */
    public init(location: Location = .Left, style: Style = .Plain, text: Text = .SystemItem(.Cancel)) {
        self.location = location
        self.style = style
        self.text = text
    }

    /// Specifies a bar button's location in a navigation bar.
    public enum Location {
        /// The left side of the navigation bar.
        case Left

        /// The right side of the navigation bar.
        case Right
    }

    /// Specifies a bar button's item style.
    public enum Style {
        /// Use bold text, `.Done` style.
        case Bold

        /// Use regular text, `.Plain` style.
        case Plain
    }

    /// Specifies the text for the bar button.
    public enum Text {
        /// Specifies a `UIBarButtonSystemItem`.
        case SystemItem(UIBarButtonSystemItem)

        /// Specifies custom text for the bar button.
        case Custom(String)
    }
}


extension DismissButtonConfig.Style {
    var itemStyle: UIBarButtonItemStyle {
        switch self {
        case .Bold:
            return .Done
        case .Plain:
            return .Plain
        }
    }
}


extension DismissButtonConfig.Text {
    var systemItem: UIBarButtonSystemItem? {
        switch self {
        case .SystemItem(let item):
            return item
        default:
            return nil
        }
    }

    var title: String? {
        switch self {
        case .Custom(let str):
            return str
        default:
            return nil
        }
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
    public convenience init(config: DismissButtonConfig, target: AnyObject, action: Selector) {
        if let title = config.text.title {
            self.init(title: title, style: config.style.itemStyle, target: target, action: action)
        } else {
            self.init(barButtonSystemItem: config.text.systemItem!, target: target, action: action)
        }
        self.style = config.style.itemStyle
    }
}
