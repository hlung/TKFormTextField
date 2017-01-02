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
  
  var dataValidator: TKDataValidator!
  
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
    
    // Customize labels
    self.emailTextField.titleLabel.font = UIFont.systemFont(ofSize: 18)
    self.emailTextField.font = UIFont.systemFont(ofSize: 18)
    self.emailTextField.errorLabel.font = UIFont.systemFont(ofSize: 18)
    self.passwordTextField.titleLabel.font = UIFont.systemFont(ofSize: 18)
    self.passwordTextField.font = UIFont.systemFont(ofSize: 18)
    self.passwordTextField.errorLabel.font = UIFont.systemFont(ofSize: 18)
    
    self.dataValidator = TKDataValidator(textFields: [self.emailTextField, self.passwordTextField], validators: [TKDataValidator.email, TKDataValidator.password])
    self.dataValidator.delegate = self
    
    // Disable submitButton at start
    self.submitButton.isEnabled = false
  }
  
  @IBAction func submit(_ sender: Any) {
    self.performSegue(withIdentifier: submitSegueId, sender: nil)
  }
  
}

extension ViewController: TKDataValidatorDelegate {
  func dataValidator(validator: TKDataValidator, isAllValid: Bool) {
    self.submitButton.isEnabled = isAllValid
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if (textField == emailTextField) {
      _ = passwordTextField.becomeFirstResponder()
    }
    else if (textField == passwordTextField) {
      _ = passwordTextField.resignFirstResponder()
      if self.dataValidator.isAllValid {
        submit(submitButton)
      }
    }
    return false
  }
}

