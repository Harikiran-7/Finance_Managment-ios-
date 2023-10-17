//
//  moredataViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 14/10/23.
//

import UIKit

class moredataViewController: UIViewController {
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var dex: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var imgs : [UIImage] = [UIImage(named:"f1")!,UIImage(named:"f2")!,UIImage(named:"f3")!,UIImage(named:"f4")!,UIImage(named:"f5")!,UIImage(named:"f6")!,UIImage(named:"f7")!,UIImage(named:"f8")!,]
    
    var am=""
    var des=""
    var am_value=0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading th
        image.image = UIImage(named: "f1")
        image.animationImages = imgs
        image.animationDuration = 25
        image.animationRepeatCount = 0
        image.startAnimating()
        
        amount.text=am
        dex.text=des
        if am_value > 0{
            company.textColor=UIColor.green
            quote.textColor=UIColor.green
        }else{
            company.textColor=UIColor.red
            quote.textColor=UIColor.red
        }
        
    }
    

    @IBAction func back(_ sender: Any) {
        amount.text=""
        dex.text=""
        dismiss(animated: true, completion: nil)
    }
    
    
    

}
