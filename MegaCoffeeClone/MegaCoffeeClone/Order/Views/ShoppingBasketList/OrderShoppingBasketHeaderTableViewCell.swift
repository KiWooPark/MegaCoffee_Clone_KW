//
//  OrderShoppingBasketHeaderTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/12/12.
//

import UIKit

// MARK: [Class or Struct] ----------
class OrderShoppingBasketHeaderTableViewCell: UITableViewCell {

    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: [Override] ----------

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
