//
//  VmRoomsTests.swift
//  VM_appTests
//
//  Created by Abbut John on 08/10/2022.
//

import XCTest
@testable import VMContacts
@testable import NetworkLayer

class VmRoomsTests: XCTestCase {

    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }


    func testCallFuncToGetValidCharectersData() {
        
        let data =  RoomsLoader()
        let expectations = self.expectation(description: "GotRooms")
        
        data.getRooms() { (result: Result<[VmRoom], Error>) in
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
