//
//  RoomsLoader.swift
//  NetworkLayer
//
//  Created by Abbut John on 08/10/2022.
//

import Foundation


public protocol RoomsProtocol {
    
    func getRooms<T>(_ completion: @escaping (Result<[T], Error>) -> Void) where T : Decodable, T : Encodable
}


public class RoomsController: RoomsProtocol {
    
    private let networkService : NetworkServices
    
    public init(){
        
        networkService = NetworkServices.shared
    }
    
    public func getRooms<T>(_ completion: @escaping (Result<[T], Error>) -> Void) where T : Decodable, T : Encodable {
        
        
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

