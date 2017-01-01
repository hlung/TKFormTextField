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
    self.emailTextField.addTarget(self, action: #selector(clearErrorMessageIfNeeded), for: .editingChanged)
    self.emailTextField.addTarget(self, action: #selector(updateErrorMessage), for: .editingDidEnd)
    self.emailTextField.enablesReturnKeyAutomatically = true
    self.emailTextField.returnKeyType = .next
    self.emailTextField.delegate = self
    
    self.passwordTextField.placeholder = "Password"
    self.passwordTextField.addTarget(self, action: #selector(clearErrorMessageIfNeeded), for: .editingChanged)
    self.passwordTextField.addTarget(self, action: #selector(updateErrorMessage), for: .editingDidEnd)
    self.passwordTextField.enablesReturnKeyAutomatically = true
    self.passwordTextField.returnKeyType = .done
    self.passwordTextField.delegate = self
    
    self.submitButton.isEnabled = isAllTextFieldsValid()
  }
  
  func updateErrorMessage(textField: TKFormTextField) {
    if textField == emailTextField {
      textField.errorMessage = DataValidator.email(text: textField.text)
    } else if textField == passwordTextField {
      textField.errorMessage = DataValidator.password(text: textField.text)
    }
    self.submitButton.isEnabled = isAllTextFieldsValid()
  }
  
  func clearErrorMessageIfNeeded(textField: TKFormTextField) {
    if textField == emailTextField {
      if DataValidator.email(text: textField.text) == nil {
        textField.errorMessage = nil
      }
    } else if textField == passwordTextField {
      if DataValidator.password(text: textField.text) == nil {
        textField.errorMessage = nil
      }
    }
    self.submitButton.isEnabled = isAllTextFieldsValid()
  }
  
  private func isAllTextFieldsValid() -> Bool {
    guard DataValidator.email(text: emailTextField.text) == nil else { return false }
    guard DataValidator.password(text: passwordTextField.text) == nil else { return false }
    return true
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
      if self.submitButton.isEnabled {
        submit(submitButton)
      }
    }
    return false
  }
}

