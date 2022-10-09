//
//  MockRoomsLoader.swift
//  VMContactsTests
//
//  Created by Anumol Abraham Chakkungal on 09/10/2022.
//

import XCTest
@testable import NetworkLayer
@testable import VMContacts


class MockRoomsLoader: RoomsProtocol {
        
    func getRooms<T : Codable>(_ completion: @escaping (Result<[T], Error>) -> Void) {
      
        let JSON = """
        [{
                    "createdAt" : "2022-08-01T05:26:40.059Z",
                    "isOccupied" : true,
                    "maxOccupancy"    : 11494.0,
                    "id"  : "abcd"
        }]
        """

        let jsonData = JSON.data(using: .utf8)!
        let responseObject = try! JSONDecoder().decode([T].self, from: jsonData)
        completion(.success(responseObject))
        
    }

}
