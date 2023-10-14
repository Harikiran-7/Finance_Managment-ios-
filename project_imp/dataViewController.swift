//
//  dataViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 12/10/23.
//

import UIKit

class dataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var ind:Int=0
    var ind_table=0
    var inc_value=0
    var exp_value=0
    var total_value=0
    var edit_ind=0
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var inc: UILabel!
    @IBOutlet weak var exp: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var des: UITextField!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var edit: UISwitch!
    @IBOutlet weak var progressbar: UIProgressView!
    
    var new_t:Transaction = Transaction(amount: 0, description: "NA")
    var images = [UIImage(named:"grupee"),UIImage(named: "rrupee")]
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
        for value in UserManager.shared.users[ind].transactions {
            if value.amount>0{
                inc_value = inc_value+value.amount
            }else{
                exp_value=exp_value+value.amount
            }
            total_value = total_value + value.amount
        }
        exp_value = exp_value * -1
        name.text="Hello! \(UserManager.shared.users[ind].username)"
        inc.text="₹ \(inc_value)"
        exp.text="₹ \(exp_value)"
        total.text="₹ \(total_value)"
        var val = Float(Float(exp_value)/Float(inc_value))
        progressbar.progress = val
    }
    
    @IBAction func new_trans(_ sender: Any) {
        if !edit.isOn{
            var am = Int(amount.text!)
            new_t.amount=am!
            new_t.description=des.text!
            amount.text=""
            des.text=""
            total_value = total_value + am!
            if am! > 0{
                inc_value = inc_value + am!
            }else{
                exp_value = exp_value + (am! * -1)
            }
            inc.text="₹ \(inc_value)"
            exp.text="₹ \(exp_value)"
            total.text="₹ \(total_value)"
            UserManager.shared.users[ind].transactions.append(new_t)
            tableview.reloadData()
        }else{
            var am = Int(amount.text!)
            total_value = total_value + am!
            if am! > 0{
                inc_value = inc_value + am!
            }else{
                exp_value = exp_value + (am! * -1)
            }
            inc.text="₹ \(inc_value)"
            exp.text="₹ \(exp_value)"
            total.text="₹ \(total_value)"
            UserManager.shared.users[ind].transactions[edit_ind].amount = am!
            UserManager.shared.users[ind].transactions[edit_ind].description=des.text!
            amount.text=""
            des.text=""
            tableview.reloadData()
        }
        var val = Float(Float(exp_value)/Float(inc_value))
        progressbar.progress = val
        
    }
    
    @IBAction func logout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserManager.shared.users[ind].transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellobj = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cellobj.textLabel?.text = "₹ \(UserManager.shared.users[ind].transactions[indexPath.row].amount)"
        if UserManager.shared.users[ind].transactions[indexPath.row].amount < 0{
            cellobj.imageView?.image=images[1]
        }else{
            cellobj.imageView?.image=images[0]
        }
        cellobj.textLabel?.textAlignment = .center
        return cellobj
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ind_table = indexPath.row
        if edit.isOn{
            var prevam = UserManager.shared.users[ind].transactions[ind_table].amount
            amount.text="\(UserManager.shared.users[ind].transactions[ind_table].amount)"
            des.text="\(UserManager.shared.users[ind].transactions[ind_table].description)"
            total_value = total_value - prevam
            
            if prevam > 0{
                inc_value = inc_value - prevam
            }else{
                exp_value = exp_value + prevam
            }
            
            edit_ind=ind_table
            //total_value = total_value + UserManager.shared.users[ind].transactions[ind_table].amount
            
//            if UserManager.shared.users[ind].transactions[ind_table].amount > 0{
//                inc_value = inc_value + UserManager.shared.users[ind].transactions[ind_table].amount
//            }else{
//                exp_value = exp_value + (UserManager.shared.users[ind].transactions[ind_table].amount * -1)
//            }
            
            
            
        }else{
            performSegue(withIdentifier: "more", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var obj = segue.destination as! moredataViewController
        obj.am = "₹ \(UserManager.shared.users[ind].transactions[ind_table].amount)"
        obj.des = "\(UserManager.shared.users[ind].transactions[ind_table].description)"
    }
    

}
