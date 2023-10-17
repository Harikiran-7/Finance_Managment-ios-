//
//  ViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 12/10/23.
//

import UIKit

class ViewController: UIViewController{
    var new_trans:[Transaction]=[]
    @IBOutlet weak var signin: UIButton!
    @IBOutlet weak var test: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    var ind=0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        username.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: username.frame.height))
        username.leftViewMode = .always
        pass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: pass.frame.height))
        pass.leftViewMode = .always
        username.layer.cornerRadius=22
        pass.layer.cornerRadius=22
        signin.layer.cornerRadius=22
        username.backgroundColor = UIColor.lightGray
        pass.backgroundColor = UIColor.lightGray
        signin.backgroundColor = UIColor.blue
        username.font = UIFont.systemFont(ofSize: 18)
        pass.font = UIFont.systemFont(ofSize: 18)
        signin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        username.placeholder = "Enter your username"
        pass.placeholder = "Enter your password"
        signin.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func signin(_ sender: Any) {
        var count=0
        var signin = false
        var user = false
        for name in UserManager.shared.users {
            if name.username==username.text {
                user=true
            }
            if(name.username==username.text && name.password==pass.text){
                signin=true
                user=true
                //test.text="Sign In"
                ind=count
                performSegue(withIdentifier: "login", sender: nil)
                username.text=""
                pass.text=""
            }
            count = count+1
        }
        if signin == false && user==false{
            let okhandler = {
                (action: UIAlertAction)->Void in
            }
            let alert = UIAlertController(title: "Warning!", message: "No Users Found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
            self.present(alert, animated: true, completion: nil)
            username.text=""
            pass.text=""
        }else if signin==false && user==true{
            let okhandler = {
                (action: UIAlertAction)->Void in
            }
            let alert = UIAlertController(title: "Warning!", message: "Please Check your Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
            self.present(alert, animated: true, completion: nil)
            pass.text=""
        }
               
    }
    
    
    @IBAction func author(_ sender: Any) {
        
        performSegue(withIdentifier: "author", sender: nil)
        
    }
    
    
    
    
    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "signup", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "login" {
            let obj = segue.destination as! dataViewController
            obj.ind = ind
            obj.modalPresentationStyle = .fullScreen
        }else if segue.identifier == "author"{
                let obj = segue.destination as! AuthorViewController
            obj.modalPresentationStyle = .fullScreen
        }else{
            let obj = segue.destination  as! signupViewController
            obj.modalPresentationStyle = .fullScreen
        }
    }
}

