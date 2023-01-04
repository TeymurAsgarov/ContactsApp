//
//  PersonTableViewCell.swift
//  ContactsApp
//
//  Created by Kasım on 12.11.2022.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPersonInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
