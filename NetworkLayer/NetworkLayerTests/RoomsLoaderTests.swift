//
//  VmRoomsTests.swift
//  VM_appTests
//
//  Created by Abbut John on 08/10/2022.
//

import XCTest
@testable import NetworkLayer

class RoomsLoaderTests: XCTestCase {

    override func setUp(){
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }


    func testCallFuncToGotRooms() {
        
        let networkService = MockNetworkService.shared
        let expectations = self.expectation(description: "GotRooms")
        
        networkService.getRooms() { (result: Result<[TestVmRoom], Error>) in
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

struct TestVmRoom: Codable{
    
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Double
    let id: String

}
