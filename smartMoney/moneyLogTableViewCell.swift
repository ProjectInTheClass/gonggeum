//
//  moneyLogTableViewCell.swift
//  smartMoney
//
//  Created by cscoi052 on 2018. 8. 1..
//  Copyright © 2018년 cscoi052. All rights reserved.
//

import UIKit

class moneyLogTableViewCell: UITableViewCell {

    @IBOutlet weak var when: UILabel!
    @IBOutlet weak var why: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
