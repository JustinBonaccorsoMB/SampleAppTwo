import Foundation
import XCTest

class EmailLoginPageObject {

    // MARK: Identity
    private let backButton = XCUIApplication().buttons["backButton"]
    private let userNameTextField = XCUIApplication().textFields["email"]
    private let passwordTextField = XCUIApplication().textFields["password"]
    private let loginButton = XCUIApplication().buttons["submit"]
    
    // MARK: User Actions
    
    // Presses the backButton
    func navigateBack() -> SplashPageObject {
        backButton.tap()
        return SplashPageObject()
    }
    
    // Types only user email.
    func typeUserName(email: String) {
        userNameTextField.tap()
        userNameTextField.typeText(email)
    }
    
    // Types only user password.
    func typePassword(password: String) {
        passwordTextField.tap()
        passwordTextField.typeText(password)

    }
    
    // MARK: Page Regressions
    
    // Enters credentials then taps submit.
    func loginUserWithCredentials(email: String, password: String) -> HomePageObject {
        typeUserName(email)
        typePassword(password)
        loginButton.tap()
        return HomePageObject()
    }
}

// Ok so heres the thing, I can't get those single entry ones to work, I have a sample of the way the full login works, but the types only email has a wierd error
