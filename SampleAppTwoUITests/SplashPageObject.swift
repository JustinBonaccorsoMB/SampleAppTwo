import Foundation
import XCTest

class SplashPageObject {
    
    // MARK: Identify
    let facebookButton = XCUIApplication().buttons["connectWithFacebook"]
    let emailButton = XCUIApplication().buttons["continueWithEmail"]

    // MARK: Page Regressions
    func continueWithFacebook() -> FacebookLoginPageObject {
        facebookButton.tap()
        return FacebookLoginPageObject()
    }
    
    func continueWithEmail() -> EmailLoginPageObject {
        emailButton.tap()
        return EmailLoginPageObject()
    }
}
