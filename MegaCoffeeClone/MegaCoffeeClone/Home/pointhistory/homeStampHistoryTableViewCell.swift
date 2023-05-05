//
//  stampHistoryTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 이지훈 on 2022/11/28.
//

import UIKit

class homeStampHistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stampPlace: UILabel!
    
    @IBOutlet weak var stampWhen: UILabel!
    
    @IBOutlet weak var stampName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
