//
//  dataViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 12/10/23.
//

import UIKit
import AVKit

class dataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
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
    @IBOutlet weak var track: UILabel!
    
    
    
    var new_t:Transaction = Transaction(amount: 0, description: "NA")
    var images = [UIImage(named:"grupee"),UIImage(named: "rrupee")]
    override func viewDidLoad() {
        super.viewDidLoad()
        track.layer.cornerRadius = 22
//         Do any additional setup after loading the view.
        //tableView.isEditing = true
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
        var ramount = amount.text!
        if !edit.isOn{
            if var am = Int(ramount){
                new_t.amount=am
                new_t.description=des.text!
                amount.text=""
                des.text=""
                if new_t.description == ""{
                    new_t.description="description not given"
                }
                var ctotal = total_value
                
//                if (ctotal + am) < 0 {
//                    let okhandler = {
//                        (action: UIAlertAction)->Void in
//                    }
//                    let alert = UIAlertController(title: "Warning!", message: "OOOps you dont have that much amount", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
//                    self.present(alert, animated: true, completion: nil)
//                    amount.text=""
//                }else{
                    total_value = total_value + am
//                    if am > 0{
                        inc_value = inc_value + am
//                    }else{
//                        exp_value = exp_value + (am * -1)
//                    }
                    inc.text="₹ \(inc_value)"
                    exp.text="₹ \(exp_value)"
                    total.text="₹ \(total_value)"
                    UserManager.shared.users[ind].transactions.append(new_t)
                    tableview.reloadData()
//                }
            }else{
                let okhandler = {
                    (action: UIAlertAction)->Void in
                }
                let alert = UIAlertController(title: "Warning!", message: "Please Enter a valid amount", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                self.present(alert, animated: true, completion: nil)
                amount.text=""
            }
        }else{
            if var am = Int(ramount){
                var tot = total_value
                print("\(total_value) in editing")
                total_value = total_value + am
                print("\(total_value) in editing")
                if total_value < 0 {
                    total_value = tot
                    let okhandler = {
                        (action: UIAlertAction)->Void in
                    }
                    let alert = UIAlertController(title: "Warning!", message: "Please check the amount you Entered", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                    self.present(alert, animated: true, completion: nil)
                    amount.text=""
                }else{
                    if am > 0{
                        inc_value = inc_value + am
                    }else{
                        exp_value = exp_value + (am * -1)
                    }
                    inc.text="₹ \(inc_value)"
                    exp.text="₹ \(exp_value)"
                    total.text="₹ \(total_value)"
                    UserManager.shared.users[ind].transactions[edit_ind].amount = am
                    UserManager.shared.users[ind].transactions[edit_ind].description=des.text!
                    amount.text=""
                    des.text=""
                    edit.setOn(false, animated: false)
                    tableview.reloadData()
                }
            }else{
                let okhandler = {
                    (action: UIAlertAction)->Void in
                }
                let alert = UIAlertController(title: "Warning!", message: "Please Enter a valid amount", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                self.present(alert, animated: true, completion: nil)
                amount.text=""
            }
        }
        var val = Float(Float(exp_value)/Float(inc_value))
        progressbar.progress = val
        if tracki_on != 0{
            tracking()
        }
    }
    
    @IBAction func new_trans_new(_ sender: Any) {
        var ramount = amount.text!
        if !edit.isOn{
            if var am = Int(ramount){
                new_t.amount = -am
                new_t.description=des.text!
                amount.text=""
                des.text=""
                if new_t.description == ""{
                    new_t.description="description not given"
                }
                var ctotal = total_value
                
//                if (ctotal + am) < 0 {
//                    let okhandler = {
//                        (action: UIAlertAction)->Void in
//                    }
//                    let alert = UIAlertController(title: "Warning!", message: "OOOps you dont have that much amount", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
//                    self.present(alert, animated: true, completion: nil)
//                    amount.text=""
//                }else{
                    total_value = total_value + am
//                    if am > 0{
//                        inc_value = inc_value + am
//                    }else{
                        exp_value = exp_value + (am * -1)
//                    }
                    inc.text="₹ \(inc_value)"
                    exp.text="₹ \(exp_value)"
                    total.text="₹ \(total_value)"
                    UserManager.shared.users[ind].transactions.append(new_t)
                    tableview.reloadData()
//                }
            }else{
                let okhandler = {
                    (action: UIAlertAction)->Void in
                }
                let alert = UIAlertController(title: "Warning!", message: "Please Enter a valid amount", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                self.present(alert, animated: true, completion: nil)
                amount.text=""
            }
        }else{
            if var am = Int(ramount){
                var tot = total_value
                print("\(total_value) in editing")
                total_value = total_value + am
                print("\(total_value) in editing")
                if total_value < 0 {
                    total_value = tot
                    let okhandler = {
                        (action: UIAlertAction)->Void in
                    }
                    let alert = UIAlertController(title: "Warning!", message: "Please check the amount you Entered", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                    self.present(alert, animated: true, completion: nil)
                    amount.text=""
                }else{
                    if am > 0{
                        inc_value = inc_value + am
                    }else{
                        exp_value = exp_value + (am * -1)
                    }
                    inc.text="₹ \(inc_value)"
                    exp.text="₹ \(exp_value)"
                    total.text="₹ \(total_value)"
                    UserManager.shared.users[ind].transactions[edit_ind].amount = am
                    UserManager.shared.users[ind].transactions[edit_ind].description=des.text!
                    amount.text=""
                    des.text=""
                    edit.setOn(false, animated: false)
                    tableview.reloadData()
                }
            }else{
                let okhandler = {
                    (action: UIAlertAction)->Void in
                }
                let alert = UIAlertController(title: "Warning!", message: "Please Enter a valid amount", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: okhandler))
                self.present(alert, animated: true, completion: nil)
                amount.text=""
            }
        }
        var val = Float(Float(exp_value)/Float(inc_value))
        progressbar.progress = val
        if tracki_on != 0{
            tracking()
        }
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Calculate the new total income after deletion
            let deletedAmount = UserManager.shared.users[ind].transactions[indexPath.row].amount
            let newTotalIncome = total_value - deletedAmount

            // Check if new total income is non-negative
            print(newTotalIncome)
            if newTotalIncome >= 0 {
                // Allow deletion and update values
                //inc_value = newTotalIncome
                total_value -= deletedAmount
                UserManager.shared.users[ind].transactions.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                print("deleting amount \(deletedAmount)")
                print("newtotalincome \(newTotalIncome)")
                total_value = newTotalIncome
                if deletedAmount < 0{
                    exp_value = exp_value + deletedAmount
                }else{
                    inc_value = inc_value - deletedAmount
                }
                inc.text="₹ \(inc_value)"
                exp.text="₹ \(exp_value)"
                total.text="₹ \(total_value)"
                var val = Float(Float(exp_value)/Float(inc_value))
                progressbar.progress = val
            } else {
                // Prevent deletion and show an alert
                let alert = UIAlertController(title: "Warning!", message: "Deleting this transaction cannot be done!!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        

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
            tableView.deselectRow(at: indexPath, animated: true)
            let selectedCell = tableView.cellForRow(at: indexPath)
            selectedCell?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            UIView.animate(withDuration: 0.3) {
                selectedCell?.transform = .identity
            }
            print("\(total_value) in selcted")
            edit_ind=ind_table
        }else{
            tableView.deselectRow(at: indexPath, animated: true)
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 0, 0)
            let selectedCell = tableView.cellForRow(at: indexPath)
            selectedCell?.layer.transform = rotationTransform
                       UIView.animate(withDuration: 0.1) {
                           selectedCell?.layer.transform = CATransform3DIdentity
                       }
            performSegue(withIdentifier: "more", sender: nil)
        }
       
       
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var obj = segue.destination as! moredataViewController
        obj.am_value = UserManager.shared.users[ind].transactions[ind_table].amount
        obj.am = "₹ \(UserManager.shared.users[ind].transactions[ind_table].amount)"
        obj.des = "\(UserManager.shared.users[ind].transactions[ind_table].description)"
        obj.modalPresentationStyle = .fullScreen
    }
    
//    var path:String!
//    var urlpath:URL!
//    var audioplayer:AVPlayer!
//    var playercontroller = AVPlayerViewController()
//    

    @IBAction func video(_ sender: Any) {
//        path = Bundle.main.path(forResource: "video", ofType: "mov")
//        urlpath = URL(fileURLWithPath: path)
//        
//        audioplayer = AVPlayer(url: urlpath)
//        playercontroller.player=audioplayer
//        
//        present(playercontroller, animated: true, completion: nil)
//        playercontroller.player?.play()
        
    }
    
    
   
    @IBOutlet weak var start_tracking_outlet: UIButton!
    
    var tracki = 0
    var tracki_on = 0
    var tracki_exp = 0
    @IBAction func start_t(_ sender: Any) {
        if tracki_on != 0{
            let alert = UIAlertController(title: "OOOps", message: "Tracking is still going on if u want it to stop click on Reset Tracking", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }else{
            start_tracking_outlet.backgroundColor = UIColor.red
            track.text = "₹\(tracki)"
            tracki_exp=UserManager.shared.users[ind].transactions.count
            tracki_on=1
        }
    }
    
    @IBAction func reset_t(_ sender: Any) {
        tracki_on = 0
        track.text = ""
        start_tracking_outlet.backgroundColor = UIColor.clear
    }
    var track_after = 0
    func tracking(){
        for trans in UserManager.shared.users[ind].transactions{
            if trans.amount < 0 && track_after >= tracki_exp {
                tracki = tracki + trans.amount
                print(trans.amount)
            }
            track_after = track_after + 1
        }
        track.text = "₹\(tracki)"
        track_after = 0
        tracki=0
    }
    
    
}
