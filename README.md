# TKFormTextField

[![Build Status](https://travis-ci.org/hlung/TKFormTextField.svg?branch=master)](https://travis-ci.org/hlung/TKFormTextField)

![Demo](/README/demo.gif)

A UITextField subclass which:
- has a built-in UILabel below for showing an error message
- floats placeholder up when text is entered
- has an underline
- you can customize unselected/selected color for the floating placeholder
- you can customize unselected/selected color and thickness for the underline

## System requirements

- iOS 8.0 or newer
- Swift 4.2 -> latest
- Swift 4.0 -> 0.2.0
- Swift 3.0 -> 0.1.6

## Example

```swift
class ViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: TKFormTextField!

  override func viewDidLoad() {
    super.viewDidLoad()

    // UITextField traditional properties
    self.emailTextField.placeholder = "Email"
    self.emailTextField.enablesReturnKeyAutomatically = true
    self.emailTextField.returnKeyType = .next
    self.emailTextField.clearButtonMode = .whileEditing
    self.emailTextField.placeholderFont = UIFont.systemFont(ofSize: 18)
    self.emailTextField.font = UIFont.systemFont(ofSize: 18)

    // TKFormTextField properties: floating placeholder title
    self.emailTextField.titleLabel.font = UIFont.systemFont(ofSize: 18)
    self.emailTextField.titleColor = UIColor.lightGray
    self.emailTextField.selectedTitleColor = UIColor.gray

    // TKFormTextField properties: underline
    self.emailTextField.lineColor = UIColor.gray
    self.emailTextField.selectedLineColor = UIColor.black
    
    // TKFormTextField properties: bottom error label
    self.emailTextField.errorLabel.font = UIFont.systemFont(ofSize: 18)
    self.emailTextField.errorColor = UIColor.red // this color is also used for the underline on error state

    // TKFormTextField properties: update error message
    // NOTE: Ideally you should show error on .editingDidEnd, and attempt to hide it on .editingChanged.
    // See the demo project on how I design the validation flow.
    self.emailTextField.addTarget(self, action: #selector(updateError), for: .editingChanged)
  }

  func updateError(textField: TKFormTextField) {
    guard let text = textField.text, !text.isEmpty else {
      textField.error = "Text is empty!" // to show error message in errorLabel
      return
    }
    textField.error = nil // to remove the error message
  }
}
```

## Installation

TKFormTextField is available through CocoaPods and Carthage.

[CocoaPods](http://cocoapods.org), add this to your Podfile:
```ruby
pod "TKFormTextField"
```
Note: To run the example project, clone the repo, and run `pod install` from the Example directory first.

Carthage
```ruby
github "hlung/TKFormTextField"
```

Swift Package Manager
In Xcode, go to File > Swift Packages > Add Package Dependency... Look for TKFormTextField.

## Story

For text input forms, using alerts for showing error is too intrusive, makes user lost context of which field is wrong, and require another tap to dismiss. And you can only show one at a time. I think TKFormTextField is the answer to text input form UI.

Note that I am not using IBInspectable / IBDesignable because I feel it is slow and buggy. Moreover, since you usually have several text fields across the app, using code is easier to duplicate and customize.

This is inspired by https://github.com/Skyscanner/SkyFloatingLabelTextField

## Used by

- [Rakuten Viki iOS app](https://apps.apple.com/us/app/viki-asian-tv-dramas-movies/id445553058) in login page

## TODO

- Support RTL
- Support Swift Package Manager, or other dependency managers
- Animate error message below
