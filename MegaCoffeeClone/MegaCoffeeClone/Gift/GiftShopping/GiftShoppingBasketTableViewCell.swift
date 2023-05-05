//
//  GiftShoppingBasketTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by 원준연 on 2022/11/17.
//

import UIKit

class GiftShoppingBasketTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageview: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var minusView: UIView!
    @IBOutlet weak var plusView: UIView!
    @IBOutlet weak var numberOfLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var cancelView: UIView!
    
    var cancelDelegate: CanCelDelegate?
    var row = 0
    var number = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        minusView.layer.cornerRadius = minusView.frame.width / 2
        plusView.layer.cornerRadius = plusView.frame.width / 2
        cancelView.layer.cornerRadius = cancelView.frame.width / 2
        let concernCancelGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedCancel(_:)))
        cancelView.addGestureRecognizer(concernCancelGesture)
        
        let concernPlusGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedPlus(_:)))
        plusView.addGestureRecognizer(concernPlusGesture)
        
        let concernMinusGesture: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tappedMinus(_:)))
        minusView.addGestureRecognizer(concernMinusGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func tappedCancel(_ gesture: UITapGestureRecognizer) {
        cancelDelegate?.cancelClicked(index: row)
    }
    
    @objc func tappedPlus(_ gesture: UITapGestureRecognizer) {
        number = number + 1
        if number > 20 {
            number = 20
        }
        
        
        
        numberOfLabel.text = "\(number)"
        
    }
    
    @objc func tappedMinus(_ gesture: UITapGestureRecognizer) {
        number = number - 1
        if number < 1 {
            number = 1
        }
        
        numberOfLabel.text = "\(number)"
    }
       
    
}
