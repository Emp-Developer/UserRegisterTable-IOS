//
//  userListTableViewCell.swift
//  UserRegisterTable
//
//  Created by Admin on 11/3/20.
//

import UIKit

class userListTableViewCell: UITableViewCell {

    @IBOutlet weak var userListPicture: UIImageView!
    @IBOutlet weak var userListFullName: UILabel!
    @IBOutlet weak var userListSalaryLbl: UILabel!
    @IBOutlet weak var userListSalary: UILabel!
    @IBOutlet weak var userListAgeLbl: UILabel!
    @IBOutlet weak var userListAge: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
