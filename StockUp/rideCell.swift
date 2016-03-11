//
//  rideCell.swift
//  StockUp
//
//  Created by Pranav Achanta on 3/10/16.
//  Copyright © 2016 Franky Liang. All rights reserved.
//

import UIKit

class rideCell: UITableViewCell {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var spotsLeftLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func onRequest(sender: AnyObject) {
        // Send Back a Call Here --> Part of next submission!!
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
