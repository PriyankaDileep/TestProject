//
//  MQCustomTableViewCell.swift
//  MobileQuake
//
//  Created by Priyanka Dileep on 17/02/2017.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import UIKit

class MQCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var magnitudeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
