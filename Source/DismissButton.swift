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


public struct DismissButton {
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


public struct DismissButtonConfig {
    let location: DismissButton.Location
    let style: DismissButton.Style
    let text: DismissButton.Text

    init(location: DismissButton.Location = .Left,
        style: DismissButton.Style = .Plain,
        text: DismissButton.Text = .Cancel) {
        self.location = location
        self.style = style
        self.text = text
    }
}
