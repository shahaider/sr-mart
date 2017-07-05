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

    var checkTable = ["pana","cloud"]
    var allData = [product]()
    
    // FIREBASE VARIABLE

    
    var dbRef : DatabaseReference?
    var dbHandle : DatabaseHandle?

  
    // VARIABLE TO SAVE SEGUE PASSED VALUE
    var segueData = ""
   
    // TABLEVIEW NAME
    @IBOutlet weak var list: UITableView!
    
  

    // MAIN FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CHECK PASSED VALUE
        print(segueData)
        product.selectCat = segueData

        list.delegate = self
        list.dataSource = self

        dbRef = Database.database().reference()
        dbHandle = dbRef?.child("inventory").child(segueData).observe(.childAdded, with: { (snapshot) in
            
            let fetchKey = snapshot.key as? String
            let fetchData = snapshot.value as? [ String : Any ]
           // check retrieving data
         
            
//            print("*****DATA******")
//            print(fetchData)

//             create related list
            if let actualData = fetchData {
//                print("*****ActualData******")
//                print(actualData)
                let title = fetchKey!.uppercased()
                let link = actualData["image"] as! String
                let quantities = actualData["quantity"] as! Int
                let unitPrice = actualData["price"] as! Int
            
                let productList: product = product(productTitle: title, productImage: link, productQuantity: quantities, productPrice: unitPrice)
                
                product.allData.append(productList)
                self.allData.append(productList)
                
                // Checking data stored
//                print("*****ALLData (check pt 1 inside)******")
                //                            print(product.allData)
//                                            print(self.allData)


            }
            self.list.reloadData()
            // Checking data stored
//                            print("*****ALLData (check pt 1 out)******")
                            print(product.allData)
//                            print(self.allData)
        })
    }
  
    
    // defining number of Row
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return product.allData.count
    }
    
    // defining cell in a row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! productTableViewCell
        
//                        print("*****ALLData (check pt 2)******")
//                       print(allData)

        // create individal variable from array
//        let image = product.allData[indexPath.row].productImage
        
        let quantity = product.allData[indexPath.row].productQuantity
        
        let price = product.allData[indexPath.row].productPrice
        
        cell.productTitle.text? = product.allData[indexPath.row].productTitle
        cell.productQuantity.text = String(quantity)
        cell.productPrice.text = String(price)
        

        
        // import image via url String
        let imageUrl = URL(string: product.allData[indexPath.row].productImage)
        let session = URLSession.shared
//        print("check 1")
//        print(product.allData[indexPath.row].productImage)
//        print("check 2")
//        print(imageUrl)
        
        let task = session.dataTask(with: imageUrl!) { (data, response, error) in
            
//            print (error)
            
            
            if data != nil{
            
                DispatchQueue.main.async(execute: { 
                    cell.productImages.image = UIImage(data: data!)

                })
            }
        }
        task.resume()
        
        return cell
        
        
    
    }
    
    
    
    @IBAction func signoutButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         product.selectedIndex = indexPath.row
        performSegue(withIdentifier: "orderSegue", sender: self)
    }
   

}
