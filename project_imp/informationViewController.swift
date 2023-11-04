//
//  informationViewController.swift
//  project_imp
//
//  Created by Hari Kiran Nagandla on 01/11/23.
//

import UIKit

class informationViewController: UIViewController {
    @IBOutlet weak var slider_value: UISegmentedControl!
    @IBOutlet weak var web1: UIWebView!
    @IBOutlet weak var web2: UIWebView!
    
    var web1_link1 = "https://www.youtube.com/watch?v=Zgnq1YHONNM&pp=ygUZZmluYW5jZSBtYW5hZ21lbnQgZW5nbGlzaA%3D%3D"
    var web1_link2 = "https://www.youtube.com/watch?v=JgOecvGJj7E&pp=ygUSd2F5cyB0byBzYXZlIG1vbmV5"
    var web2_link1 = "https://www.youtube.com/results?search_query=finance+managment+english"
    var web2_link2 = "https://www.youtube.com/results?search_query=ways+to+save+money"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var url_string_1 = URL(string:"\(web1_link1)")
        var url_string_2 = URL(string: "\(web2_link1)")
        
        var url_req_1 = URLRequest(url: url_string_1!)
        var url_req_2 = URLRequest(url: url_string_2!)
        
        web1.loadRequest(url_req_1)
        web2.loadRequest(url_req_2)
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func slider_action(_ sender: Any) {
        
        if slider_value.selectedSegmentIndex == 0{
            
            var url_string_1 = URL(string:"\(web1_link1)")
            var url_string_2 = URL(string: "\(web2_link1)")
            
            var url_req_1 = URLRequest(url: url_string_1!)
            var url_req_2 = URLRequest(url: url_string_2!)
            
            web1.loadRequest(url_req_1)
            web2.loadRequest(url_req_2)
        }else{
            var url_string_1 = URL(string:"\(web1_link2)")
            var url_string_2 = URL(string: "\(web2_link2)")
            
            var url_req_1 = URLRequest(url: url_string_1!)
            var url_req_2 = URLRequest(url: url_string_2!)
            
            web1.loadRequest(url_req_1)
            web2.loadRequest(url_req_2)
        }
        
        
    }
    
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
