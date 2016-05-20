import Foundation
import XCTest

class SettingsPageObject {
    
    let logoutButton = XCUIApplication().buttons["Logout"]
    let homeTabBarButton = XCUIApplication().staticTexts["Logout"]
    
    func continueWithLogout() {
        logoutButton.tap()
    }
    
    // Navigates to the main page
    func navigateToHomePage() -> SettingsPageObject {
        homeTabBarButton.tap()
        return SettingsPageObject()
    }
}