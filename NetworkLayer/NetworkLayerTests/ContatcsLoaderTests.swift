//
//  VmContatcsTests.swift
//  VM_appTests
//
//  Created by Abbut John on 08/10/2022.
//

import XCTest
@testable import NetworkLayer

class ContatcsLoaderTests: XCTestCase {
 
    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }

    func testCallFuncTogetContacts() {
        
        let networkService = MockNetworkService.shared

        let expectations = self.expectation(description: "GotContact")
        
        networkService.getUsers() { (result: Result<[TestVmContact], Error>) in
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

struct TestVmContact: Codable{
    
    let createdAt: String
    let firstName: String
    let avatar: String
    let lastName: String
    let email: String
    let jobtitle: String
    let favouriteColor: String
    let id: String

}
