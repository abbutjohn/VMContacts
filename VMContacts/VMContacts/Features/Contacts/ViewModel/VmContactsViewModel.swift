//
//  VmRoomViewModel.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//


import Foundation
import NetworkLayer

class VmContactsViewModel {
    
    var contatcs: [VmContact] = [] {
        didSet {
            self.loadData()
        }
    }
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    
    private var apiService : UsersProtocol

    
    init(apiService : UsersProtocol =  UsersController()) {
        self.apiService =  apiService
        self.callFuncToGetBooksData()
    }
    
  
    func callFuncToGetBooksData() {
        
        self.apiService.getUsers { (result: Result<[VmContact], Error>) in
            
            switch result {
            case .success(let resultValue):
                self.contatcs = resultValue
                self.hideActivityIndicator()
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
    
    func getFullContatctName(contact : VmContact) -> String{
        
        return contact.firstName +  " " + contact.lastName
        
    }
 
}
