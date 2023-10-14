//
//  AuthorViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 14/10/23.
//

import UIKit

class AuthorViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var rating: UISlider!
    @IBOutlet weak var rate_value: UILabel!
    @IBOutlet weak var review: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        img.image = UIImage(named: "Author")
    }
    
    
    @IBAction func rate(_ sender: Any) {
        rate_value.text="\(Int(rating.value))"
    }
    
    @IBAction func submit(_ sender: Any) {
        if Int(rating.value) == 1{
            review.text="Sorry for what went wrong we will improve it"
        }else if Int(rating.value) == 2{
            review.text="we are improving"
        }else if Int(rating.value) == 3{
            review.text="we will improve"
        }else if Int(rating.value) == 4{
            review.text="Thanks"
        }else{
            review.text="Thank you so much"
        }
    }
    
    
    @IBAction func ack(_ sender: Any) {
        rate_value.text="0"
        review.text="!"
        dismiss(animated: true, completion: nil)
    }
    

}
