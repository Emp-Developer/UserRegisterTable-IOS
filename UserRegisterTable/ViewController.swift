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
    var validation = Validation()
    

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
        guard let name = createNameTxt.text, let salary = createSalaryTxt.text, let age = createAgeTxt.text else {
            return
        }
        
        let isValidateName = self.validation.validateName(name: name)
              if (isValidateName == false) {
                 print("Incorrect Name")
                 return
              }
        let isValidateSalary = self.validation.validaSalary(Salary: salary)
            if (isValidateSalary == false) {
                print("Invalid Salary!")
                return
            }
        let isValidateAge = self.validation.validaAge(Age: age)
              if (isValidateName == true || isValidateSalary == true || isValidateAge == true) {
                request()
                showIndicator(withTitle: "Loading...", and: "User List")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    goMainScreen()
                }
                
              }
        
    }
    //SaveInfo with UserDefaults
    func saveInfo() {
        
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
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { [self]
            response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                print(json)
            saveInfo()
            case .failure(let error):
                print(error)
            }
        }
        
    }


}


extension UIViewController {
   func showIndicator(withTitle title: String, and Description:String) {
      let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
      Indicator.label.text = title
      Indicator.isUserInteractionEnabled = false
      Indicator.detailsLabel.text = Description
      Indicator.show(animated: true)
   }
   func hideIndicator() {
      MBProgressHUD.hide(for: self.view, animated: true)
   }
}
