//
//  VMContactsTests.swift
//  VMContactsTests
//
//  Created by Abbut John on 08/10/2022.
//

import XCTest
@testable import NetworkLayer
@testable import VMContacts

final class VmAvailableRoomViewModelTests: XCTestCase {
    
    var roomLoader : RoomsProtocol!
    var sut        : VmAvailableRoomViewModel!
    
    override func setUp() {
        super.setUp()
        
        roomLoader            = MockRoomsLoader()
        sut                   = VmAvailableRoomViewModel(apiService: roomLoader)
    }
    
    override func tearDown() {
        
        sut = nil
        roomLoader = nil
        super.tearDown()
    }
    
    
    func test_CallFuncToGetData_Success() {
        
        let expectations = self.expectation(description: "GotRooms")
        
        roomLoader.getRooms() { (result: Result<[VmRoom], Error>) in
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
    
    
    func test_GetRowInSection_Success (){
        
        XCTAssertEqual(sut.getRowsInSection(), 4)

    }
    
    func test_GetRowInSection_Failure (){
        
        XCTAssertNotEqual(sut.getRowsInSection(), 0)

    }
    
    func test_filterOccupied_Status_true() {
        
        sut.callFuncToGetData()
        
        sut.filterOccupied(filter: true)
        
        XCTAssertEqual(sut.rooms.count, 0)

        
    }
    
    
    func test_filterOccupied_Status_false() {
        
        sut.callFuncToGetData()
        
        sut.filterOccupied(filter: false)
        
        XCTAssertEqual(sut.rooms.count, 1)

        
    }
    
    func  test_getNameAndValue_indexPathOne(){
        
        sut.callFuncToGetData()
        
        let index = IndexPath(row: 0, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).0, "Room ID")
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).1, "abcd")

    }
    
    
    func  test_getNameAndValue_indexPathTwo(){
        
        sut.callFuncToGetData()
        
        let index = IndexPath(row: 1, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).0, "Created")
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).1, "2022-08-01T05:26:40.059Z".convertToDate())

        
    }
    
    func  test_getNameAndValue_indexPathThree(){
        
        sut.callFuncToGetData()
        
        let index = IndexPath(row: 2, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).0, "Is occupied")
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).1, "Yes")

        
    }
    
    func  test_getNameAndValue_indexPathFour(){
        
        sut.callFuncToGetData()
        
        let index = IndexPath(row: 3, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).0, "Max Occupancy")
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).1, "11494.0")

        
    }
    
    
    func  test_getNameAndValue_indexPathFive(){
        
        sut.callFuncToGetData()
        
        let index = IndexPath(row: 3, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).0, "")
        XCTAssertEqual(sut.getNameAndValue(room: sut.rooms.first! , indexPath: index).1, "")

        
    }


}
