# On

[![CI Status](http://img.shields.io/travis/onmyway133/On.svg?style=flat)](https://travis-ci.org/onmyway133/On)
[![Version](https://img.shields.io/cocoapods/v/On.svg?style=flat)](http://cocoadocs.org/docsets/On)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/On.svg?style=flat)](http://cocoadocs.org/docsets/On)
[![Platform](https://img.shields.io/cocoapods/p/On.svg?style=flat)](http://cocoadocs.org/docsets/On)
![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg)

![](Screenshots/Artboard.png)

## Table of contents

- [Story](#story)
- [Target-Action and Delegate](#target-action-and-delegate)
- [KVO](#kvo)
- [Notification](#notification)
- [Extensible](#extensible)

## Story

There are many [Communication patterns](https://www.objc.io/issues/7-foundation/communication-patterns/)

<div align = "center">
<img src="https://www.objc.io/images/issue-7/notification-flow-chart-dae4ce12.png" width="500" height="400" />
</div>

Sometimes, you just want a unified and quick way to do it. Use `On`

Features

- [x] Shortcut to handle actions and events
- [x] Easy to extend
- [x] Correct method suggestion based on generic protocol constraint
- [x] Support iOS, macOS

## Target-Action and Delegate

#### UIControl

```swift
control.on.change {
  print("control has changed")
}

```

#### UIButton

```swift
button.on.tap {
  print("button has been tapped")
}
```

#### UISlider

```swift
slider.on.value { value in
  print("slider has changed value")
}
```

#### UITextField

```swift
textField.on.text { text in
  print("textField text has changed")
}

textField.on.didEndEditing { text in
  print("texField has ended editing")
}
```

#### UITextView

```swift
textView.on.text { text in
  print("textView text has changed")
}
```

#### UISearchBar

```swift
searchBar.on.text { text in
  print("searchBar text has changed")
}
```

#### UIDatePicker

```swift
datePicker.on.pick { date in
  print("datePicker has changed date")
}
```

#### UIBarButtonItem

```swift
barButtonItem.on.tap {
  print("barButtonItem has been tapped")
}
```

#### UIGestureRecognizer

```swift
gestureRecognizer.on.occur {
  print("gesture just occured")
}
```

#### Timer

```swift
timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)
timer.on.tick {
  print("tick")
}
```

## KVO

```swift
label.on.keyPath(#keyPath(UILabel.text)) {
  print($0 as? String)
}
```

```swift
scrollView.on.keyPath(#keyPath(UIScrollView.contentSize)) { value in
  print($0 as? CGSize)
}
```

## Notification

// TODO

## Extensible

Extend `Container` and specify `Host` to add more functionalities to your own types. For example

```swift
public extension Container where Host: UITableView {
  func didTapOnCell(_ action: @escaping (UITableViewCell) -> Void)) {
    // Your code here here
  }
}

// usage
let tableView = UITableView()
tableView.on.didTapOnCell { cell in
  
}

```

## Installation

**On** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'On'
```

**On** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/On"
```

**On** can also be installed manually. Just download and drop `Sources` folders in your project.

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **On**, check the [CONTRIBUTING](https://github.com/onmyway133/On/blob/master/CONTRIBUTING.md) file for more info.

## License

**On** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/On/blob/master/LICENSE.md) file for more info.
