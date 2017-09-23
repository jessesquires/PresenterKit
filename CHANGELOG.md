# CHANGELOG

The changelog for `PresenterKit`. Also see the [releases](https://github.com/jessesquires/PresenterKit/releases) on GitHub.

--------------------------------------

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
