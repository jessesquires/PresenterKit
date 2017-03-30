# Getting Started

This guide provides a brief overview for how to get started using `PresenterKit`.

```swift
import PresenterKit
```

- Watch [the talk](https://realm.io/news/slug-jesse-squires-swifty-view-controller-presenters/)
- Read the [blog post](http://www.jessesquires.com/swifty-presenters/)
- Run the [example project](https://github.com/jessesquires/PresenterKit/tree/develop/Example)

## Presenting a view controller modally

```swift
let vc = MyViewController()
present(vc, type: .modal(.withNavigation, .formSheet, .coverVertical))
```

## Pushing a view controller

```swift
let vc = MyViewController()
present(vc, type: .push)
```

## Presenting as a popover

```swift
let vc = MyViewController()
let config = PopoverConfig(source: .barButtonItem(item), delegate: self)
present(vc, type: .popover(config))
```

## Dismissing a view controller

```swift
dismiss()
```
