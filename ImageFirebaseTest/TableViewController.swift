//
//  ViewController.swift
//  ImageFirebaseTest
//
//  Created by Corporativo López Navarro on 05/10/17.
//  Copyright © 2017 DSI. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class TableViewController: UITableViewController {

    var arrayTest = [String]()
    var imageURLs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageURLs = ["https://a1.cdn-hotels.com/cos/production124/d1118/c983b4e0-86ea-11e6-a741-0242ac110051.jpg", "https://firebasestorage.googleapis.com/v0/b/imagetest-d70ee.appspot.com/o/Viaje-a-Cancun-Preguntas-Frecuentes.jpg?alt=media&token=fa001ff6-3f6e-4d56-b6c8-7845dd17950e"]
        
        tableView.dataSource = self
        tableView.delegate = self
        
        arrayTest.append("Royal")
        arrayTest.append("Riu")
        arrayTest.append("Reef")
           }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        //return imageURLs.count
        return arrayTest.count
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let imageView = cell?.viewWithTag(1) as! UIImageView
        
        imageView.sd_setImage(with: URL(string: imageURLs[indexPath.row]))
        
        
 
        
        return cell!
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

