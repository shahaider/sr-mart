//
//  testViewController.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 05/07/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase

class testViewController: UIViewController {

    var ref: DatabaseReference?
    var handle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        handle = ref?.child("inventory").child("Fruit").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.key as? String
            
            print(value!)
           
        })
    }

  
    


}
