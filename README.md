# PresenterKit

[![Build Status](https://travis-ci.org/jessesquires/PresenterKit.svg)](https://travis-ci.org/jessesquires/PresenterKit) [![Version Status](https://img.shields.io/cocoapods/v/PresenterKit.svg)][podLink] [![license MIT](https://img.shields.io/cocoapods/l/PresenterKit.svg)][mitLink] [![codecov](https://codecov.io/gh/jessesquires/PresenterKit/branch/develop/graph/badge.svg)](https://codecov.io/gh/jessesquires/PresenterKit) [![Platform](https://img.shields.io/cocoapods/p/PresenterKit.svg)][docsLink] [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

*Swifty view controller presentation for iOS*

## About

Swifty wrappers around view controller presentation, dismissal, and `UIPresentationController`.

## Requirements

* Xcode 9.4+
* Swift 4.1+
* iOS 10.0+
* [SwiftLint](https://github.com/realm/SwiftLint)

## Installation

#### [CocoaPods](https://cocoapods.org) (recommended)

````ruby
use_frameworks!

# Latest release in CocoaPods
pod 'PresenterKit'

# Get the latest on develop
pod 'PresenterKit', :git => 'https://github.com/jessesquires/PresenterKit.git', :branch => 'develop'
````

#### [Carthage](https://github.com/Carthage/Carthage)

````bash
github "jessesquires/PresenterKit"
````

## Documentation

Read the [docs][docsLink]. Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

#### Generate

````bash
$ ./scripts/build_docs.sh
````

#### Preview

````bash
$ open index.html -a Safari
````

## Contribute

Please follow these [contribution guidelines](https://github.com/jessesquires/HowToContribute).

## Credits

Created and maintained by [**@jesse_squires**](https://twitter.com/jesse_squires).

## License

`PresenterKit` is released under an [MIT License][mitLink]. See `LICENSE` for details.

>**Copyright &copy; 2016-present Jesse Squires.**

*Please provide attribution, it is greatly appreciated.*

[mitLink]:https://opensource.org/licenses/MIT
[docsLink]:https://jessesquires.github.io/PresenterKit
[podLink]:https://cocoapods.org/pods/PresenterKit
