import Foundation
import XCTest

class SplashPageObject {
    
    let facebookButton = XCUIApplication().buttons["connectWithFacebook"]
    let emailButton = XCUIApplication().buttons["continueWithEmail"]
    
    func continueWithFacebook() {
        facebookButton.tap()
    }
    
    func continueWithEmail() {
        emailButton.tap()
    }
}
