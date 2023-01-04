//
//  SaveViewModel.swift
//  ContactsApp
//
//  Created by Teymur Asgarov on 03.12.22.
//

import Foundation

class SaveViewModel {
    var prepo = PersonsDaoRepo()
    
    func save(name:String,phone:String){
        prepo.save(name: name, phone: phone)
    }
}
