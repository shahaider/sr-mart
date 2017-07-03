//
//  listViewController.swift
//  sr-mart
//
//  Created by Syed Shahrukh Haider on 21/06/2017.
//  Copyright © 2017 Syed Shahrukh Haider. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class listViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // FIREBASE VARIABLE

    
    //    var allData = [product]()
    var dbRef : DatabaseReference?
    var dbHandle : DatabaseHandle?

  
    // VARIABLE TO SAVE SEGUE PASSED VALUE
    var segueData = ""
    
   
    // TABLEVIEW NAME
    @IBOutlet weak var list: UITableView!
    
    var table = ["shahrukh","hiba"]   // check table
   
    
    
    // MAIN FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CHECK PASSED VALUE
        print(segueData)
        
        list.delegate = self
        list.dataSource = self

        dbRef = Database.database().reference()
        dbHandle = dbRef?.child("inventory").child(segueData).observe(.childAdded, with: { (snapshot) in
            
            let fetchData = snapshot.value as? [ String : Any ]
           // check retrieving data
         
            
//            print("*****DATA******")
//            print(fetchData)

//             create related list
            if let actualData = fetchData {
//                print("*****ActualData******")
//                print(actualData)
                
                let link = actualData["image"] as! String
                let quantities = actualData["quantity"] as! Int
                let unitPrice = actualData["price"] as! Int
            
                let productList: product = product(productImage: link, productQuantity: quantities, productPrice: unitPrice)
                
                product.allData.append(productList)
//
            }
        })
    }
  
    
    // defining number of Row
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return product.allData.count
    }
    
    // defining cell in a row
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
     let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! productTableViewCell
        
        
        print("*****ALLData******")
        print(product.allData)
        
        let image = product.allData[indexPath.row].productImage
        print ("image value = " + image)

        let quantity = product.allData[indexPath.row].productQuantity
        print ("quantity value = \(quantity)")

        let price = product.allData[indexPath.row].productPrice
        print ("price value = \(price)")

        cell.productLabel.text = String (quantity)
        cell.productPrice.text = String (price)
//        cell.productImages.image =
        return cell
    }
  
    @IBAction func signoutButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }

}
