//
//  OrderShoppingBasketOrderTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/30.
//

import UIKit

// MARK: [Class or Struct] ----------
class OrderShoppingBasketOrderTableViewCell: UITableViewCell {

    // MARK: [@IBOutlet] ----------
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var readyButton: UIButton!
    
    // MARK: [Override] ----------
    override func awakeFromNib() {
        super.awakeFromNib()

        orderButton.layer.cornerRadius = 10
        readyButton.layer.cornerRadius = 10
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: [Function] ----------
    func configButton(isOn: Bool) {
        if isOn {
            readyButton.isHidden = true
        } else {
            orderButton.isHidden = true
        }
    }

    

}
