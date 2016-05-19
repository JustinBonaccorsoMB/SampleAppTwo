import Foundation
import XCTest

class EmailLoginPageObject {

    let backButton = XCUIApplication().buttons["backButton"]
    let userNameTextField = XCUIApplication().textFields["email"]
    let passwordTextField = XCUIApplication().textFields["password"]
    let loginButton = XCUIApplication().buttons["submit"]
    
    func navigateToSplashPage() {
        backButton.tap()
    }
    
    // Only enters credentials into their respective textFields
    func enterCredentials(email: String, password: String) {
        userNameTextField.tap()
        userNameTextField.typeText(email)
        
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }
    
    //Enters credentials then taps submit
    func loginUserWithEmail(email: String, password: String) {
        enterCredentials(email, password: password)
        
        // This enters the app
        loginButton.tap()
    }
    // Presses the backButton
    func backButtonPressed() {
        backButton.tap()
    }
}