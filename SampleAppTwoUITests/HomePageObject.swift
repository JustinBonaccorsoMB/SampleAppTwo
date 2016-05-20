import Foundation
import XCTest

class HomePageObject {
    
    let welcomeLabel = XCUIApplication().staticTexts["Logged In!"]
    let settingsTabBarButton = XCUIApplication().tabBars.buttons.elementBoundByIndex(1)
    
    // Navigates to the settings page
    func navigateToSettingsPage() -> SettingsPageObject {
        settingsTabBarButton.tap()
        return SettingsPageObject()
    }
}