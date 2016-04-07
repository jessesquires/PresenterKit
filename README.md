### :warning: This is still a work in-progress :warning:

# PresenterKit
[![Build Status](https://travis-ci.org/jessesquires/PresenterKit.svg)](https://travis-ci.org/jessesquires/PresenterKit) [![Version Status](https://img.shields.io/cocoapods/v/PresenterKit.svg)][podLink] [![license MIT](https://img.shields.io/cocoapods/l/PresenterKit.svg)][mitLink] [![codecov.io](https://img.shields.io/codecov/c/github/jessesquires/PresenterKit.svg)](http://codecov.io/github/jessesquires/PresenterKit) [![Platform](https://img.shields.io/cocoapods/p/PresenterKit.svg)][docsLink] [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

*Swifty view controller presentation for iOS*

## About

Swifty wrappers around view controller presentation, dismissal, and `UIPresentationController`. See my [blog post](http://www.jessesquires.com/swifty-presenters/) and [talk at Realm](https://realm.io/news/slug-jesse-squires-swifty-view-controller-presenters/).

## Requirements

* Xcode 7.3+
* iOS 8.0+
* Swift 2.2+

## Installation

#### [CocoaPods](http://cocoapods.org) (recommended)

````ruby
use_frameworks!

# For latest release in cocoapods
pod 'PresenterKit'

# Feeling adventurous? Get the latest on develop
pod 'PresenterKit', :git => 'https://github.com/jessesquires/PresenterKit.git', :branch => 'develop'
````

#### [Carthage](https://github.com/Carthage/Carthage)

````bash
github "jessesquires/PresenterKit"
````

## Documentation

Read the [docs][docsLink]. Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com). More information on the [`gh-pages`](https://github.com/jessesquires/PresenterKit/tree/gh-pages) branch.

## Getting Started

```swift
import PresenterKit
```

> Checkout the included [example project](https://github.com/jessesquires/PresenterKit/tree/develop/Example).

## Unit tests

There's a suite of unit tests for `PresenterKit`. To run them, open `PresenterKit.xcodeproj`, select the `PresenterKit` scheme, then &#x2318;-u.

## Contribute

Please follow these [contribution guidelines](https://github.com/jessesquires/HowToContribute).

## Credits

Created and maintained by [**@jesse_squires**](https://twitter.com/jesse_squires).

## License

`PresenterKit` is released under an [MIT License][mitLink]. See `LICENSE` for details.

>**Copyright &copy; 2016-present Jesse Squires.**

*Please provide attribution, it is greatly appreciated.*

[mitLink]:http://opensource.org/licenses/MIT
[docsLink]:http://www.jessesquires.com/PresenterKit
[podLink]:https://cocoapods.org/pods/PresenterKit
