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
    
//    var ref: DatabaseReference?
//    var postData = [String]()
//    var dbHandle: DatabaseHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!) { (user, FBerror) in
            if user != nil{
                
               
//            self.getdetail()
            self.performSegue(withIdentifier: "mainVCSegue", sender: nil)
                
            }
            
            else{
                self.errorLabel.text = "user or password is incorrect"
            }
        }
    }
    
//    func getdetail(){
//        
//        ref = Database.database().reference()
//        dbHandle = ref?.child("inventory").observe(.value, with: { (snapshot) in
//            let postValue = snapshot.value as? [String:String]
//            
//            if let data = postValue {
//             
//                let imageLink = data["image"]
//                print("************")
//                print(imageLink)
//                print("************")
//
//            
//            }
//        })
    
//    }
   

}

