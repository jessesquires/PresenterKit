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


public enum ModalType {
    case Default
    case WithNavigation
}


public enum PresentationStyle: Equatable {
    case Push
    case Modal(ModalType, UIModalPresentationStyle, UIModalTransitionStyle)
    case Custom
}


public func ==(lhs: PresentationStyle, rhs: PresentationStyle) -> Bool {
    switch (lhs, rhs) {
    case (.Push, .Push):
        return true

    case (let .Modal(m1, p1, t1), let .Modal(m2, p2, t2)):
        return m1 == m2 && p1 == p2 && t1 == t2

    case (.Custom, .Custom):
        return true

    default:
        return false
    }
}


//public extension PresentationStyle {
//    static var Default: PresentationStyle {
//        return Modal(.Default, .FullScreen, .CoverVertical)
//    }
//
//    static var ModalFlip: PresentationStyle {
//        return Modal(.WithNavigation, .FullScreen, .FlipHorizontal)
//    }
//
//    static var ModalForm: PresentationStyle {
//        return Modal(.WithNavigation, .FormSheet, .CoverVertical)
//    }
//}
