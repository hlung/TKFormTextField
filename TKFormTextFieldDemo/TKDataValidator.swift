//
//  TKDataValidator.swift
//  TKFormTextFieldDemo
//
//  Created by Thongchai Kolyutsakul on 1/1/17.
//  Copyright © 2017 Viki. All rights reserved.
//

import Foundation

protocol TKDataValidatorDelegate: class {
  func dataValidator(validator: TKDataValidator, isAllValid: Bool)
}

// Stores functions that validates input text.
// Each function takes a text.
// Returns an error string if that text is invalid, or nil if valid.
class TKDataValidator {
  
  let textFields: [TKFormTextField]
  let validators: [((String?) -> String?)]
  weak var delegate: TKDataValidatorDelegate?
  
  var isAllValid: Bool = false {
    didSet {
      self.delegate?.dataValidator(validator: self, isAllValid: self.isAllValid)
    }
  }
  
  init(textFields: [TKFormTextField], validators: [((String?) -> String?)]) {
    self.textFields = textFields
    self.validators = validators
    for tf in textFields {
      addTargetForErrorUpdating(tf)
    }
  }
  
  fileprivate func addTargetForErrorUpdating(_ textField: TKFormTextField) {
    textField.addTarget(self, action: #selector(clearErrorIfNeeded), for: .editingChanged)
    textField.addTarget(self, action: #selector(updateError), for: .editingDidEnd)
  }
  
  @objc fileprivate func updateError(textField: TKFormTextField) {
    textField.error = validationError(textField)
    self.isAllValid = isAllTextFieldsValid()
  }
  
  @objc fileprivate func clearErrorIfNeeded(textField: TKFormTextField) {
    if validationError(textField) == nil {
      textField.error = nil
    }
    self.isAllValid = isAllTextFieldsValid()
  }
  
  fileprivate func isAllTextFieldsValid() -> Bool {
    for tf in textFields {
      if validationError(tf) != nil {
        return false
      }
    }
    return true
  }
  
  private func validationError(_ textField: TKFormTextField) -> String? {
    guard let index = self.textFields.index(of: textField) else { return "Error. Cannot validate." }
    let validator = self.validators[index]
    return validator(textField.text)
  }
}

// MARK: Validators
extension TKDataValidator {
  
  class func email(text: String?) -> String? {
    guard let text = text, !text.isEmpty else {
      return "Email is missing."
    }
    guard text.tk_isValidEmail() else {
      return "Email is invalid."
    }
    return nil
  }
  
  class func password(text: String?) -> String? {
    guard let text = text, text.characters.count >= 6 else {
      return "Password is invalid."
    }
    return nil
  }
  
}

private extension String {
  func tk_isValidEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return emailTest.evaluate(with: self)
  }
}
