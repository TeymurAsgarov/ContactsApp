//
//  ViewController.swift
//  ContactsApp
//
//  Created by Kasım on 12.11.2022.
//

import UIKit
import RxSwift

class HomeScreen : UIViewController {
    @IBOutlet weak var personsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var personsList = [PersonsModel]()
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        personsTableView.delegate = self
        personsTableView.dataSource = self

        _ = viewModel.personsList.subscribe(onNext: { list in
            self.personsList = list
            self.personsTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadPersons()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let person = sender as? PersonsModel {
                let detailScreen = segue.destination as! DetailScreen
                detailScreen.person = person
            }
        }
    }
}


extension HomeScreen : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.loadPersons()
        }else{
            viewModel.search(searchText: searchText)
            
        }
    }
}


extension HomeScreen : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = personsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell") as! PersonTableViewCell
        
        cell.lblPersonInfo.text = "\(person.name!) - \(person.phone!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = personsList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (action,view,bool) in
            let person = self.personsList[indexPath.row]
            
            let alert = UIAlertController(title: "Deletion Process", message: "Do you want to delete \(person.name!) ?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.viewModel.delete(person: person)
            }
            alert.addAction(yesAction)
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
