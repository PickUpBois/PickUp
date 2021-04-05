//
//  AuthFirebaseDataSourceTest.swift
//  PickUpTests
//
//  Created by Arian Rahbar on 4/4/21.
//

import XCTest
import Firebase
@testable import PickUp
import Combine


class AuthFirebaseDataSourceTest: XCTestCase {
    
    var dataSource: AuthRepo!
    var cancellables = Set<AnyCancellable>()
    private var auth: Auth = { () -> Auth in
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        let fAuth = Auth.auth()
        fAuth.useEmulator(withHost: "localhost", port: 9099)
        return fAuth
    }()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        dataSource = AuthFirebaseDataSource(auth: self.auth)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSignUpSignInCorrectlyLogoutDelete() {
        let authState = dataSource.observeAuthState()
        XCTAssertNil(authState.value)
        let email = "test@usc.edu"
        let password = "12345678"
        signUp(email: email, password: password)
        XCTAssertNotNil(authState.value)
        signin(email: email, password: password)
        delete()
        XCTAssertNil(authState.value)
    }
    
    func signUp(email: String, password: String, expectError: Bool = false) {
        let testComplete = expectation(description: "sign up complete")
        dataSource.signup(email: email, password: password).sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                if !expectError {
                    XCTFail("Got an error when trying to sign up: \(error.localizedDescription)")
                }
            case .finished:
                ()
            }
        }, receiveValue: { id in
            XCTAssertNotNil(id)
            if expectError {
                XCTFail("Expected an error on sign up")
            }
            testComplete.fulfill()
        }).store(in: &cancellables)
        wait(for: [testComplete], timeout: 10)
    }
    
    func signin(email: String, password: String, expectError: Bool = false) {
        let testComplete = expectation(description: "signin complete")
        dataSource.login(email: email, password: password).sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                if !expectError {
                    XCTFail("Got an error when trying to sign up: \(error.localizedDescription)")
                }
            case .finished:
                ()
            }
        }, receiveValue: { id in
            XCTAssertNotNil(id)
            if expectError {
                XCTFail("Expected an error on sign up")
            }
            testComplete.fulfill()
        }).store(in: &cancellables)
        wait(for: [testComplete], timeout: 10)
    }
    
    func logout(expectError: Bool = false) {
        let testComplete = expectation(description: "logout complete")
        dataSource.logout().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                if !expectError {
                    XCTFail("Got an error when trying to log out: \(error.localizedDescription)")
                }
                testComplete.fulfill()
            case .finished:
                if expectError {
                    XCTFail("Expected an error on log out")
                }
                testComplete.fulfill()
            }
        }, receiveValue: { () in
            
        }).store(in: &cancellables)
        wait(for: [testComplete], timeout: 10)
    }
    
    func delete() {
        let testComplete = expectation(description: "delete complete")
        dataSource.delete().sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                XCTFail("Got an error when trying to log out: \(error.localizedDescription)")
                testComplete.fulfill()
            case .finished:
                testComplete.fulfill()
            }
        }, receiveValue: { () in
            
        }).store(in: &cancellables)
        wait(for: [testComplete], timeout: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
