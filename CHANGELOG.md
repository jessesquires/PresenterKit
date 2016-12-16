# CHANGELOG

The changelog for `PresenterKit`. Also see the [releases](https://github.com/jessesquires/PresenterKit/releases) on GitHub.

--------------------------------------

3.0.0
-----

This release closes the [3.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/3?closed=1).

**Swift 3.0 now required.**

### Changes

- `presentViewController(_:, type:, animated:)` was renamed to `present(_:, type:, animated:)`

### New

- Added a `.none` case to `PresentationType` which uses UIKit defaults. Use this when presenting system controllers like `UIAlertController`.

### Bug fixes

- Fixed bug in `withStyles()` where modal presentation/transition styles might not be applied correctly (#24).

2.0.0
-----

This release closes the [2.0.0 milestone](https://github.com/jessesquires/PresenterKit/milestone/2?closed=1).

**Swift 2.3 now required.**

1.0.0
-----

Initial release :tada:
