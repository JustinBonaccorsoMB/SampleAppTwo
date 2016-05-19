import XCTest

class SampleAppTwoUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test01() {
        
        // Test will login a user with facebook then logout.
        let splash = SplashPageObject()
        let facebookPage = FacebookLoginPageObject()
        let homePage = HomePageObject()
        let settingsPage = SettingsPageObject()
        
        splash.continueWithFacebook()
        facebookPage.loginUserWithEmail("justin.bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        homePage.navigateToSettingsPage()

        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
    
    func test02() {
        
        // Test will login a user with email then logout.
        let splash = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        let settingsPage = SettingsPageObject()
        let homePage = HomePageObject()
        
        splash.continueWithEmail()
        emailPage.loginUserWithEmail("justin.bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        homePage.navigateToSettingsPage()
        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
    
    func test03() {
        
        // Test will choose email login, back out and then continue with facebook login.
        let splashPage = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        let facebookPage = FacebookLoginPageObject()
        
        splashPage.continueWithEmail()
        emailPage.navigateToSplashPage()
        splashPage.continueWithFacebook()
        
        facebookPage.loginUserWithEmail("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
    }
    
    func test04() {
        
        // Test will choose facebook login, back out and continue with email login.
        let splashPage = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        
        splashPage.continueWithFacebook()
        emailPage.navigateToSplashPage()
        splashPage.continueWithEmail()
        NSThread.sleepForTimeInterval(1)

        emailPage.loginUserWithEmail("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
    }

    func test05() {
        
        // Test will choose email, enter credentials, back out and continue with facebook login, settings, logout.
        let splashPage = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        let facebookPage = FacebookLoginPageObject()
        let settingsPage = SettingsPageObject()
        let homePage = HomePageObject()
        
        splashPage.continueWithEmail()
        emailPage.enterCredentials("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        emailPage.navigateToSplashPage()
        splashPage.continueWithFacebook()
        
        facebookPage.loginUserWithEmail("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        homePage.navigateToSettingsPage()
        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
    
    func test06() {
        
        // Test will choose facebook login, back out and continue with email login then settings, logout.
        let facebookPage = FacebookLoginPageObject()
        let splashPage = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        let homePage = HomePageObject()
        let settingsPage = SettingsPageObject()
        
        splashPage.continueWithFacebook()
        NSThread.sleepForTimeInterval(2)
        
        facebookPage.navigateToSplashPage()
        
        splashPage.continueWithEmail()
       
        emailPage.loginUserWithEmail("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        homePage.navigateToSettingsPage()
        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
    
    func test07() {
        
        // Test will enter email credentials, press home, reopen and login then settings, logout.
        let splashPage = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        let homePage = HomePageObject()
        let settingsPage = SettingsPageObject()
        
        splashPage.continueWithEmail()
        
        XCTAssert(XCUIApplication().navigationBars.element.exists)
        
        XCUIDevice().pressButton(XCUIDeviceButton.Home)
        XCUIApplication().launch()
        
        //Checks that navigationbar still there on second launch
        XCTAssert(XCUIApplication().navigationBars.element.exists)
        
        splashPage.continueWithEmail()
        emailPage.loginUserWithEmail("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        homePage.navigateToSettingsPage()
        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
    
    func test08() {
        
        // Test will enter facebook credentials, press home, reopen and login then settings, logout.
        let splashPage = SplashPageObject()
        let homePage = HomePageObject()
        let settingsPage = SettingsPageObject()
        let facebookPage = FacebookLoginPageObject()
        
        splashPage.continueWithFacebook()
        
        XCTAssert(XCUIApplication().navigationBars.element.exists)
        
        XCUIDevice().pressButton(XCUIDeviceButton.Home)
        XCUIApplication().launch()
        
        //Checks that navigationbar still there on second launch
        XCTAssert(XCUIApplication().navigationBars.element.exists)
        
        splashPage.continueWithFacebook()
        NSThread.sleepForTimeInterval(1)
        
        facebookPage.loginUserWithEmail("Justin.Bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
        
        homePage.navigateToSettingsPage()
        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
    
    func test09() {
        // Test will choose email login, then tap back button.
        let splashPage = SplashPageObject()
        let emailPage = EmailLoginPageObject()
        
        splashPage.continueWithEmail()
        emailPage.backButtonPressed()
        NSThread.sleepForTimeInterval(1)
    }
    
    func test10() {
        // Test will choose facebook login then tap back button.
        let splashPage = SplashPageObject()
        let facebookPage = FacebookLoginPageObject()
        
        splashPage.continueWithEmail()
        facebookPage.backButtonPressed()
        NSThread.sleepForTimeInterval(1)
    
    }
    
    func test11() {
        
        // Test is written to FAIL at the 3rd step below.
        let splash = SplashPageObject()
        
        splash.continueWithEmail()
        NSThread.sleepForTimeInterval(1)
        
        // Should fail at next step (button is not present on screen)
        splash.continueWithEmail()
    }
}