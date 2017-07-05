//
//  orderViewController.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 05/07/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import FirebaseDatabase

class orderViewController: UIViewController {

    // Firebase variable
    
    var ref : DatabaseReference?
    
    
    @IBOutlet weak var productTitle: UILabel!
   
    @IBOutlet weak var incdecButton: UIStepper!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Quantity: UITextField!
    
    var index = product.selectedIndex
    
    var demand = 0.0
    var difference:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign value to outlet
        
        productTitle.text = product.allData[index].productTitle
        
        let imageUrl = URL(string: product.allData[index].productImage)
        let session = URLSession.shared
        
        let task = session.dataTask(with: imageUrl!) { (data, response, error) in
            
            if data != nil{
            DispatchQueue.main.async(execute: { 
                self.Image.image = UIImage(data: data!)
            })
                
            }
        }
        task.resume()
    }

  
    
    @IBAction func IncDec(_ sender: Any) {
    let available = Double(product.allData[index].productQuantity)
        if demand <= available{
        demand = incdecButton.value
        Quantity.text? = String(demand)
        
            difference = available - demand
           
        }
       
    }

    @IBAction func submitButton(_ sender: Any) {
      
        ref = Database.database().reference()

        let firstChild = product.selectCat
        let secondChild = (product.allData[index].productTitle).lowercased()
        
        print (firstChild + secondChild)
        ref?.child("inventory").child(firstChild).child(secondChild).child("quantity").setValue(Int(difference))
        
        let totalAmount = String(demand * Double(product.allData[index].productPrice))
        
       
        print(totalAmount)
        // Create VC
        let alert = UIAlertController(title: "ORDER DETAIL", message: totalAmount, preferredStyle: .alert)
      
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    

}
