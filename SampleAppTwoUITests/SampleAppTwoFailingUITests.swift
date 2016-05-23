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
    
    // Test will cease after tapping continueWithEmail.
    func test11() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        splashPage.continueWithEmail()
        
        // Test that the email button does not exist in this state
        XCTAssertFalse(splashPage.emailButton.exists)
    }
    
    // Test will cease after tapping continueWithFacebook.
    func test12() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        splashPage.continueWithFacebook()
        
        // Test that the email button does not exist in this state
        XCTAssertFalse(splashPage.emailButton.exists)
    }
    
    // Test will cease after email login.
    func test13() {
        
        // Initiate the spash screen.
        let splashPage = SplashPageObject()
        
        // Navigate to the Email page
        let emailPage = splashPage.continueWithEmail()
        
        // Input valid email
        emailPage.loginUserWithCredentials(UserModel.email, password: UserModel.password)
        
        // Test that the email button does not exist in this state
        XCTAssertFalse(splashPage.emailButton.exists)
    }
    
    // Test will cease after facebook login.
    func test14() {
        
        // Initiate the splash screen
        let splashPage = SplashPageObject()
        
        // Navigate to the facebook page
        let facebookPage = splashPage.continueWithFacebook()
        
        // Input valid credentials
        facebookPage.loginUserWithCredentials(UserModel.email, password: UserModel.password)
        
        // Test that the email button does not exist in this state
        XCTAssertFalse(splashPage.emailButton.exists)
    }
    
    // Test will continue to loop indefinetely.
//    func test15() {
//        
//        // Initiate the splash screen
//        let splashPage = SplashPageObject()
//        
//        // Navigate to the Email page
//        let emailPage = splashPage.continueWithEmail()
//        
//        while emailPage.backButton.exists || splashPage.emailButton.exists {
//            emailPage.navigateBack(); splashPage.continueWithEmail()
//        }
//    }
}





