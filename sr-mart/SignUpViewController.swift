//
//  SignUpViewController.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 20/06/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func submitButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            
            if user != nil{
          self.dismiss(animated: true, completion: nil)
            }
        }
    
    }

}
