import Foundation
import XCTest

class HomePageObject {
    
    let welcomeLabel = XCUIApplication().staticTexts["Logged In!"]
    let settingsTabBarButton = XCUIApplication().tabBars.buttons.elementBoundByIndex(1)
    
    func navigateToSettingsPage() {
        settingsTabBarButton.tap()
    }
}