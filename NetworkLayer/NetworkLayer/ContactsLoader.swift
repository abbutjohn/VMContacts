//
//  ContactsLoader.swift
//  NetworkLayer
//
//  Created by Abbut John on 08/10/2022.
//

import Foundation


public protocol UsersProtocol {
    
    func getUsers<T : Codable>(_ completion: @escaping (Result<[T], Error>) -> Void)
}

public class ContactsLoader: UsersProtocol {
    
    private let networkService : NetworkServices
    
    public init(){
        
        networkService = NetworkServices.shared
    }
    
    
    public func getUsers<T : Codable>(_ completion: @escaping (Result<[T], Error>) -> Void) {
        
        
        networkService.request(router: NetworkRouter.getContatcs) { (result: Result<[T], Error>) in
            switch result {
            case .success(let resultValue):
                completion(.success(resultValue))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}


