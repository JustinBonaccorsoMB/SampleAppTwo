import Foundation
import XCTest

class PageObject {
    
    let session: XCTestCase
    
    init(testCase: XCTestCase) {
        self.session = testCase
    }
}

