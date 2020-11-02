//
//  ViewController.swift
//  UserRegisterTable
//
//  Created by Admin on 11/2/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appTitleLbl: UILabel!
    @IBOutlet weak var createNameTxt: UITextField!
    @IBOutlet weak var createSalaryTxt: UITextField!
    @IBOutlet weak var createAgeTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: - Set Styles of TextField
        self.appTitleLbl.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.createNameTxt.attributedPlaceholder = NSAttributedString(string: "Placeholder Text", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.italicSystemFont(ofSize: 18)
        ])
        self.createNameTxt.font = UIFont.boldSystemFont(ofSize: 20)
        self.createNameTxt.layer.cornerRadius = 5.0
        
        self.createSalaryTxt.font = UIFont.boldSystemFont(ofSize: 20)
        self.createSalaryTxt.layer.cornerRadius = 5.0
        
        self.createAgeTxt.font = UIFont.boldSystemFont(ofSize: 20)
        self.createAgeTxt.layer.cornerRadius = 5.0
        
    }

    // MARK: - Button Actions
    @IBAction func createUserBtn(_ sender: Any) {
    }
    
    
}

