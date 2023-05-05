//
//  GiftCategoryTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/08.
//

import UIKit

class GiftCategoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var prodcutNameLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
