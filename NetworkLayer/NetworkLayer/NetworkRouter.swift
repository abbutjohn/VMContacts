//
//  peopleController.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import Foundation

enum NetworkRouter {
    
    // 1.
    case getContatcs
    case getAvailableRooms
    
    // 2.
    var scheme: String {
        switch self {
        case .getContatcs, .getAvailableRooms:
            return "https"
        }
    }
    
    // 3.
    var host: String {
        switch self {
        case .getContatcs, .getAvailableRooms:
            return "61e947967bc0550017bc61bf.mockapi.io"
        }
    }
    
    // 4.
    var path: String {
        switch self {
        case .getContatcs:
            return "/api/v1/people"
        case .getAvailableRooms:
            return "/api/v1/rooms"
        }
    }
    // 5.
    var method: String {
        switch self {
        case .getContatcs, .getAvailableRooms:
            return "GET"
        }
    }
    
    // 6.
    var parameters: [URLQueryItem] {
        switch self {
        case .getContatcs, .getAvailableRooms:
            return []
        }
    }
}

