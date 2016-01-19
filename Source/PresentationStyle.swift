//
//  Created by Jesse Squires on 10/31/15.
//  Copyright © 2015 Hexed Bits. All rights reserved.
//

import Foundation
import UIKit


enum ModalType {
    case Default
    case EmbedInNavigation
}


enum PresentationStyle: Equatable {
    case Push
    case Modal(ModalType, UIModalPresentationStyle, UIModalTransitionStyle)
    case Custom
}


func ==(lhs: PresentationStyle, rhs: PresentationStyle) -> Bool {
    switch (lhs, rhs) {
    case (.Push, .Push): return true

    case (let .Modal(m1, p1, t1), let .Modal(m2, p2, t2)):
        return m1 == m2 && p1 == p2 && t1 == t2

    case (.Custom, .Custom): return true

    default: return false
    }
}


extension PresentationStyle {
    static var Default: PresentationStyle {
        return Modal(.Default, .FullScreen, .CoverVertical)
    }

    static var ModalFlip: PresentationStyle {
        return Modal(.EmbedInNavigation, .FullScreen, .FlipHorizontal)
    }

    static var ModalForm: PresentationStyle {
        return Modal(.EmbedInNavigation, .FormSheet, .CoverVertical)
    }
}
