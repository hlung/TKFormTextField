import UIKit
import XCTest
import TKFormTextField

class Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testExample() {
    // This is an example of a functional test case.
    XCTAssert(true, "Pass")
    
    let tf = TKFormTextField(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
    XCTAssert(tf.errorLabel.text == nil)
    XCTAssert(tf.titleLabel.text == nil)
    
    tf.error = "Error"
    XCTAssert(tf.errorLabel.text == "Error")
    XCTAssert(tf.hasError)
    tf.error = nil
    XCTAssert(tf.errorLabel.text == nil)
    XCTAssert(tf.hasError == false)
    
    tf.title = "Custom Title"
    XCTAssert(tf.titleLabel.text == "Custom Title")
    tf.title = nil
    XCTAssert(tf.titleLabel.text == nil)
    
    tf.placeholder = "Custom Placeholder"
    XCTAssert(tf.titleLabel.text == "Custom Placeholder")
    tf.placeholder = nil
    XCTAssert(tf.titleLabel.text == nil)
  }
  
}
