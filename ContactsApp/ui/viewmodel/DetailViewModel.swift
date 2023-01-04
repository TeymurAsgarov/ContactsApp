//
//  DetailViewModel.swift
//  ContactsApp
//
//  Created by Teymur Asgarov on 03.12.22.
//

import Foundation

class DetailViewModel {
    var prepo = PersonsDaoRepo()
    
    func update(person:PersonsModel,name:String,phone:String){
        prepo.update(person: person, name: name, phone: phone)
    }
}
