//
//  TKFormTextFieldDemoUITests.swift
//  TKFormTextFieldDemoUITests
//
//  Created by Thongchai Kolyutsakul on 30/11/16.
//  Copyright © 2016 Viki. All rights reserved.
//

import XCTest

class TKFormTextFieldDemoUITests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    continueAfterFailure = false
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    if #available(iOS 9.0, *) {
      XCUIApplication().launch()
    } else {
      // Fallback on earlier versions
      XCTAssert(false)
    }
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // Use recording to get started writing UI tests.
    
    if #available(iOS 9.0, *) {
      let app = XCUIApplication()
      let submitButton = app.buttons["submit-button"]
      
      let emailTextfieldTextField = app.textFields["email-textfield"]
      emailTextfieldTextField.tap()
      emailTextfieldTextField.typeText("bademail")
      XCTAssertFalse(submitButton.isEnabled)
      
      //      app.typeText("\r")
      // Somehow I still cannot find the error label T_T
      //      XCTAssert(emailTextfieldTextField.staticTexts["Email is invalid."].exists)
      
      emailTextfieldTextField.tap()
      app.buttons["Clear text"].tap()
      emailTextfieldTextField.typeText("john@apple.com")
      XCTAssertFalse(submitButton.isEnabled)
      
      let passwordTextfieldSecureTextField = app.secureTextFields["password-textfield"]
      passwordTextfieldSecureTextField.tap()
      
      passwordTextfieldSecureTextField.typeText("12345")
      XCTAssertFalse(submitButton.isEnabled)
      
      app.buttons["Clear text"].tap()
      passwordTextfieldSecureTextField.typeText("123456")
      XCTAssert(submitButton.isEnabled)
    } else {
      // Fallback on earlier versions
      XCTAssert(false)
    }
    
  }
  
}
