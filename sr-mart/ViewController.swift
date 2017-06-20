//
//  ViewController.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 20/06/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, FBerror) in
            if user != nil{
            
            self.performSegue(withIdentifier: "mainVCSegue", sender: nil)
                
            }
            
            else{
                self.errorLabel.text = "user or password is incorrect"
            }
        }
    }
    

   

}

