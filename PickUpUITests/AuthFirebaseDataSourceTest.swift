//
//  AuthFirebaseDataSourceTest.swift
//  PickUpTests
//
//  Created by Arian Rahbar on 4/4/21.
//

import XCTest
import Firebase
@testable import PickUp


class AuthFirebaseDataSourceTest: XCTestCase {
    
    var dataSource: AuthRepo!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
//        FirebaseApp.configure()
        XCUIApplication().launch()
        let auth = Auth.auth()
//        auth.useEmulator(withHost: "localhostt", port: 9099)
        dataSource = AuthFirebaseDataSource(auth: auth)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCorrectSignUp() {
        let email = "arahbar@usc.edu"
        let password = "1234"
        let testComplete = expectation(description: "sign up complete")
        let _ = dataSource.signup(email: email, password: password).sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("TESTING " + error.localizedDescription)
            case .finished:
                print("TESTING: success")
            }
        }, receiveValue: { id in
            XCTAssertNotNil(id)
            testComplete.fulfill()
        })
        wait(for: [testComplete], timeout: 10)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
