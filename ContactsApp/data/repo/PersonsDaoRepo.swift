//
//  PersonsDaoRepo.swift
//  ContactsApp
//
//  Created by Teymur Asgarov on 03.12.22.
//

import Foundation
import RxSwift

class PersonsDaoRepo {
    var personsList = BehaviorSubject<[PersonsModel]>(value: [PersonsModel]())
    
    let context = app.persistentContainer.viewContext
    
    func save(name:String,phone:String){
        let newPerson = PersonsModel(context: context)
        newPerson.name = name
        newPerson.phone = phone
        
        app.saveContext()
    }
    
    func update(person:PersonsModel,name:String,phone:String){
        person.name = name
        person.phone = phone
        
        app.saveContext()
    }
    
    func loadPersons(){
        do{
            let list = try context.fetch(PersonsModel.fetchRequest())
            personsList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func search(searchText:String){
        do {
            let fr = PersonsModel.fetchRequest()
            fr.predicate = NSPredicate(format: "name CONTAINS %@", searchText)
            let list = try context.fetch(fr)
            personsList.onNext(list)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func delete(person:PersonsModel){
        context.delete(person)
        app.saveContext()
        loadPersons()
    }
}
