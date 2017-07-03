//
//  categoryViewController.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 21/06/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit

class categoryViewController: UIViewController {
    @IBOutlet weak var wardrobeButton: UIButton!
    @IBOutlet weak var fruitButton: UIButton!
    @IBOutlet weak var stationaryButton: UIButton!
    @IBOutlet weak var electronicButton: UIButton!

    var selected: String?
    enum buttonType :Int {
        case wardrobe = 0, fruit, stationary, electronic
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cButton(_ sender: UIButton) {
        
        switch (buttonType(rawValue: sender.tag)!) {
        case .wardrobe:
            selected = "wardrobe"
            performSegue(withIdentifier: "tableSegue", sender: self)
        case .fruit:
            selected = "Fruit"
            performSegue(withIdentifier: "tableSegue", sender: self)
        case .stationary:
            selected = "Stationary"
            performSegue(withIdentifier: "tableSegue", sender: self)
        case .electronic:
            selected = "Electronics"
            performSegue(withIdentifier: "tableSegue", sender: self)
       
        }
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tableSegue"{
        
            let dest = segue.destination as! listViewController
            dest.segueData = selected!
            
        }
    }

    @IBAction func signoutButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
