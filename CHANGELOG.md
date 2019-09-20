# CHANGELOG

The changelog for `PresenterKit`. Also see the [releases](https://github.com/jessesquires/PresenterKit/releases) on GitHub.

--------------------------------------

6.0.0
-----

This release closes the [6.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/8?closed=1)

### Breaking

- iOS 11 minimum deployment target (Dropped iOS 10)
- Renamed `present()` function to `presentController()` to avoid ambiguous naming with UIKit

### Changed

- Swift 5.1
- Xcode 11
- Upgrade Swiftlint to 0.35.0, add new rules
- Update Travis CI

5.1.0
-----

This release closes the [5.1.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/7?closed=1)

- Upgrade to Swift 4.2
- Xcode 10.1
- Upgrade Swiftlint to 0.27.0

5.0.0
-----

This release closes the [5.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/6?closed=1).

### Breaking

- Swift 4.1
- iOS 10 minimum deployment target (Dropped iOS 9)
- Xcode 9.4
- Upgrade Swiftlint to 0.26.0
- Renamed `dismiss()` function to `dismissController()` to avoid ambiguous naming with UIKit (#41)

### Fixed

- Respect transition context `.isCancelled` when pushing on a navigation stack (#38)

### New

- Add new `pop()` method extension on `UINavigationController` that accepts a `completion` parameter. Similar to existing `push()` method (#40)

- Added `completion` parameter to `dismiss()` method extension on `UIViewController` (#41)

4.0.0
-----

This release closes the [4.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/4?closed=1).

### Breaking changes

- Converted to Swift 4

- iOS 9 minimum deployment target

- `public struct PopoverConfig` was changed to accommodate custom frame so it can be used as anchor for the popover.  ([#27](https://github.com/jessesquires/PresenterKit/pull/27), [#26](https://github.com/jessesquires/PresenterKit/issues/26), [@psartzetakis](https://github.com/psartzetakis))
  - `PopoverConfig.Source.view(_)` was changed to `PopoverConfig.Source.view(container: frame:)`

- `public struct DismissButtonConfig` was changed to accommodate custom images in bar button items. ([#24](https://github.com/jessesquires/PresenterKit/pull/24), [#22](https://github.com/jessesquires/PresenterKit/issues/22), [@psartzetakis](https://github.com/psartzetakis))
    - `DismissButtonConfig.text` was renamed to `DismissButtonConfig.content`
    - `public enum DismissButtonConfig.Text` was renamed to `public enum DismissButtonConfig.Content` and it now has 3 cases: `.systemItem`, `.text`, `.image`
    - `DismissButtonConfig.init(location: style: text:)` was renamed to `DismissButtonConfig.init(location: style: content:)`

### New

- Added support for `completion` closure parameter on `present(..)` method. ([#21](https://github.com/jessesquires/PresenterKit/pull/21), [@Sumolari](https://github.com/Sumolari))

3.0.0
-----

This release closes the [3.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/3?closed=1).

**Swift 3.0 now required.**

### Changes

- `presentViewController(_:, type:, animated:)` was renamed to `present(_:, type:, animated:)`

### New

- Added a `.none` case to `PresentationType` which uses UIKit defaults. Use this when presenting system controllers like `UIAlertController`.

### Bug fixes

- Fixed bug in `withStyles()` where modal presentation/transition styles might not be applied correctly ([#14](https://github.com/jessesquires/PresenterKit/issues/14)).

2.0.0
-----

This release closes the [2.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/2?closed=1).

**Swift 2.3 now required.**

1.0.0
-----

Initial release 🎉
