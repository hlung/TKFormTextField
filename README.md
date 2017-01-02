# TKFormTextField

![Demo](/README/demo.gif)

A UITextField subclass which:
- floats placeholder up when text is entered (I call this `titleLabel`)
- has an underline
- has an `errorLabel` right below
- has unselected/selected color for underline and floating placeholder

## Story

For text input forms, using alerts for showing error is too intrusive, makes user lost context of which field is wrong, and require another tap to dismiss. And you can only show one at a time. I think TKFormTextField is the answer to text input form UI.

Note that I am not using IBInspectable / IBDesignable because I feel it is slow and buggy. Moreover, since you usually have several text fields across your app, I think it is easier to customize this in code.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Xcode 8.0
- Swift 3.0.0

## Installation

TKFormTextField is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TKFormTextField"
```

## License

TKFormTextField is available under the MIT license. See the LICENSE file for more info.
