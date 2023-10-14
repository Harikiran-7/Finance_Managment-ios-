//
//  signupViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 12/10/23.
//

import UIKit

class signupViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var rpass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        username.layer.cornerRadius=22
        pass.layer.cornerRadius=22
        signup.layer.cornerRadius=22
        rpass.layer.cornerRadius=22
    }
    
    var new_user:User?
    @IBAction func signup(_ sender: Any) {
        if username.text != "" && pass.text != " " && pass.text == rpass.text{
            new_user = User(username:"\(username.text!)", password: "\(pass.text!)", transactions: [])
            UserManager.shared.addUser(new_user!)
            username.text=""
            pass.text=""
            rpass.text=""
            print("Signup successful for user: \(new_user)")
           dismiss(animated: true, completion: nil)
        }
    }
}

