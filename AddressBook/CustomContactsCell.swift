//
//  CustomContactsCell.swift
//  AddressBook
//
//  Created by Miwand Najafe on 2016-04-21.
//  Copyright © 2016 Miwand Najafe. All rights reserved.
//

import UIKit
import AFNetworking

class CustomContactsCell: UITableViewCell {
    
    
    @IBOutlet weak var personImg: UIImageView!
    @IBOutlet weak var personNum: UILabel!    
    @IBOutlet weak var personEmail: UILabel!
    @IBOutlet weak var personName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configCell(data:Person) {
        personName.text = data.fullName
        personImg.setImageWithURL(data.personImgURL)
        personNum.text = data.cellNum
        personEmail.text = data.email
    }
    
}
