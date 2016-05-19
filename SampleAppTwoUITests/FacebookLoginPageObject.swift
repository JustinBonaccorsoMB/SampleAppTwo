import Foundation
import XCTest

class FacebookLoginPageObject {
    
    let backButton = XCUIApplication().buttons["backButton"]
    let userNameTextField = XCUIApplication().textFields["facebookUser"]
    let passwordTextField = XCUIApplication().textFields["facebookPassword"]
    let loginButton = XCUIApplication().buttons["facebookLogin"]
    
    func navigateToSplashPage() {
        backButton.tap()
    }
    // Login user with provided credentials, then tap submit.
    func loginUserWithEmail(email: String, password: String) {
        userNameTextField.tap()
        userNameTextField.typeText(email)
        
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        loginButton.tap()
    }
    // Press the Back Button.
    func backButtonPressed() {
        backButton.tap()
    }
}