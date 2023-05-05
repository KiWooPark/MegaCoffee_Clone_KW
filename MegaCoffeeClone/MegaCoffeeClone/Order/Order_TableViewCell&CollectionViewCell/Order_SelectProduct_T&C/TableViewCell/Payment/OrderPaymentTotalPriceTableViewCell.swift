//
//  OrderPaymentTotalPriceTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/12/14.
//

import UIKit

protocol OrderPaymentTotalPriceTableViewCellDelegate {
    func expandWarningSection(isOpen: Bool)
}

class OrderPaymentTotalPriceTableViewCell: UITableViewCell {

    
    var delegate: OrderPaymentTotalPriceTableViewCellDelegate?
    var isOpen = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapWarningButton(_ sender: Any) {
        isOpen.toggle()
        delegate?.expandWarningSection(isOpen: isOpen)
    }
    
}
