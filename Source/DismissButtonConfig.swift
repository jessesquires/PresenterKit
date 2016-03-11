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
 Use this configuration to create dismissal buttons for modally presented view controllers.
 */
public struct DismissButtonConfig {
    public let location: Location
    public let style: Style
    public let text: Text

    public init(location: Location = .Left, style: Style = .Plain, text: Text = .Cancel) {
        self.location = location
        self.style = style
        self.text = text
    }

    public enum Location {
        case Left
        case Right
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
}


extension UIBarButtonItem {

    convenience init(config: DismissButtonConfig, target: AnyObject, selector: Selector) {
        if let title = config.text.title {
            self.init(title: title, style: config.style.itemStyle, target: target, action: selector)
        } else {
            self.init(barButtonSystemItem: config.text.systemItem!, target: target, action: selector)
        }
        self.style = config.style.itemStyle
    }
}

