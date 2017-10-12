//
//  HotelesViewController.swift
//  ImageFirebaseTest
//
//  Created by Corporativo López Navarro on 11/10/17.
//  Copyright © 2017 DSI. All rights reserved.
//

import UIKit
import Firebase


class HotelesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref: DatabaseReference!

    var arrayTest = [String]()
    var imageURLs = [String]()
    var arrayTitulos = [String]()
    
    
    @IBOutlet weak var hotelesTableView: UITableView!
    @IBOutlet weak var IndicatorView: UIView!
    @IBOutlet weak var activityIndicactorHotels: UIActivityIndicatorView!
    
    override func viewDidAppear(_ animated: Bool) {
       
      
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        IndicatorView.isHidden = false
        activityIndicactorHotels.startAnimating()
        
       
        let nibName = UINib(nibName: "TableViewCell", bundle: Bundle.main)
        
        hotelesTableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        
        
        hotelesTableView.dataSource = self
        hotelesTableView.delegate = self
        
        readJSON() { ready in
            
            if ready == "Ready" {
            
           
                self.readJSONTitulos(){ ready in
                
                    self.hotelesTableView.reloadData()
                    
                    self.IndicatorView.isHidden = true
                    self.activityIndicactorHotels.stopAnimating()

                
                    print(self.arrayTitulos)
                   // print(self.imageURLs)
            
                    
                }
            }
         
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func readJSONTitulos(completion: @escaping (String)-> Void){
    
        // check in Json "Doctor"
        let ref = Database.database().reference().child("Titulos");
        
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            // Get user value
            guard let dataInJSON = snapshot.value as? NSDictionary  else {
                
                print("no data in daba base Information")
                
                
                completion("No")
                
                return
            }
            
            
            
            guard let titulo1  = dataInJSON["titulo1"]  else {
                
                completion("No")
                return
            }
            
            print(titulo1 as! String)
            
            guard let titulo2 = dataInJSON["titulo2"]  else {
                
                completion("No")
                return
            }
            
          //  print(titulo2 as! String)
           
            
            guard let titulo3 = dataInJSON["titulo3"]  else {
                
                completion("No")
                return
            }
            
          //  print(titulo3 as! String)
  

            self.arrayTitulos.append(titulo1 as! String)
            self.arrayTitulos.append(titulo2 as! String)
            self.arrayTitulos.append(titulo3 as! String)
            
            completion("Ready")
        
            }) { (error) in
            print(error.localizedDescription)
            // self.alertGeneral(errorDescrip: error.localizedDescription, information: self.strInfo)
    
    
            }// end json for Doctor
    
    }


    func readJSON(completion: @escaping (String) -> Void) {
    
        
        
        
            // check in Json "Doctor"
        let ref = Database.database().reference().child("Hoteles");
        
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                
                // Get user value
                guard let dataInJSON = snapshot.value as? NSDictionary  else {
                    
                    print("no data in daba base Information")
                    
                    
                    completion("No")
                    
                    return
                }
                
                
                
                guard let url1 = dataInJSON["url1"]  else {
                    
                    completion("No")
                    return
                }
                
                //print(url1 as! String)
                guard let url2 = dataInJSON["url2"]  else {
                    
                    completion("No")
                    return
                }
                
                
                guard let url3 = dataInJSON["url3"]  else {
                    
                    completion("No")
                    return
                }
                
                
                self.imageURLs.append(url1 as! String)
                self.imageURLs.append(url2 as! String)
                self.imageURLs.append(url3 as! String)
                
                
                
                completion("Ready")
                
                
                
                
            }) { (error) in
                print(error.localizedDescription)
               // self.alertGeneral(errorDescrip: error.localizedDescription, information: self.strInfo)
                
                
                }// end json for Doctor
            
    }
    
    
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
       // return arrayTest.count
        
        return imageURLs.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = hotelesTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
        guard let newCell = cell as? TableViewCell else  {return cell}
        
        let datosCelda = arrayTitulos[indexPath.row]
        
        newCell.nameHotelLabel.text = datosCelda
        
        newCell.hotelImageView.sd_setImage(with: URL(string: imageURLs[indexPath.row]))
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
