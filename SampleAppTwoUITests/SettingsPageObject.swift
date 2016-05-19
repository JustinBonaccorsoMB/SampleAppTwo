import Foundation
import XCTest

class SettingsPageObject {
    
    let logoutButton = XCUIApplication().buttons["Logout"]
    
    func continueWithLogout() {
        logoutButton.tap()
    }
}