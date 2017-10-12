//
//  TableViewCell.swift
//  ImageFirebaseTest
//
//  Created by Corporativo López Navarro on 11/10/17.
//  Copyright © 2017 DSI. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameHotelLabel: UILabel!
    
    @IBOutlet weak var hotelImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
