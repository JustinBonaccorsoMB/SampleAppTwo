import XCTest

class SampleAppTwoFailingUITests: XCTestCase {
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Test is written to fail after tapping continueWithEmail.
    func test11() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        splashPage.continueWithEmail()
        
        // Will fail at next step (button is not present on screen)
        splashPage.continueWithEmail()
    }
    
    // Test will fail after tapping continueWithFacebook.
    func test12() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        splashPage.continueWithFacebook()
        
        // Will fail at next step (button is not present on screen)
        splashPage.continueWithFacebook()
    }
    
    // Test will fail after email login.
    func test13() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Input valid email
        emailPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Test that the email button does not exist in this state
        XCTAssertFalse(splashPage.emailButton.exists)
    }
    
    // Test will fail after facebook login.
    func test14() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Input valid credentials
        facebookPage.loginUserWithCredentials("justin.bonaccorso@MB.com", password: "Password1234")
        
        // Will fail at next step (button is not present)
        splashPage.continueWithEmail()
    }
    
    // Test will continue to loop until device crash
    func test15() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Navigate back to splash screen.
        emailPage.navigateBack()
    }
}



