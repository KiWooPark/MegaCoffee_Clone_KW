//
//  OrderProductCollectionViewCell.swift
//  MegaCoffeeClone
//
//  Created by PKW on 2022/11/01.
//

import UIKit

class OrderProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var soldOutView: UIView!
    @IBOutlet weak var soldOutLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        soldOutView.isHidden = false
        soldOutLabel.isHidden = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        soldOutView.layer.cornerRadius = productImageView.frame.height / 2
        //productImageView.layer.cornerRadius = productImageView.frame.height / 2
    }
    
    func configData(data: Menu1.MenuModel1) {
        productImageView.image = data.image != nil ? UIImage(named: data.image ?? "") : UIImage()
        
        productNameLabel.text = data.name ?? ""
        priceLabel.text = "\(data.price ?? 0)원"
        
        soldOutView.isHidden = data.soldOut ?? false ? false : true
        soldOutLabel.isHidden = data.soldOut ?? false ? false : true
    }
}




