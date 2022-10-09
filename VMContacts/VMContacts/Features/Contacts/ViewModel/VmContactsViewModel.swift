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
    private var allContatcs: [VmContact] = []
    var loadData : (() -> ()) = {}
    var hideActivityIndicator : (() -> ()) = {}
    
    private var apiService : UsersProtocol

    
    init(apiService : UsersProtocol =  ContactsLoader()) {
        self.apiService =  apiService
        self.callFuncToGetData()
    }
    
  
    func callFuncToGetData() {
        
        self.apiService.getUsers { (result: Result<[VmContact], Error>) in
            
            switch result {
            case .success(let resultValue):
                self.allContatcs = resultValue
                self.hideActivityIndicator()
                self.searchContacts(str: "")
            case .failure(let error):
                print(error.localizedDescription)
                self.hideActivityIndicator()
            }
        }
    }
    
    func searchContacts(str : String) {
        
        if str.isEmpty {
            
            self.contatcs = self.allContatcs
        }
        else{
            
            self.contatcs = allContatcs.filter { $0.firstName.range(of:str) != nil }
        }
    }
    
    func getFullContatctName(contact : VmContact) -> String{
        
        return contact.firstName +  " " + contact.lastName
        
    }
 
}
