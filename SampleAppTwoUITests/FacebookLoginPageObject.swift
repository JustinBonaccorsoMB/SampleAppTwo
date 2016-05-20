import Foundation
import XCTest

class FacebookLoginPageObject {
    
    // MARK: Identify
    private let backButton = XCUIApplication().buttons["backButton"]
    private let userNameTextField = XCUIApplication().textFields["facebookUser"]
    private let passwordTextField = XCUIApplication().textFields["facebookPassword"]
    private let loginButton = XCUIApplication().buttons["facebookLogin"]
    
    // MARK: User Actions
    
    // Types only user email.
    func typeUserEmail(email: String) {
        userNameTextField.tap()
        userNameTextField.typeText(email)
    }
    
    // Types only user password.
    func typeUserPassword(password: String) {
        passwordTextField.tap()
        passwordTextField.typeText(password)
    }
   
    // Presses the backButton.
    func navigateBack() -> SplashPageObject {
        backButton.tap()
        return SplashPageObject()
    }

    // MARK: Page Regressions
    
    // Enters credentials then taps submit.
    func loginUserWithCredentials(email: String, password: String) -> HomePageObject {
        typeUserEmail(email)
        typeUserPassword(password)
        loginButton.tap()
        return HomePageObject()
    }
}
