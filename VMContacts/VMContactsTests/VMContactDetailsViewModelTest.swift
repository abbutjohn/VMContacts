//
//  VMContactDetailsViewModelTest.swift
//  VMContactsTests
//
//  Created by Anumol Abraham Chakkungal on 09/10/2022.
//

import XCTest
@testable import NetworkLayer
@testable import VMContacts


final class VMContactDetailsViewModelTest: XCTestCase {
    
    var sut : VmContactDetailsViewModel!
    
    override func setUp() {
        super.setUp()
    
        sut = VmContactDetailsViewModel(contact: VmContact(createdAt: "2022-08-01T05:26:40.059Z",
                                                                             firstName: "Vaughn",
                                                                             avatar: "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1183.jpg",
                                                                             lastName: "Keeling",
                                                                             email: "Sharon.Spinka@gmail.com",
                                                                             jobtitle: "Senior Implementation Strategist",
                                                                             favouriteColor: "indigo",
                                                                             id: "70"))
    }
    
    override func tearDown() {
        
        sut = nil
        super.tearDown()
    }
    
    func test_getSectionsCount() {
       
        XCTAssertEqual(sut.getSectionsCount(), 2)

    }
    
    func test_getRowsInSectionCount_rowZero(){
        
        XCTAssertEqual(sut.getRowsInSectionCount(section: 0), 1)
        
    }
    
    func test_getRowsInSectionCount_rowAboveZero(){
        
        XCTAssertEqual(sut.getRowsInSectionCount(section: 1), 5)
        
    }
    
    
    func test_getFullContatctName(){
                        
        XCTAssertEqual(sut.getFullContatctName(), "Vaughn Keeling")
        
    }
    
    func test_getAvatarName(){
                        
        XCTAssertEqual(sut.getAvatarName(), "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1183.jpg")
        
    }
    
    
    func  test_getNameAndValue_indexPathOne(){
                
        let index = IndexPath(row: 0, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).0, "Job title")
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).1, "Senior Implementation Strategist")

    }
    
    
    func  test_getNameAndValue_indexPathTwo(){
        
        let index = IndexPath(row: 1, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).0, "Email")
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).1, "Sharon.Spinka@gmail.com")

        
    }
    
    func  test_getNameAndValue_indexPathThree(){
                
        let index = IndexPath(row: 2, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).0, "Created date")
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).1, "2022-08-01T05:26:40.059Z".convertToDate())

        
    }
    
    func  test_getNameAndValue_indexPathFour(){
                
        let index = IndexPath(row: 3, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).0, "Favourite Color")
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).1, "indigo")

        
    }
    
    
    func  test_getNameAndValue_indexPathFive(){
                
        let index = IndexPath(row: 4, section: 0)
        
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).0, "Id")
        XCTAssertEqual(sut.getNameAndValue(indexPath: index).1, "70")

        
    }
}
