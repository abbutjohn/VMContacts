//
//  VmAvailableRoomViewModel.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//
import Foundation
import NetworkLayer


class VmAvailableRoomViewModel  {
    
    var rooms: [VmRoom] = [] {
        didSet {
            self.loadData()
        }
    }
    var filterStatus : Bool = false
    private var allRooms: [VmRoom] = []
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    private var apiService : RoomsProtocol

    
    init(apiService : RoomsProtocol =  RoomsLoader()) {
        self.apiService =  apiService
        self.callFuncToGetData()
    }
    
    func callFuncToGetData() {
        
        self.apiService.getRooms { (result: Result<[VmRoom], Error>) in
            switch result {
            case .success(let resultValue):
                self.allRooms = resultValue
                self.filterOccupied(filter: false)
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
    
    func getRowsInSection() -> Int{
        
        return 4
    }
    
    func filterOccupied(filter : Bool) {
        
        if filter {
            
            rooms = allRooms.filter { $0.isOccupied == false }
        }
        else{
            rooms = allRooms

        }
    }
    
    func getNameAndValue(room : VmRoom, indexPath : IndexPath) -> (String, String) {
        
        switch indexPath.row {
        case 0:
            return ( "Room ID", room.id)
        case 1:
            return ("Created", room.createdAt.convertToDate())
        case 2:
            return ("Is occupied", room.isOccupied ? "Yes" : "No")
        case 3:
            return ("Max Occupancy", String (room.maxOccupancy))
        default:
            return ("", "")
        }
    }
    
    
}
