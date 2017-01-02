//
//  ViewController.swift
//  TKFormTextFieldDemo
//
//  Created by Thongchai Kolyutsakul on 30/11/16.
//  Copyright © 2016 Viki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var emailTextField: TKFormTextField!
  @IBOutlet weak var passwordTextField: TKFormTextField!
  @IBOutlet weak var submitButton: UIButton!
  
  let submitSegueId = "submit"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.emailTextField.placeholder = "Email"
    self.emailTextField.enablesReturnKeyAutomatically = true
    self.emailTextField.returnKeyType = .next
    self.emailTextField.clearButtonMode = .whileEditing
    self.emailTextField.delegate = self
    
    self.passwordTextField.placeholder = "Password"
    self.passwordTextField.enablesReturnKeyAutomatically = true
    self.passwordTextField.returnKeyType = .done
    self.passwordTextField.clearButtonMode = .whileEditing
    self.passwordTextField.delegate = self
    self.passwordTextField.isSecureTextEntry = true
    
    // Validation logic
    self.addTargetForErrorUpdating(self.emailTextField)
    self.addTargetForErrorUpdating(self.passwordTextField)
    
    // Customize labels
    self.emailTextField.titleLabel.font = UIFont.systemFont(ofSize: 18)
    self.emailTextField.font = UIFont.systemFont(ofSize: 18)
    self.emailTextField.errorLabel.font = UIFont.systemFont(ofSize: 18)
    self.passwordTextField.titleLabel.font = UIFont.systemFont(ofSize: 18)
    self.passwordTextField.font = UIFont.systemFont(ofSize: 18)
    self.passwordTextField.errorLabel.font = UIFont.systemFont(ofSize: 18)
    
    // Disable submitButton at start
    self.submitButton.isEnabled = false
  }
  
  func addTargetForErrorUpdating(_ textField: TKFormTextField) {
    textField.addTarget(self, action: #selector(clearErrorIfNeeded), for: .editingChanged)
    textField.addTarget(self, action: #selector(updateError), for: .editingDidEnd)
  }
  
  func updateError(textField: TKFormTextField) {
    textField.error = validationError(textField)
    self.submitButton.isEnabled = isAllTextFieldsValid()
  }
  
  func clearErrorIfNeeded(textField: TKFormTextField) {
    if validationError(textField) == nil {
      textField.error = nil
    }
    self.submitButton.isEnabled = isAllTextFieldsValid()
  }
  
  fileprivate func isAllTextFieldsValid() -> Bool {
    return validationError(emailTextField) == nil && validationError(passwordTextField) == nil
  }
  
  private func validationError(_ textField: TKFormTextField) -> String? {
    if textField == emailTextField {
      return TKDataValidator.email(text: textField.text)
    } else {
      return TKDataValidator.password(text: textField.text)
    }
  }
  
  @IBAction func submit(_ sender: Any) {
    self.performSegue(withIdentifier: submitSegueId, sender: nil)
  }
  
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if (textField == emailTextField) {
      _ = passwordTextField.becomeFirstResponder()
    }
    else if (textField == passwordTextField) {
      _ = passwordTextField.resignFirstResponder()
      if isAllTextFieldsValid() {
        submit(submitButton)
      }
    }
    return false
  }
}

