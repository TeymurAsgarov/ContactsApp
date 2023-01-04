//
//  SaveScreen.swift
//  ContactsApp
//
//  Created by Kasım on 12.11.2022.
//

import UIKit

class SaveScreen: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var viewModel = SaveViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnSave(_ sender: Any) {
        if let name = tfName.text , let phone = tfPhone.text {
            viewModel.save(name: name, phone: phone)
        }
    }
}
