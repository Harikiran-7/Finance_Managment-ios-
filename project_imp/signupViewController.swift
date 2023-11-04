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
  
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    var new_user:User?
    @IBAction func signup(_ sender: Any) {
        var user_found=false
        var length=false
        if username.text != "" && pass.text != " " && pass.text == rpass.text{
            
            for value in UserManager.shared.users {
                if username.text==value.username{
                    user_found=true
                }
            }
            if username.text!.count < 3 || pass.text!.count < 3 {
                length=true
            }
            
            if user_found == false && length == false{
                new_user = User(username:"\(username.text!)", password: "\(pass.text!)", transactions: [])
                UserManager.shared.addUser(new_user!)
                username.text=""
                pass.text=""
                rpass.text=""
                dismiss(animated: true, completion: nil)
            }
            
            if user_found == true {
                let okhandler = {
                    (action: UIAlertAction)->Void in
                }
                let alert = UIAlertController(title: "Warning!", message: "User Already Exists", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                self.present(alert, animated: true, completion: nil)
                username.text=""
                pass.text=""
                rpass.text=""
            }else {
                let okhandler = {
                    (action: UIAlertAction)->Void in
                }
                let alert = UIAlertController(title: "Warning!", message: "Length of password is too short", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                self.present(alert, animated: true, completion: nil)
                pass.text=""
                rpass.text=""
            }
            
        }else{
            let okhandler = {
                (action: UIAlertAction)->Void in
            }
            let alert = UIAlertController(title: "Warning!", message: "Check if username is not empty and password is same in both fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

