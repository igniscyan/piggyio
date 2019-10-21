//
//  CustomTableViewCell.swift
//  Piggy.io
//
//  Created by Brandon Clark on 10/7/19.
//  Copyright © 2019 cyanware. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var stashNameLabel: UILabel!
    @IBOutlet weak var stashCashLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
