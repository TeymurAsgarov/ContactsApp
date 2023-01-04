//
//  HomeViewModel.swift
//  ContactsApp
//
//  Created by Teymur Asgarov on 03.12.22.
//

import Foundation
import RxSwift

class HomeViewModel {
    var personsList = BehaviorSubject<[PersonsModel]>(value: [PersonsModel]())
    var prepo = PersonsDaoRepo()
    
    init(){
        loadPersons()
        personsList = prepo.personsList
    }
    
    func loadPersons(){
        prepo.loadPersons()
    }
    
    func search(searchText:String){
        prepo.search(searchText: searchText)
    }
    
    func delete(person:PersonsModel){
        prepo.delete(person: person)
    }
}
