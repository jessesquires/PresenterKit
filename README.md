# PresenterKit
[![Build Status](https://travis-ci.org/jessesquires/PresenterKit.svg)](https://travis-ci.org/jessesquires/PresenterKit) [![Version Status](https://img.shields.io/cocoapods/v/PresenterKit.svg)][podLink] [![license MIT](https://img.shields.io/cocoapods/l/PresenterKit.svg)][mitLink] [![codecov](https://codecov.io/gh/jessesquires/PresenterKit/branch/develop/graph/badge.svg)](https://codecov.io/gh/jessesquires/PresenterKit) [![Platform](https://img.shields.io/cocoapods/p/PresenterKit.svg)][docsLink] [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

*Swifty view controller presentation for iOS*

## About

Swifty wrappers around view controller presentation, dismissal, and `UIPresentationController`. See my [blog post](http://www.jessesquires.com/swifty-presenters/) and [talk at Realm](https://realm.io/news/slug-jesse-squires-swifty-view-controller-presenters/).

## Requirements

* Swift 3.0
* Xcode 8
* iOS 8.0+

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

Read the [docs][docsLink]. Generated with [jazzy](https://github.com/realm/jazzy). Hosted by [GitHub Pages](https://pages.github.com).

#### Generate

````bash
$ ./build_docs.sh
````

#### Preview

````bash
$ open index.html -a Safari
````

## Getting Started

```swift
import PresenterKit
```

- Watch [the talk](https://realm.io/news/slug-jesse-squires-swifty-view-controller-presenters/)
- Read the [blog post](http://www.jessesquires.com/swifty-presenters/)
- Run the [example project](https://github.com/jessesquires/PresenterKit/tree/develop/Example)

#### Presenting a view controller modally

```swift
let vc = MyViewController()
present(vc, type: .modal(.withNavigation, .FormSheet, .CoverVertical))
```

#### Pushing a view controller

```swift
let vc = MyViewController()
present(vc, type: .Push)
```

#### Presenting as a popover

```swift
let vc = MyViewController()
let config = PopoverConfig(source: .BarButtonItem(item), delegate: self)
present(vc, type: .Popover(config))
```

#### Dismissing a view controller

```swift
dismiss()
```

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
