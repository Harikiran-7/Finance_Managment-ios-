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
    
    var am=""
    var des=""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        amount.text=am
        dex.text=des
    }
    

    @IBAction func back(_ sender: Any) {
        amount.text=""
        dex.text=""
        dismiss(animated: true, completion: nil)
    }
    
    

}
