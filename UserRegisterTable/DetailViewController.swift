//
//  DetailViewController.swift
//  UserRegisterTable
//
//  Created by Admin on 11/3/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var userdetail: Person?

    @IBOutlet weak var mePicture: UIImageView!
    @IBOutlet weak var meFullName: UILabel!
    @IBOutlet weak var meSalaryLbl: UILabel!
    @IBOutlet weak var meSalary: UILabel!
    @IBOutlet weak var meAgeLbl: UILabel!
    @IBOutlet weak var meAge: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(userdetail?.name)
        self.meFullName?.text = userdetail?.name
        self.meSalary?.text = userdetail?.salary
        self.meAge?.text = userdetail?.age
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
