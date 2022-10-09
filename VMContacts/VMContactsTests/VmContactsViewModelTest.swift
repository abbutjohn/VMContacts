//
//  VmContactsViewModelTest.swift
//  VMContactsTests
//
//  Created by Anumol Abraham Chakkungal on 09/10/2022.
//

import XCTest
@testable import NetworkLayer
@testable import VMContacts

final class VmContactsViewModelTest: XCTestCase {
    
    var contactLoader : UsersProtocol!
    var sut           : VmContactsViewModel!
    
    override func setUp() {
        super.setUp()
        
        contactLoader         = MockContactsLoader()
        sut                   = VmContactsViewModel(apiService: contactLoader)
    }
    
    override func tearDown() {
        
        sut = nil
        contactLoader = nil
        super.tearDown()
    }
    
    func test_CallFuncTogetContacts() {
       
        let expectations = self.expectation(description: "GotContact")
        
        contactLoader.getUsers() { (result: Result<[VmContact], Error>) in
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
    
    func test_searchContacts_WithNil(){
        
        sut.callFuncToGetData()
        
        sut.searchContacts(str: "")
        
        XCTAssertNotEqual(sut.contatcs.count, 0)
        
    }
    
    
    func test_searchContacts_WithName(){
        
        sut.callFuncToGetData()
        
        sut.searchContacts(str: "Vaughn")
        
        XCTAssertEqual(sut.contatcs.count, 1)
        
    }
    
    
    func test_getFullContatctName(){
        
        sut.callFuncToGetData()
                
        XCTAssertEqual(sut.getFullContatctName(contact: sut.contatcs.first!), "Vaughn Keeling")
        
    }
    
    
}

