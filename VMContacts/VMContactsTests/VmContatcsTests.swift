//
//  VmContatcsTests.swift
//  VM_appTests
//
//  Created by Abbut John on 08/10/2022.
//

import XCTest
@testable import VMContacts
@testable import NetworkLayer


class VmContatcsTests: XCTestCase {
    
    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }

    func testCallFuncToGetValidCharectersData() {
        
        let data = ContactsLoader()
        let expectations = self.expectation(description: "GotContact")
        
        data.getUsers() { (result: Result<[VmContact], Error>) in
            // ASSERT
            switch result {
            case .success(let result):
                XCTAssertNotNil(result)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectations.fulfill()
        }
        waitForExpectations(timeout: 0.6, handler: nil)
    }
    
}
