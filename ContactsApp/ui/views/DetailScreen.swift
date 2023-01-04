//
//  DetailScreen.swift
//  ContactsApp
//
//  Created by Kasım on 12.11.2022.
//

import UIKit

class DetailScreen: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var person:PersonsModel?
    
    var viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = person {
            tfName.text = p.name
            tfPhone.text = p.phone
        }
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        if let name = tfName.text, let phone = tfPhone.text , let p = person {
            viewModel.update(person: p, name: name, phone: phone)
        }
    }
}
