//
//  OrderProductTableViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/08.
//

import UIKit

class OrderProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var soldOutView: UIView!
    @IBOutlet weak var soldOutLabel: UILabel!
    
    @IBOutlet weak var productImageViewHeight: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        soldOutView.isHidden = true
        soldOutLabel.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        productImageViewHeight.constant = 100
        soldOutView.layer.cornerRadius = productImageView.frame.height * 0.5
        productImageView.layer.cornerRadius = productImageView.frame.height * 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configData(menu: Menu1.MenuModel1) {
        productImageView.image = UIImage(named: menu.image ?? "")
        productNameLabel.text = "[\(menu.category ?? "")] \(menu.name ?? "")"
        productPriceLabel.text = "\(menu.price ?? 0)"
        
        soldOutView.isHidden = menu.soldOut == true ? false : true
        soldOutLabel.isHidden = menu.soldOut == true ? false : true
    }
}
