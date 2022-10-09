//
//  MockContactsLoader.swift
//  VMContactsTests
//
//  Created by Anumol Abraham Chakkungal on 09/10/2022.
//

import Foundation
@testable import NetworkLayer
@testable import VMContacts



class MockContactsLoader: UsersProtocol {
    
    func getUsers<T : Codable>(_ completion: @escaping (Result<[T], Error>) -> Void) {
        
        let JSON = """
        [{
                    "createdAt" : "2022-08-01T05:26:40.059Z",
                    "firstName" : "Vaughn",
                    "avatar"    : "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1183.jpg",
                    "lastName"  : "Keeling",
                    "email"     : "Sharon.Spinka@gmail.com",
                    "jobtitle"  : "Senior Implementation Strategist",
                    "favouriteColor" : "indigo",
                    "id"        : "70"
        }]
        """

        let jsonData = JSON.data(using: .utf8)!
        let responseObject = try! JSONDecoder().decode([T].self, from: jsonData)
        completion(.success(responseObject))
    }
    
    
    
}
