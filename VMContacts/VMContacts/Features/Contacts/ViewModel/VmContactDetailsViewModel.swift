//
//  VmContatDetailsViewModel.swift
//  VM_app
//
//  Created by Abbut John on 08/10/2022.
//

import Foundation

class VmContactDetailsViewModel {
    
    var contact: VmContact

    
    init(contact : VmContact) {
        
        self.contact =  contact
    }
    
    func getSectionsCount() -> Int {
        
        return 2
    }
    
    func getRowsInSectionCount(section : Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            return 5
        }
    }
    
    func getFullContatctName() -> String{
        
        return contact.firstName +  " " + contact.lastName
        
    }
    
    func getAvatarName() -> String{
        
        return contact.avatar
        
    }
    
    func getNameAndValue(indexPath : IndexPath) -> (String, String) {
        
        switch indexPath.row {
        case 0:
            return ("Job title", contact.jobtitle)
        case 1:
            return ("Email", contact.email)
        case 2:
            return ("Created date", contact.createdAt.convertToDate())
        case 3:
            return ("Favourite Color", contact.favouriteColor)
        case 4:
            return ("Id", contact.id)
        default:
            return ("", "")
        }
    }

}

