//
//  ViewController.swift
//  UserRegisterTable
//
//  Created by Admin on 11/2/20.
//

import UIKit
import Alamofire
import SwiftyJSON
import MBProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var appTitleLbl: UILabel!
    @IBOutlet weak var createNameTxt: UITextField!
    @IBOutlet weak var createSalaryTxt: UITextField!
    @IBOutlet weak var createAgeTxt: UITextField!
    
    @IBOutlet weak var createBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: - Set Styles of TextField
        self.appTitleLbl.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.createNameTxt.attributedPlaceholder = NSAttributedString(string: "Full Name:", attributes: [
            .foregroundColor: UIColor.lightGray,
            .font: UIFont.italicSystemFont(ofSize: 18)
        ])
        self.createNameTxt.font = UIFont.boldSystemFont(ofSize: 20)
        self.createNameTxt.layer.cornerRadius = 5.0
        
        self.createSalaryTxt.font = UIFont.boldSystemFont(ofSize: 20)
        self.createSalaryTxt.layer.cornerRadius = 5.0
        
        self.createAgeTxt.font = UIFont.boldSystemFont(ofSize: 20)
        self.createAgeTxt.layer.cornerRadius = 5.0
        
        self.createBtn.layer.cornerRadius = 5.0
    }

    // MARK: - Button Actions
    @IBAction func createUserBtn(_ sender: Any) {
        request()
        goMainScreen()
    }
    
    // MARK: - Go to TabBar
    func goMainScreen() {
           let scene = UIApplication.shared.connectedScenes.first
           if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
               let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "mainTabBar")
               sd.window?.rootViewController = initialViewController
               sd.window?.makeKeyAndVisible()
           }
    }
    
    // MARK: - GET Request
    func request() {
        let url = "http://dummy.restapiexample.com/api/v1/create"
        let parameters = ["name": createNameTxt.text!, "salary": createSalaryTxt.text!, "age": createAgeTxt.text!]
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON {
            response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
            
            case .failure(let error):
                print(error)
            }
        }
        
    }


}

