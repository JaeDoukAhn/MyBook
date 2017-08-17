//
//  ViewController.swift
//  MyBook
//
//  Created by ktds 20 on 2017. 8. 17..
//  Copyright © 2017년 CJON, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerProtocol {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if let vc = segue.destination as? LoginViewController {
            vc.delegate = self
        }
        
     }
    
    func send(withId:String, password:String){
        self.idLabel.text = withId
        self.pwLabel.text = password
    }
    
}

