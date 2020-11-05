//
//  userListViewController.swift
//  UserRegisterTable
//
//  Created by Admin on 11/3/20.
//

import UIKit
import Alamofire
import SwiftyJSON

class userListViewController: UIViewController {
    
    var userList: [Person] = []
    

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        sendRequest()
    }
    
    func sendRequest() {
            let url = "http://dummy.restapiexample.com/api/v1/employees"
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(contentType: ["application/json"]).responseJSON(completionHandler: { [self]response in
                print(response)
                switch response.result {
                case .success(let data):
                    
                    let json = JSON(data)
                    print(json)
                    for i in 0..<json["data"].count {
                        let profileimg = json["data"][i]["profile_image"].stringValue
                        let employeeage = json["data"][i]["employee_age"].stringValue
                        let salary = json["data"][i]["employee_salary"].stringValue
                        let id = json["data"][i]["id"].stringValue
                        let name = json["data"][i]["employee_name"].stringValue
                        
                        self.userList.append(Person(name: name, id: id, salary: salary, age: employeeage))
                        print(profileimg, employeeage, salary, id, name)
                    }
                    self.tableView.reloadData()
                case .failure(let err):
                    print(err)
                }
            })

        }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension userListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userListTableViewCell", for: indexPath) as! userListTableViewCell
        let user = self.userList[indexPath.row]
        
        cell.userListFullName?.text = user.name
        cell.userListSalary?.text = user.salary
        cell.userListAge?.text = user.age
                
        return cell
    }
    
    
}
