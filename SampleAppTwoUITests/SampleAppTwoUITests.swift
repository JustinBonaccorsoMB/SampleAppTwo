import XCTest

struct UserModel {
    static let email = "justin.bonaccorso@MB.com"
    static let password = "Password1234"
}

class SampleAppTwoUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Test will progress to email page then tap back button.
    func test01() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Navigate back to splash screen.
        emailPage.navigateBack()
        NSThread.sleepForTimeInterval(1)
    }
    
    // Test will choose facebook login then tap back button.
    func test02() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the email page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Navigate back to splash screen.
        facebookPage.navigateBack()
        NSThread.sleepForTimeInterval(1)
    }
    
    // Test will login a user with facebook then settings, logout.
    func test03() {
    
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Input valid credentials
        let homePage = facebookPage.loginUserWithCredentials(UserModel.email, password: UserModel.password)
        NSThread.sleepForTimeInterval(1)
        
        // Navigate to settings and logout.
        let settingsPage = homePage.navigateToSettingsPage()
        settingsPage.continueWithLogout()
    }
    
    // Test will login a user with email then settings, logout.
    func test04() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Input valid email
        let homePage = emailPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Navigate to settings and logout.
        let settingsPage = homePage.navigateToSettingsPage()
        settingsPage.continueWithLogout()
    }
    
    // Test will choose email login, then back out and continue with facebook login.
    func test05() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Navigate back to splash screen.
        emailPage.navigateBack()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Input valid credentials
        facebookPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        NSThread.sleepForTimeInterval(1)
    }
    
    // Test will choose facebook login, then back out and continue with email login.
    func test06() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Navigate back to splash screen.
        facebookPage.navigateBack()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Input valid email
        emailPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
    }

    
    // Test will choose email, enter credentials, back out and continue with facebook login, settings, logout.
    func test07() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Type user email
        emailPage.typeUserName("Justin.Bonaccorso@MB.com")
        
        // Navigate back to splash screen.
        emailPage.navigateBack()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Input valid credentials
        let homePage = facebookPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Navigate to settings and logout.
        let settingsPage = homePage.navigateToSettingsPage()
        settingsPage.continueWithLogout()
    }

    // Test will choose facebook login, back out and continue with email login then settings, logout.
    func test08() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Navigate back to splash screen.
        facebookPage.navigateBack()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()

        // Input valid email
        let homePage = emailPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Navigate to settings and logout.
        let settingsPage = homePage.navigateToSettingsPage()
        settingsPage.continueWithLogout()
    }
    
    // Test will enter email credentials, press home, reopen and login then settings, logout.
    func test09() {
        
        // Initiate the splash screen
        var splashPage = SplashPageObject()
        
        // Navigate to the Email page
        var emailPage = splashPage.continueWithEmail()
        
        // Enter email credentials
        emailPage.typeUserName("Justin.Bonaccorso@MB.com")
        
        XCUIDevice().pressButton(XCUIDeviceButton.Home)
        XCUIApplication().launch()

        // Navigate to the Email page
        splashPage = SplashPageObject()
        emailPage = splashPage.continueWithEmail()
        
        // Input valid email
        let homePage = emailPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Navigate to settings and logout.
        let settingsPage = homePage.navigateToSettingsPage()
        settingsPage.continueWithLogout()
    }
    
    // Test will enter facebook credentials, press home, reopen and login then settings, logout.
    func test10() {
        
        // Initiate the splash screen.
        var splashPage = SplashPageObject()
        NSThread.sleepForTimeInterval(1)
        
        // Navigate to the facebook page.
        var facebookPage = splashPage.continueWithFacebook()
        
        XCUIDevice().pressButton(XCUIDeviceButton.Home)
        XCUIApplication().launch()
        
        // Navigate to the facebook page.
        splashPage = SplashPageObject()
        facebookPage = splashPage.continueWithFacebook()
        
        // Input valid credentials
        let homePage = facebookPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Navigate to settings and logout.
        let settingsPage = homePage.navigateToSettingsPage()
        NSThread.sleepForTimeInterval(1)
        settingsPage.continueWithLogout()
    }
}