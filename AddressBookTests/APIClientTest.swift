//
//  APIClientTest.swift
//  AddressBook
//
//  Created by Miwand Najafe on 2016-04-21.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import XCTest
@testable import AddressBook
class APIClientTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testgetDataFromAPI() {
         let asyncExpectation = expectationWithDescription("RunningFunction")
        APIClient.sharedInstance.getData { (data, responseCode, error) in
            XCTAssertNil(error, "There is an error with the connection")
            XCTAssertEqual(responseCode, 200, "Response status code should be 200")
            XCTAssertNotNil(data, "data should not be nil")
            asyncExpectation.fulfill()
        }
        self.waitForExpectationsWithTimeout(5, handler: nil)
    }
    
}
