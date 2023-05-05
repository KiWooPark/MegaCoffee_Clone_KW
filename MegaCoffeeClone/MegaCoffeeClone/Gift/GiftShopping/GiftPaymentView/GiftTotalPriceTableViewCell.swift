//
//  GiftTotalPriceTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/30.
//

import UIKit

class GiftTotalPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var totalPaymentLabel: UILabel!
    
    let coreDataManager = CoreDataManager.shared
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        var totalNumber = 0
        for item in coreDataManager.itemArray {
            totalNumber += Int(item.total)
        }
        totalPriceLabel.text = "\(totalNumber)원"
        totalPaymentLabel.text = "\(totalNumber)원"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
