//
//  RoomsLoader.swift
//  NetworkLayer
//
//  Created by Abbut John on 08/10/2022.
//

import Foundation


public protocol RoomsProtocol {
    
    func getRooms<T : Codable>(_ completion: @escaping (Result<[T], Error>) -> Void)
    
}

public class RoomsLoader: RoomsProtocol {
    
    private let networkService : NetworkServices
    
    public init(){
        
        networkService = NetworkServices.shared
    }
    
    public func getRooms<T : Codable>(_ completion: @escaping (Result<[T], Error>) -> Void) {
        
        
        networkService.request(router: NetworkRouter.getAvailableRooms) { (result: Result<[T], Error>) in
            switch result {
            case .success(let resultValue):
                completion(.success(resultValue))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
    }
}

